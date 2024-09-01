<?php
include 'db_connect.php'; // Incluye el archivo de conexión

// Obtener nombre del usuario
$nombre_usuario = $_GET['nombre_usuario'];

// Buscar usuario en la base de datos
$sql = "SELECT * FROM usuarios WHERE usuario = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $nombre_usuario);
$stmt->execute();
$result = $stmt->get_result();

$response = array();

if ($result->num_rows > 0) {
    $usuario = $result->fetch_assoc();
    $response['success'] = true;
    $response['usuario'] = $usuario;
} else {
    $response['success'] = false;
}

echo json_encode($response);

$conn->close();
?>
