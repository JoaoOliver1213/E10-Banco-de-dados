DROP database SistemaBancario;
CREATE database SistemaBancario;
USE SistemaBancario;

CREATE table Clientes(
CPF VARCHAR(11),
NOME VARCHAR(100),
ENDERECO VARCHAR(200),
TELEFONE VARCHAR(15),
DATADENASCIMENTO DATETIME,
CONSTRAINT CLIENTE_PK primary key(CPF)
);

CREATE TABLE Agencias(
CODIGO INT,
NOME VARCHAR(45),
ENDERECO VARCHAR(200),
DATACRIACAO DATETIME,
CONSTRAINT AGENCIA_PK primary key(CODIGO)
); 

CREATE TABLE Contas(
NUMERO INT,
AGENCIA INT,
SALDO DECIMAL(10,2),
TIPO VARCHAR(15),
CLIENTE_CPF VARCHAR(11),
CONSTRAINT CONTAS_PK primary key(NUMERO),
CONSTRAINT CONTAS_Agencias_FK foreign key(AGENCIA)
	references Agencias(CODIGO)
);



CREATE TABLE Transacoes(
ID INT,
CONTA_NUMERO_ORIGEM INT,
CONTA_AGENCIA_ORIGEM INT,
CONTA_NUMERO_DESTINO INT,
CONTA_AGENCIA_DESTINO INT,
DATA_TRANSACAO DATETIME,
VALOR DECIMAL(10,2),
TIPO ENUM('d','s','t'),

CONSTRAINT TRANSACOES_PK primary key(ID),
CONSTRAINT TRANSACOES_CONTAS_FK foreign key(CONTA_NUMERO_ORIGEM)
	references Contas(NUMERO),
CONSTRAINT TRANSACOES_CONTAS2_FK foreign key(CONTA_NUMERO_DESTINO)
	references Contas(NUMERO),
CONSTRAINT TRANSACOES_AGENCIAS_FK foreign key(CONTA_AGENCIA_ORIGEM)
	references Agencias(CODIGO),
CONSTRAINT TRANSACOES_AGENCIAS2_FK foreign key(CONTA_AGENCIA_DESTINO)
	references Agencias(CODIGO)
);

