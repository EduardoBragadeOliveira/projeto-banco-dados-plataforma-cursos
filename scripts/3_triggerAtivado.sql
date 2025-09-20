USE trabalho;

SELECT 
    u.id AS usuario_id,
    u.nome AS nome_usuario,
    u.email,
    u.plano AS plano_usuario,
    a.id AS assinatura_id,
    a.plano AS plano_assinatura,
    a.tempo_plano,
    a.data_inicio,
    a.data_fim,
    a.status AS status_assinatura,
    p.id AS pagamento_id,
    p.valor_pago,
    p.metodo_pagamento,
    p.data_pagamento,
    p.status AS status_pagamento
FROM pagamentos p
INNER JOIN assinaturas_ativas a ON p.assinatura_id = a.id
INNER JOIN usuarios u ON a.usuario_id = u.id
WHERE p.id = 8;

UPDATE pagamentos
SET status = 'pago'
WHERE id = 8;

SELECT 
    u.id AS usuario_id,
    u.nome AS nome_usuario,
    u.email,
    u.plano AS plano_usuario,
    a.id AS assinatura_id,
    a.plano AS plano_assinatura,
    a.tempo_plano,
    a.data_inicio,
    a.data_fim,
    a.status AS status_assinatura,
    p.id AS pagamento_id,
    p.valor_pago,
    p.metodo_pagamento,
    p.data_pagamento,
    p.status AS status_pagamento
FROM pagamentos p
INNER JOIN assinaturas_ativas a ON p.assinatura_id = a.id
INNER JOIN usuarios u ON a.usuario_id = u.id
WHERE p.id = 8;