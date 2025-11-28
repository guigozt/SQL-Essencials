USE Atividade_Transacao;

--1. Permissões básicas
-- Crie um usuário que só pode cadastrar vendas
CREATE LOGIN vendedor WITH PASSWORD = '123'

CREATE USER vendedor1 FOR LOGIN vendedor

CREATE ROLE Role_Vendedor
	GRANT SELECT ON dbo.Clientes TO Role_Vendedor
	GRANT SELECT ON dbo.Produtos TO Role_Vendedor
	GRANT INSERT ON dbo.Vendas TO Role_Vendedor

ALTER ROLE Role_Vendedor
	ADD MEMBER vendedor1

EXECUTE AS USER = 'vendedor1'

--2. Controle mais refinado
-- Permita que um usuário altere estoque, mas nunca preço
CREATE LOGIN estoquista WITH PASSWORD = '123'

CREATE USER estoquista1 FOR LOGIN estoquista

CREATE ROLE Role_Estoquista
	GRANT UPDATE (estoque) ON dbo.Produtos TO Role_Estoquista
	GRANT SELECT ON dbo.Produtos TO Role_Estoquista

ALTER ROLE Role_Estoquista
	ADD MEMBER estoquista1

EXECUTE AS USER = 'estoquista1'

