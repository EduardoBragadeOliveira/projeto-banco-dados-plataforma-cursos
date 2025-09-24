USE trabalho;

CREATE VIEW vw_aulas_detalhes_completo AS
SELECT
    a.titulo AS titulo_aula, 
    c.titulo AS titulo_curso, 
    u.nome AS nome_instrutor, 
    a.duracao, 
    a.ordem 
FROM
    aulas a 
JOIN
    cursos c ON a.curso_id = c.id 
JOIN
    instrutores i ON a.instrutor_id = i.id 
JOIN
    usuarios u ON i.usuario_id = u.id; 