/*
  Warnings:

  - You are about to drop the `usuarios` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "usuarios";

-- CreateTable
CREATE TABLE "Usuarios" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "upDatedAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Usuarios_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Categorias" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "upDatedAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Categorias_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Produtos" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "preco" TEXT NOT NULL,
    "foto" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "upDatedAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "categoriaId" TEXT NOT NULL,

    CONSTRAINT "Produtos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Comandas" (
    "id" TEXT NOT NULL,
    "mesa" INTEGER NOT NULL,
    "nome" TEXT,
    "status" BOOLEAN NOT NULL DEFAULT false,
    "rascunho" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "upDatedAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Comandas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ItensComanda" (
    "id" TEXT NOT NULL,
    "quantidade" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "upDatedAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "comandaId" TEXT NOT NULL,
    "produtoId" TEXT NOT NULL,

    CONSTRAINT "ItensComanda_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Produtos" ADD CONSTRAINT "Produtos_categoriaId_fkey" FOREIGN KEY ("categoriaId") REFERENCES "Categorias"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ItensComanda" ADD CONSTRAINT "ItensComanda_comandaId_fkey" FOREIGN KEY ("comandaId") REFERENCES "Comandas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ItensComanda" ADD CONSTRAINT "ItensComanda_produtoId_fkey" FOREIGN KEY ("produtoId") REFERENCES "Produtos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
