import { Router } from "express";
import { UsuarioController } from "./controllers/usuarios/usuarioController";

const router = Router();

// Rota Para criar usuarios
router.post("/usuario", new UsuarioController().criaUsuario);


export { router };