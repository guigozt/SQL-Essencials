USE Atividade_Transacao;
-- Função para retornar o total do prduto x quantidade
CREATE FUNCTION fn_totalProduto(@id INT)
RETURNS DECIMAL(10,2)
AS
	BEGIN
		DECLARE @qtd INT
		DECLARE @preco DECIMAL(10,2)
		DECLARE @total DECIMAL(10,2)

		SELECT 
			@qtd = estoque, 
			@preco = preco
		FROM Produtos
			WHERE id = @id

		SET @total = @qtd * @preco
		RETURN @total
	END

SELECT dbo.fn_totalProduto(3) AS 'TOTAL DO PRODUTO'
