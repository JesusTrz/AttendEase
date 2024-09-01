<?php
include 'db_connect.php'; // Incluye el archivo de conexión

// Obtener nombre del usuario del formulario
$usuario = $_POST['usuario'];

// Consultar la tabla de asistencias basada en el nombre de usuario
$sql = "SELECT a.fecha_registro, a.hora_registro, a.tipo_registro, u.usuario 
        FROM asistencia a
        INNER JOIN usuarios u ON a.usuario_id = u.id
        WHERE u.usuario = ? 
        ORDER BY a.fecha_registro, a.hora_registro";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $usuario);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $entrada = null;
    $salida = null;
    $fecha_entrada = null;
    $fecha_salida = null;

    while ($row = $result->fetch_assoc()) {
        if ($row['tipo_registro'] == 'entrada') {
            $fecha_entrada = $row['fecha_registro'];
            $entrada = $row['hora_registro'];
        } elseif ($row['tipo_registro'] == 'salida') {
            $fecha_salida = $row['fecha_registro'];
            $salida = $row['hora_registro'];

            echo "<tr>
                    <td>" . htmlspecialchars($row['usuario']) . "</td>
                    <td>" . htmlspecialchars($fecha_entrada) . "</td>
                    <td>" . htmlspecialchars($entrada) . "</td>
                    <td>" . htmlspecialchars($fecha_salida) . "</td>
                    <td>" . htmlspecialchars($salida) . "</td>
                  </tr>";

            // Reset variables for next record
            $entrada = null;
            $salida = null;
            $fecha_entrada = null;
            $fecha_salida = null;
        }
    }
} else {
    echo "<script>alert('No se encontraron Registros de Asistencia del usuario.'); window.location.href='../consulta.html';</script>";
}

$stmt->close();
$conn->close();
?>
