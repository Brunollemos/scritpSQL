CREATE TABLE Pessoa (
idPessoa			INT PRIMARY KEY IDENTITY(1,1),
nomePessoa			VARCHAR(200)not null,
cpfPessoa			INT not null,
enderecoPessoa			VARCHAR(200) not null,
emailPessoa             	VARCHAR(200)not null,
celularPessoa			NUMERIC(11) not null,
numeroCasaPessoa		int not null,
bairroPessoa			VARCHAR(30) not null,
cidadePessoa			VARCHAR(30) not null,
generoPessoa			VARCHAR(30) not null,
cepPessoa			INT not null,
rgPessoa			VARCHAR(30) not null,
estadoPessoa			VARCHAR(30)
Constraint UK_CPFPessoa UNIQUE (cpfPessoa)
) 
CREATE TABLE Produto(
idProduto                	INT PRIMARY KEY IDENTITY(1,1),
nomeProduto			VARCHAR(50)not null,
categoriaProduto		VARCHAR(9)not null,
preçoProduto			NUMERIC(4,2)not null,
estoqueProduto			INT not null,
descProduto			VARCHAR(100),
plataformaProduto		VARCHAR(20)		
)
CREATE TABLE Funcionario(
idFuncionario			INT PRIMARY KEY IDENTITY(1,1),
pisFuncionario		 	VARCHAR(30)not null,
loginFuncionario		VARCHAR(30)not null,
senhafuncionario		VARCHAR(30)not null,
funcaoFuncionario		VARCHAR(30)not null,
idPessoa             INT
Constraint FK_Pessoa_Func FOREIGN KEY(idPessoa) REFERENCES Pessoa(idPessoa)
)
CREATE TABLE Cliente(
idCliente    INT PRIMARY KEY IDENTITY(1,1),
idPessoa     INT,
Constraint FK_Pessoa_Cliente FOREIGN KEY(idPessoa) REFERENCES Pessoa(idPessoa) 
)
CREATE TABLE Usuario(
idUsuario    			INT PRIMARY KEY IDENTITY(1,1),
loginUsuario      		Varchar(20),
senhaUsuario     		VARCHAR(20),
idCliente        		INT,
idFuncionario    		INT
Constraint FK_Cliente_Usuario FOREIGN KEY (idCliente) REFERENCEs Cliente(idCliente),
CONSTRAINT FK_Func_Usuario	FOREIGN KEY (idFuncionario) REFERENCES Funcionario(idFuncionario)
)
go



---------------PROCEDURES INSERT----------------------

Create procedure pi_Cliente (

@nomePessoa             	VARCHAR(200),
@cpfPessoa               	INT,
@enderecoPessoa          	VARCHAR(200),
@emailPessoa		 	VARCHAR(200),
@celularPessoa           	NUMERIC(11),
@numeroCasaPessoa        	int,
@bairroPessoa            	varchar(100),
@cidadePessoa           	varchar(50),
@generoPessoa            	varchar(10),
@cepPessoa               	int,
@rgPessoa                	varchar(9),
@estadoPessoa            	varchar(8)
)
AS
begin
insert into Pessoa (nomePessoa,cpfPessoa,enderecoPessoa,emailPessoa, celularPessoa,numeroCasaPessoa, bairroPessoa, cidadePessoa, generoPessoa, cepPessoa, rgPessoa, estadoPessoa )
values (@nomePessoa,@cpfPessoa,@enderecoPessoa,@emailPessoa, @celularPessoa, @numeroCasaPessoa, @bairroPessoa, @cidadePessoa, @generoPessoa, @cepPessoa, @rgPessoa, @estadoPessoa )

Declare @idPessoa INT
Select @idPessoa = MAX(idPessoa) FROM Pessoa
Insert INTO Cliente (idPessoa) Values (@idPessoa)
end 

GO

