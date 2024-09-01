<?php
// Incluir el archivo de conexión a la base de datos
include 'db_connect.php'; // Asegúrate de que este archivo contiene la conexión a tu BD

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtener y sanitizar los datos del formulario
    $usuario = trim($_POST['usuario']);
    $correo = trim($_POST['correo']);
    $contrasena = trim($_POST['contrasena']);
    $nombre = trim($_POST['nombre']);
    $apellido_paterno = trim($_POST['apellido_paterno']);
    $apellido_materno = trim($_POST['apellido_materno']);

    // Encriptar la contraseña antes de almacenarla en la base de datos
    $contrasena_encriptada = password_hash($contrasena, PASSWORD_DEFAULT);

    // Preparar la consulta SQL para insertar un nuevo usuario
    $stmt = $conn->prepare("INSERT INTO usuarios (nombre, apellido_paterno, apellido_materno, correo_electronico, usuario, contraseña) VALUES (?, ?, ?, ?, ?, ?)");
    if ($stmt === false) {
        die("Error en la preparación de la consulta: " . $conn->error);
    }
    
    // Enlazar los parámetros en el orden correcto
    $stmt->bind_param("ssssss", $nombre, $apellido_paterno, $apellido_materno, $correo, $usuario, $contrasena_encriptada);

    // Ejecutar la consulta
    if ($stmt->execute()) {
        echo "<script>alert('Usuario Registrado Correctamente.'); window.location.href='../registro.html';</script>";
    } else {
        echo "<script>alert('Usuario No Registrado.'); window.location.href='../registro.html';</script>";
    }

    // Cerrar la declaración y la conexión
    $stmt->close();
    $conn->close();
} else {
    echo "Método de solicitud no válido.";
}
?>
