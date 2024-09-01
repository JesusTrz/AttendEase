<?php
include 'db_connect.php'; // Incluye el archivo de conexión

// Obtener nombre del usuario
$nombre_eliminar = $_POST['nombre_eliminar'];

// Eliminar usuario de la base de datos
$sql = "DELETE FROM usuarios WHERE usuario = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $nombre_eliminar);

if ($stmt->execute()) {
    echo "<script>alert('Usuario Eliminado Correctamente.'); window.location.href='../editar.html';</script>";
} else {
    echo "<script>alert('Error al Eliminar Usuario.'); window.location.href='../editar.html';</script>";
}

$conn->close();
?>
