/* Mostrando antes */
SELECT * FROM pagamentos AS antes_pagamento;
SELECT * FROM assinaturas_ativas AS antes_assinatura;
SELECT * FROM usuarios AS antes_usuario;

/* Executando a operação: */
UPDATE pagamentos
SET status = 'pago'
WHERE id = 1;

/* Mostrando o resultado */
SELECT * FROM pagamentos AS depois_pagamento;
SELECT * FROM assinaturas_ativas AS depois_assinatura;
SELECT * FROM usuarios AS depois_usuario;
