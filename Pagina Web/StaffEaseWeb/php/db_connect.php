<?php
$servername = "localhost";
$username = "root"; // Cambia si usas otro usuario
$password = ""; // Cambia si usas otra contraseña
$database = "staffeaseappyweb";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $database);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
?>
