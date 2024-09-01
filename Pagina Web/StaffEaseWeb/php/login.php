<?php
session_start(); // Inicia la sesión

// Incluir el archivo de conexión
include 'db_connect.php'; // Ajusta la ruta si es necesario

// Verificar si se ha enviado el formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitizar la entrada del usuario
    $usuario = trim($_POST['usuario']);
    $contrasena = trim($_POST['contrasena']);

    // Preparar y ejecutar la consulta
    $stmt = $conn->prepare("SELECT * FROM loginpage WHERE username = ?");
    if ($stmt === false) {
        die("Error en la preparación de la consulta: " . $conn->error);
    }
    $stmt->bind_param("s", $usuario);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 1) {
        $row = $result->fetch_assoc();

        // Verificar la contraseña
        if ($contrasena === $row['password']) { // Verificación directa de la contraseña
            // Autenticación exitosa
            $_SESSION['usuario'] = $usuario;
            header("Location: ../index.html"); // Redirigir al índice
            exit();
        
        } else {
            // Contraseña incorrecta
            echo "<script>alert('Contraseña incorrecta.'); window.location.href='../login.html';</script>";
        }
    } else {
        // Usuario no encontrado
        echo "<script>alert('Usuario no encontrado.'); window.location.href='../login.html';</script>";
    }

    // Cerrar la declaración y la conexión
    $stmt->close();
}

$conn->close();
?>