Create procedure pi_Funcionario_Desktop(
@nomePessoa                   	VARCHAR(200),
@cpfPessoa                    	INT,
@enderecoPessoa        		VARCHAR(200),
@emailPessoa            	VARCHAR(200),
@celularPessoa          	NUMERIC(11),
@numeroCasaPessoa       	int,
@bairroPessoa           	varchar(100),
@cidadePessoa           	varchar(50),
@generoPessoa           	varchar(10),
@cepPessoa              	int,
@rgPessoa               	varchar(9),
@estadoPessoa           	varchar(8),
@funcaoFuncionario      	varchar(10),
@pisFuncionario         	varchar(20),
@loginFuncionario       	varchar(20),
@senhaFuncionario       	varchar(20)
)
AS
begin

insert into Pessoa (nomePessoa,cpfPessoa,enderecoPessoa,emailPessoa, celularPessoa,numeroCasaPessoa, bairroPessoa, cidadePessoa, generoPessoa, cepPessoa, rgPessoa, estadoPessoa )
values (@nomePessoa, @cpfPessoa, @enderecoPessoa, @emailPessoa, @celularPessoa, @numeroCasaPessoa, @bairroPessoa, @cidadePessoa, @generoPessoa, @cepPessoa, @rgPessoa, @estadoPessoa )

Declare @idPessoa INT
Select @idPessoa = MAX(idPessoa) FROM Pessoa

Insert INTO Funcionario(idPessoa, funcaoFuncionario, pisFuncionario, loginFuncionario, senhaFuncionario)
Values (@idPessoa, @funcaoFuncionario, @pisFuncionario, @loginFuncionario,@senhaFuncionario)
end
go

Create Procedure  pi_Produto(
@nomeProduto			VARCHAR(50),
@categoriaProduto		VARCHAR(20),
@preçoProduto			NUMERIC(4,2),
@estoqueProduto			INT,
@descProduto			VARCHAR(100),
@plataformaProduto		VARCHAR(20)		
)
as
begin
insert into Produto (nomeProduto, categoriaProduto, preçoProduto, estoqueProduto, descProduto,plataformaProduto)
values (@nomeProduto, @categoriaProduto, @preçoProduto, @estoqueProduto, @descProduto, @plataformaProduto)

end

GO


---------------PROCEDURES UPDATE----------------------

Create procedure up_Cliente (
@nomePessoa			VARCHAR(200),
@cpfPessoa                	INT,
@enderecoPessoa          	VARCHAR(200),
@emailPessoa             	VARCHAR(200),
@celularPessoa            	NUMERIC(11),
@numeroCasaPessoa        	NUMERIC(30),
@bairroPessoa            	VARCHAR(30),
@cidadePessoa            	VARCHAR(30),
@generoPessoa            	VARCHAR(30),
@cepPessoa                	INT,
@rgPessoa                	varchar(20),
@estadoPessoa            	varchar(59)

)
as
begin

UPDATE Pessoa
SET nomePessoa = @nomePessoa,
    enderecoPessoa = @enderecoPessoa,
    emailPessoa = @emailPessoa,
    celularPessoa = @celularPessoa,
    numeroCasaPessoa = @numeroCasaPessoa,
    bairroPessoa = @bairroPessoa,
    cidadePessoa = @cidadePessoa,
    generoPessoa = @generoPessoa,
    cepPessoa = @cepPessoa,
    rgPessoa = @rgPessoa,
    estadoPessoa = @estadoPessoa Where cpfPessoa = @cpfPessoa

end

GO

Create procedure up_Funcionario (
@nomePessoa                	VARCHAR(200),
@cpfPessoa                	INT ,
@enderecoPessoa            	VARCHAR(200),
@emailPessoa             	VARCHAR(200),
@celularPessoa            	NUMERIC(11),
@numeroCasaPessoa        	NUMERIC(30),
@bairroPessoa            	VARCHAR(30),
@cidadePessoa            	VARCHAR(30),
@generoPessoa            	VARCHAR(30),
@cepPessoa                	INT,
@rgPessoa                	varchar(20),
@estadoPessoa            	varchar(59),
@funcaoFuncionario        	varchar(5),
@pisFuncionario            	varchar(20),
@loginFuncionario        	varchar(50),
@senhaFuncionario        	varchar(20)
)
as
begin

