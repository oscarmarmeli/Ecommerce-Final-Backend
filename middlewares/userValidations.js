const { body, validationResult } = require("express-validator");
const createUserAccountValidation = [
  (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.render("register", {
        errors: errors.array(),
      });
    }
    next();
  },
];

const validateUpdatedUserAccount = [
  body("firstName").notEmpty().withMessage("Debes ingresar el Nombre"),
  body("lastname").notEmpty().withMessage("Debes ingresar el Apellido"),
  (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ ERRORES: errors.array() });
    }
    next();
  },
];

module.exports = {
  createUserAccountValidation,
  validateUpdatedUserAccount,
};
