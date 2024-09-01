<?php
include 'db_connect.php'; // Incluye el archivo de conexión

// Obtener datos del formulario
$usuario_id = $_POST['usuario_id'];
$nombre = $_POST['nombre'];
$apellido_paterno = $_POST['apellido_paterno'];
$apellido_materno = $_POST['apellido_materno'];
$correo = $_POST['correo'];
$usuario = $_POST['usuario'];
$contrasena = $_POST['contrasena'];

// Verificar si se proporcionó una nueva contraseña
if (!empty($contrasena)) {
    // Encriptar la contraseña antes de guardarla
    $contrasena_hashed = password_hash($contrasena, PASSWORD_DEFAULT);

    // Actualizar la información del usuario con la nueva contraseña encriptada
    $sql = "UPDATE usuarios SET nombre = ?, apellido_paterno = ?, apellido_materno = ?, correo_electronico = ?, usuario = ?, contraseña = ? WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssssi", $nombre, $apellido_paterno, $apellido_materno, $correo, $usuario, $contrasena_hashed, $usuario_id);
} else {
    // Actualizar la información del usuario sin cambiar la contraseña
    $sql = "UPDATE usuarios SET nombre = ?, apellido_paterno = ?, apellido_materno = ?, correo_electronico = ?, usuario = ? WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssssi", $nombre, $apellido_paterno, $apellido_materno, $correo, $usuario, $usuario_id);
}

if ($stmt->execute()) {
    echo "<script>alert('Datos Actualizados Correctamente.'); window.location.href='../editar.html';</script>";
} else {
    echo "<script>alert('Error al Actualizar Datos.'); window.location.href='../editar.html';</script>";
}

$conn->close();
?>
