const express = require("express");
const morgan = require("morgan");
const cors = require("cors");
const path = require("path");
const app = express();
// const Product = require("./models").productos;
// const Usuarios = require("./models").usuarios;
// const Orders = require("./models").orders;
const PORT = 3000;

app.use(express.urlencoded({ extended: true })); //para poder leer los datos de un formulario
app.use(express.json()); //para poder leer los datos de un formulario
app.use(morgan("dev"));
app.use(cors());

// rutas principales, a las que se puede acceder sin estar logeado, ej pagina de inicio, pagina de registro, pagina de login
app.use("/api/productos", require("./routes/productRoutes.js"));
app.use("/api/usuarios", require("./routes/userRoutes.js"));
app.use("/api/orders", require("./routes/orderRoutes.js"));
app.use("/api/login", require("./routes/loginRoutes.js"));

// app.post("/api/login", (req, res) => {
//   if (req.body.email === "oscarmarmeli@hotmail.com" && req.body.password === "12345") {
//     return res.json({
//       email: "oscarmarmeli@hotmail.com",
//       nombre: "admin",
//       rol: "admin",
//     });
//   } else if (req.body.email === "oscarmarmeli@gmail.com" && req.body.password === "admin") {
//     return res.json({
//       email: "user",
//       nombre: "user",
//       rol: "user",
//     });
//   } else {
//     return res
//       .status(400)
//       .json({ message: "Nombre de usuario o password incorrecto" });
//   }
// });

// Servir archivos estáticos de la carpeta dist
app.use(express.static(path.join(__dirname, "dist")));

// Redirigir todas las rutas a index.html
app.get("*", (req, res) => {
  res.sendFile(path.join(__dirname, "dist", "index.html"));
});

// Ejemplo de función asincrónica con async/await
function delay(ms) {
  // Simula una operación asincrónica, muestra un mensaje por consola
  return new Promise((resolve, reject) =>
    setTimeout(() => {
      console.log("Operación asincrónica completada.");
      resolve();
    }, [ms])
  );
}

app.use("/test", async (req, res) => {
  try {
    const result = await delay(5000);
    res.send({ msg: "Mensaje post promise", result });
  } catch (error) {
    console.log(error);
    res.send("Ocurrio un error");
  }
});

//Server setup
app.listen(PORT, () => {
  console.log(`Server listening at http://localhost:${PORT}`);
});
