-- Gestão de Responsabilidade Social Corporativa (CSR)
-- Este script SQL cria as tabelas necessárias para gerenciar iniciativas de CSR.

CREATE TABLE projetos_csr (
    id_projeto SERIAL PRIMARY KEY,
    nome_projeto VARCHAR(255) NOT NULL,
    descricao TEXT,
    data_inicio DATE,
    data_fim DATE,
    orcamento DECIMAL(15,2)
);

CREATE TABLE partes_interessadas (
    id_interessado SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    tipo VARCHAR(100) CHECK (tipo IN ('ONG', 'Governo', 'Comunidade', 'Investidor', 'Outro'))
);

CREATE TABLE participacao_csr (
    id_projeto INT REFERENCES projetos_csr(id_projeto),
    id_interessado INT REFERENCES partes_interessadas(id_interessado),
    contribuicao TEXT,
    PRIMARY KEY (id_projeto, id_interessado)
);
