USE trabalho;

CREATE VIEW vw_usuarios_com_papeis AS
SELECT
    u.id AS id_usuario,
    u.nome AS nome_usuario,
    'Aluno' AS papel
FROM
    usuarios u
JOIN
    alunos a ON u.id = a.usuario_id

UNION

SELECT
    u.id AS id_usuario,
    u.nome AS nome_usuario,
    'Instrutor' AS papel
FROM
    usuarios u
JOIN
    instrutores i ON u.id = i.usuario_id;