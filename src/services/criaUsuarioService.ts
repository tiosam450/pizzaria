import prismaClient from "../prisma";

interface Usuario {
    nome: string;
    email: string;
    senha: string;
}


class CriaUsuarioService {
    async execute({nome, email, senha}: Usuario) {
        // verifica se existe dados no campo e-mail
        if(!email){
            console.log("Preencha o campo e-mail")
        }

        // Verifica se o email já existe
        const verificaEmail = await prismaClient.usuarios.findFirst({
            where:{
                email: email
            }
        })

        if(verificaEmail){
            console.log('Este e-mail já existe')
        }

        // Cadastra usuario
         const usuario = await prismaClient.usuarios.create({
            data:{
                nome: nome,
                email: email,
                senha: senha
            }
        })

        return {
            usuario
        }
    }

}

export { CriaUsuarioService };