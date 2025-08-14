document.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("contactForm");
  const fields = {
    nombre: document.getElementById("nombre"),
    email: document.getElementById("email"),
    mensaje: document.getElementById("mensaje"),
  };
  const ayuda = document.getElementById("ayudaMensaje");
  const formMensaje = document.getElementById("formMensaje");

  // Mostrar ayuda
  fields.mensaje.addEventListener("focus", () => ayuda.style.display = "block");
  fields.mensaje.addEventListener("blur", () => ayuda.style.display = "none");

  // Validaciones de campos
  const validarCampos = () => {
    const errores = [];

    // Resetear estilos
    Object.values(fields).forEach(el => el.classList.remove("error"));

    if (fields.nombre.value.trim() === "") {
      errores.push("Nombre es obligatorio");
      fields.nombre.classList.add("error");
    }

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(fields.email.value.trim())) {
      errores.push("Email no es válido");
      fields.email.classList.add("error");
    }

    if (fields.mensaje.value.trim() === "") {
      errores.push("Mensaje es obligatorio");
      fields.mensaje.classList.add("error");
    }

    return errores;
  };

  // Mostrar mensaje
  const mostrarMensaje = (mensaje, tipo = "error") => {
    formMensaje.textContent = mensaje;
    formMensaje.style.color = tipo === "error" ? "red" : "green";
  };

  // Envio de formulario
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const errores = validarCampos();

    if (errores.length > 0) {
      mostrarMensaje(errores.join(", "), "error");
    } else {
      mostrarMensaje("Gracias por contactarnos", "success");
      form.submit();
    }
  });
});