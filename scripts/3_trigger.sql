select usuarios from trabalho;

CREATE TRIGGER usuario_existente
BEFORE INSERT OR UPDATE ON apagar
FOR EACH ROW
BEGIN


