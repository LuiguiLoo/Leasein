<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Formulario de Contacto</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <form id="contactForm" action="guardar.php" method="POST">
    <h2>Contáctanos</h2>

    <label for="nombre">Nombre</label>
    <input type="text" name="nombre" id="nombre" >

    <label for="email">Email</label>
    <input type="email" name="email" id="email">

    <label for="mensaje">Mensaje</label>
    <textarea name="mensaje" id="mensaje"></textarea>
    <div id="ayudaMensaje" class="ayuda">No compartas datos sensibles</div>

    <button type="submit">Enviar</button>
    <p id="formMensaje"></p>
  </form>
<script src="script.js"></script>
</body>
</html>