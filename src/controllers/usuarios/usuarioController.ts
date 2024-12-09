import { Request, Response } from "express";
import { CriaUsuarioService } from "../../services/criaUsuarioService";

class UsuarioController {
    async criaUsuario(req: Request, res: Response) {
        const {nome, email, senha} = req.body;

        const service = new CriaUsuarioService();

        await service.execute({nome, email, senha});

        return res.json({message: 'Criando Usuário'});
    }
}

export  {UsuarioController};