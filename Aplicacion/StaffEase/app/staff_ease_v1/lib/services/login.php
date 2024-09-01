<?php
include 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $usuario = $_POST['usuario'];
    $contraseña = $_POST['contraseña'];

    // Prevenir inyección SQL
    $usuario = $conn->real_escape_string($usuario);
    $contraseña = $conn->real_escape_string($contraseña);

    $sql = "SELECT * FROM usuarios WHERE usuario = '$usuario' AND contraseña = '$contraseña'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // El usuario existe
        echo json_encode(["status" => "success", "message" => "Login successful"]);
    } else {
        // El usuario no existe
        echo json_encode(["status" => "error", "message" => "Usuario o contraseña incorrectos"]);
    }
}
$conn->close();
?>
