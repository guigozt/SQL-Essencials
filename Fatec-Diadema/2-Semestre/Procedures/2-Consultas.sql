USE Atividade_Transacao

--1. Criar Procedure para aumentar preço (porcentagem)
CREATE PROCEDURE aumentarPreco
	@porcentagem DECIMAL(5,2)
	AS
	BEGIN
		UPDATE Produtos
			SET preco = preco + (preco * (@porcentagem / 100))
	END

EXEC aumentarPreco 10

SELECT * FROM Produtos

--2. Buscar por cliente especifico
CREATE PROCEDURE buscarCliente
	@idCliente INT
	AS
	BEGIN
		SELECT * FROM Clientes
		WHERE id = @idCliente
	END

EXEC buscarCliente 3