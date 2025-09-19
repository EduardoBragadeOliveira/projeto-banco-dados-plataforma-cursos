CREATE DATABASE trabalho;
USE trabalho;

CREATE TABLE usuarios(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    genero VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    foto_perfil VARCHAR(255),
    status_conta ENUM('ativo', 'inativo', 'banido') DEFAULT 'ativo',
    verificado BOOLEAN DEFAULT FALSE,
    ultimo_login DATETIME,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE alunos(
   id INT AUTO_INCREMENT PRIMARY KEY,
   usuario_id INT NOT NULL,
   escolaridade VARCHAR(100),
   principais_objetivos TEXT,
   FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE areas_atuacao_instrutores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    descricao TEXT
);

CREATE TABLE instrutores(
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    area_atuacao_id INT NOT NULL,
    biografia TEXT NOT NULL,
    linkedin VARCHAR(255) NOT NULL,
    FOREIGN KEY (area_atuacao_id) REFERENCES areas_atuacao_instrutores(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE categorias_cursos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

CREATE TABLE cursos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT,
    instrutor_responsavel_id INT NOT NULL,
    categoria_id INT,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
    ativo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (instrutor_responsavel_id) REFERENCES instrutores(id),
    FOREIGN KEY (categoria_id) REFERENCES categorias_cursos(id)
);

CREATE TABLE aulas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    curso_id INT NOT NULL,
    instrutor_id INT NOT NULL,
    titulo VARCHAR(150) NOT NULL,
    conteudo TEXT,
    duracao INT NOT NULL,
    ordem INT NOT NULL,
    FOREIGN KEY (instrutor_id) REFERENCES instrutores(id),
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

CREATE TABLE inscricoes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT NOT NULL,
    curso_id INT NOT NULL,
    data_inscricao DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('ativa', 'concluída', 'cancelada') DEFAULT 'ativa',
    FOREIGN KEY (aluno_id) REFERENCES alunos(id),
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

CREATE TABLE avaliacoes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT NOT NULL,
    curso_id INT NOT NULL,
    nota INT,
    depoimento TEXT,
    data_avaliacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id),
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

CREATE TABLE pagamentos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    metodo_pagamento ENUM('cartao', 'boleto', 'pix') NOT NULL,
    data_pagamento DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pendente', 'pago', 'falhou') DEFAULT 'pendente',
    FOREIGN KEY (aluno_id) REFERENCES alunos(id)
);