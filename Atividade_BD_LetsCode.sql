CREATE TABLE cliente(
	id INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	data_nascimento DATE NOT NULL
)

CREATE TABLE contrato(
	id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	cliente_id INTEGER NOT NULL, 
		CONSTRAINT cliente_id FOREIGN KEY (cliente_id) REFERENCES cliente (id),
	data_de_inicio DATE NOT NULL
)

CREATE TABLE produto(
	codigo_ans VARCHAR(255) NOT NULL PRIMARY KEY,
	descricao TEXT,
    valor REAL NOT NULL
)

CREATE TABLE dependentes(
	id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	titular_id INTEGER NOT NULL,
		CONSTRAINT titular_id FOREIGN KEY (titular_id) REFERENCES cliente (id),
    dependente_id INTEGER NOT NULL,
    	CONSTRAINT dependente_id FOREIGN KEY (dependente_id) REFERENCES cliente (id)
)

CREATE TABLE produto_contrato(
	id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	contrato_id INTEGER NOT NULL,
		CONSTRAINT contrato_id FOREIGN KEY (contrato_id) REFERENCES contrato (id),
	produto_id VARCHAR(255) NOT NULL,
		CONSTRAINT produto_id FOREIGN KEY (produto_id) REFERENCES produto (codigo_ans)
)
