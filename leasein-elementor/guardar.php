<?php
$conn = new mysqli("localhost", "root", "", "leasein_elementor", 3307);
if ($conn->connect_error) die("Error: " . $conn->connect_error);

$nombre = $_POST['nombre'];
$email = $_POST['email'];
$mensaje = $_POST['mensaje'];

$stmt = $conn->prepare("INSERT INTO contactos (nombre, email, mensaje, fecha_envio) VALUES (?, ?, ?, NOW())");
$stmt->bind_param("sss", $nombre, $email, $mensaje);
$stmt->execute();
$stmt->close();
$conn->close();

echo "<script>alert('Gracias por contactarnos'); window.location.href = 'index.php';</script>";
?>
