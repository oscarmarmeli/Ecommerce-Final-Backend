const bcrypt = require("bcrypt");
const Usuario = require("../models/index").usuarios;

const createUserAccount = (req, res) => {
  const { ...newUsuario } = req.body;
  const { isAdmin, firstName, lastname, email, address, password, telephone } =
    newUsuario;
  if (
    !isAdmin ||
    !firstName ||
    !lastname ||
    !email ||
    !address ||
    !password ||
    !telephone
  ) {
    return res.status(500).json({
      message:
        "Debes ingresar Nombre, Apellido, Email, Dirección, Contraseña y Telefono",
    });
  }
  const saltRounds = 10;
  bcrypt.hash(password, saltRounds, (error, hashedPassword) => {
    if (error) {
      return res.status(500).json({ message: "Error al hashear contraseña" });
    }
    const usuario = Usuario.create({ ...newUsuario, password: hashedPassword });
    res.json({ message: "Usuario creado exitosamente", data: usuario });
  });
};

const readUsersAccount = async (req, res) => {
  const usuarios = await Usuario.findAll();
  res.status(200).json({ data: usuarios });
};

const readUserAccount = async (req, res) => {
  const usuario = await Usuario.findByPk(req.params.id);
  res.status(200).json({ data: usuario });
};

const deleteUserAccount = async (req, res) => {
  const usuario = await Usuario.findByPk(req.params.id);
  if (!usuario) {
    return res.status(404).json({ message: "Usuario no encontrado" });
  }
  await usuario.destroy();
  return res
    .status(200)
    .json({ message: "Usuario eliminado con exito", data: usuario });
};

const updateUserAccount = async (req, res) => {
  const usuario = await Usuario.findByPk(req.params.id);
  const { ...newUsuario } = req.body;
  if (!usuario) {
    return res.status(404).json({ message: "Usuario no encontrado" });
  }
  const saltRounds = 10;
  bcrypt.hash(password, saltRounds, (error, hashedPassword) => {
    if (error) {
      return res.status(500).json({ message: "Error al hashear contraseña" });
    }
    const usuario = Usuario.update({ ...newUsuario, password: hashedPassword });
    return res
    .status(200)
    .json({ message: "Usuario actualizado con éxito", data: usuario });
  });
};

module.exports = {
  createUserAccount,
  readUsersAccount,
  readUserAccount,
  deleteUserAccount,
  updateUserAccount,
};