UPDATE Pessoa
SET nomePessoa = @nomePessoa,
    enderecoPessoa = @enderecoPessoa,
    emailPessoa = @emailPessoa,
    celularPessoa = @celularPessoa,
    numeroCasaPessoa = @numeroCasaPessoa,
    bairroPessoa = @bairroPessoa,
    cidadePessoa = @cidadePessoa,
    generoPessoa = @generoPessoa,
    cepPessoa = @cepPessoa,
    rgPessoa = @rgPessoa,
    estadoPessoa = @estadoPessoa Where @cpfPessoa = cpfPessoa


    DECLARE @idPessoa INT

SELECT @idPessoa = idPessoa
FROM Pessoa
WHERE cpfPessoa = @cpfPessoa

UPDATE Funcionario
    SET    funcaoFuncionario = @funcaoFuncionario,
        pisFuncionario = @pisFuncionario,
        loginFuncionario = @loginFuncionario,
        senhaFuncionario = @senhaFuncionario

WHERE idPessoa = @idPessoa

end

GO



Create Procedure up_Produto
(

@nomeProduto        	varchar(50),
@categoriaProduto    	varchar(9),
@preçoProduto        	numeric(4,2),
@estoqueProduto        	int,
@descProduto        	varchar(100),
@plataformaProduto    	varchar(50)

)
as
begin

update Produto
set nomeProduto = @nomeProduto,
    categoriaProduto = @categoriaProduto,
    preçoProduto = @preçoProduto,
    estoqueproduto = @estoqueProduto,
    descProduto = @descProduto,
    plataformaProduto = @plataformaProduto
end
GO


--------PROCEDURES DE SELEÇÃO--------

Create Procedure ps_Busca_Cliente(

@cpfPessoa    INT

)

as

begin



select * from Pessoa p join Cliente C ON p.idPessoa = c.idPessoa where cpfPessoa = @cpfPessoa



end

GO
Create procedure ps_Busca_Funcionario (
@cpfPessoa    varchar(20)
)
as
begin

select * from Pessoa p JOIN Funcionario f on p.idPessoa = f.idPessoa where cpfPessoa = @cpfPessoa
end

GO

CREATE PROCEDURE ps_Produto (
@idProduto VARCHAR(100)
)
AS
BEGIN
    SELECT * FROM Produto where idProduto = @idProduto
END

GO

Create PROCEDURE ps_Cliente_grid (
@cpfPessoa    int = null
)
AS
BEGIN
 
 IF @cpfPessoa IS NULL 
 BEGIN
    SELECT * FROM Pessoa p join Cliente c on p.idPessoa = c.idPessoa
 END
 ELSE 
 BEGIN 
    SELECT * FROM Pessoa p join Cliente c on p.idPessoa = c.idPessoa
    WHERE cpfPessoa = @cpfPessoa
 END 
END

GO


Create procedure ps_Funcionario_grid (
@cpfPessoa    int = null
)
AS
BEGIN
 
 IF @cpfPessoa IS NULL 
 BEGIN
    SELECT * FROM Pessoa p join Funcionario f on p.idPessoa = f.idPessoa
 END
 ELSE 
 BEGIN 
    SELECT * FROM Pessoa p join Funcionario f on p.idPessoa = f.idPessoa
    WHERE cpfPessoa = @cpfPessoa
 END 
END

GO

Create PROCEDURE ps_Produto_grid (
@idProduto int  = NULL
)
AS
BEGIN
 
 IF @idProduto  IS NULL 
 BEGIN
    SELECT * FROM Produto
 END
 ELSE 
 BEGIN 
    SELECT * FROM Produto
    WHERE idProduto = @idProduto
 END 
END

GO

Create Procedure ps_Login_Desktop (
@loginFuncionario varchar(50),
@senhaFuncionario varchar(50)
)

as 

begin

select * from Pessoa p join Funcionario f on p.idPessoa = f.idPessoa  
where loginFuncionario = @loginFuncionario 
and
senhaFuncionario = @senhaFuncionario
end





--SELECT * FROM PESSOA P JOIN CLIENTE C ON  P.idPessoa = C.idPessoa

--SELECT * FROM PESSOA P JOIN Funcionario F ON  F.idPessoa = P.idPessoa

--select * from Produto







