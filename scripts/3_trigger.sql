USE trabalho;

DELIMITER ||

CREATE TRIGGER atualizar_status_do_pagamento
AFTER UPDATE ON pagamentos
FOR EACH ROW
BEGIN

    IF NEW.status = 'pago' THEN
        UPDATE assinaturas_ativas
        SET status = 'ativo'
        WHERE id = NEW.assinatura_id;

        UPDATE usuarios
        SET plano = (
            SELECT plano
            FROM assinaturas_ativas
            WHERE id = NEW.assinatura_id
        )
        WHERE id = (
            SELECT usuario_id
            FROM assinaturas_ativas
            WHERE id = NEW.assinatura_id
        );
    END IF;
END||

DELIMITER ;

