const express = require("express");
const {
  createUserAccount,
  readUsersAccount,
  readUserAccount,
  deleteUserAccount,
  updateUserAccount,
} = require("../controllers/userControllers");
const {
  createUserAccountValidation,
  validateUpdatedUserAccount,
} = require("../middlewares/userValidations");
const router = express();
router.post("/", createUserAccountValidation, createUserAccount);
router.get("/", readUsersAccount);
router.get("/:id", readUserAccount);
router.put("/:id", validateUpdatedUserAccount, updateUserAccount);
router.delete("/:id", deleteUserAccount);
module.exports = router;
