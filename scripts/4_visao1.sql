CREATE VIEW vw_usuarios AS
SELECT
    nome,
    genero,
    foto_perfil,
    status_conta,
    verificado,
    ultimo_login,
    criado_em
FROM
    usuarios;

CREATE VIEW vw_alunos AS
SELECT
    usuario_id,
    escolaridade,
    principais_objetivos
FROM
    alunos;


CREATE VIEW vw_areas_atuacao_instrutores AS
SELECT
    nome,
    descricao
FROM
    areas_atuacao_instrutores;

CREATE VIEW vw_instrutores AS
SELECT
    usuario_id,
    area_atuacao_id,
    biografia,
    linkedin
FROM
    instrutores;


CREATE VIEW vw_categorias_cursos AS
SELECT
    nome,
    descricao
FROM
    categorias_cursos;


CREATE VIEW vw_cursos AS
SELECT
    titulo,
    descricao,
    instrutor_responsavel_id,
    categoria_id,
    criado_em,
    ativo
FROM
    cursos;

CREATE VIEW vw_aulas_detalhes AS
SELECT
    a.titulo AS titulo_aula,
    a.conteudo,
    a.duracao,
    a.ordem,
    c.titulo AS curso_pertencente,
    u.nome AS nome_instrutor
FROM
    aulas a
JOIN
    cursos c ON a.curso_id = c.id
JOIN
    instrutores i ON a.instrutor_id = i.id
JOIN
    usuarios u ON i.usuario_id = u.id;

CREATE VIEW vw_inscricoes AS
SELECT
    data_inscricao
FROM
    inscricoes;


CREATE VIEW vw_avaliacoes AS
SELECT
    data_avaliacao,
    curso_id
FROM
    avaliacoes;


CREATE VIEW vw_pagamentos AS
SELECT
    aluno_id,
    valor,
    metodo_pagamento,
    status
FROM
    pagamentos;