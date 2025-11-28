USE Atividade_Transacao
--1. Commit e Rollback
-- Reduza o estoque do produto com id = 1 em 2 unidades
-- Insira uma venda do cliente 1 para o produto 1
BEGIN Tran
	UPDATE Produtos
		SET estoque = estoque - 2
			WHERE id = 1

	INSERT INTO Vendas
		(cliente_id, produto_id, data_venda, quantidade) VALUES
		(1, 1, '26/11/2025', 2);
ROLLBACK

--2. Rollback por lógica
--1. Cancelar se o estoque ficar negativo
BEGIN Tran
	UPDATE Produtos
		SET estoque = estoque - 20
		WHERE id = 1

	DECLARE @estoqueResto INT 
	SELECT @estoqueResto = estoque
								FROM Produtos
									WHERE id = 1

	IF (@estoqueResto < 0)
		BEGIN
			PRINT 'Estoque negativo! Operação cancelada...'
			ROLLBACK
		END
	ELSE
		BEGIN
			PRINT 'Estoque suficiente! Operação confirmada...'
			COMMIT
		END

--3 Uso de Try-Catch
--1. Venda com controle de erros
BEGIN Try
	BEGIN Tran
		UPDATE Produtos
			SET preco = preco + 100
			WHERE id = 2

		UPDATE Produtos
			SET preco = preco + 100
			WHERE id = 3

		INSERT INTO Vendas
		(cliente_id, produto_id, data_venda, quantidade) VALUES
		(1, 2, GETDATE(), 2),
		(3, 3, GETDATE(), 4)

		PRINT 'Commit Realizado'
		COMMIT
	END Try

BEGIN Catch
	PRINT 'Rollback Realizado'
	ROLLBACK

END Catch