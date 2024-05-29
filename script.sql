--Transporte
CREATE TABLE IF NOT EXISTS transportadora
(
    id SERIAL,
    nome text NOT NULL,
    CONSTRAINT transportadora_id_pk PRIMARY KEY (id)
);

-- Fornecedor
CREATE TABLE IF NOT EXISTS fornecedor
(
    id SERIAL,
    nome text,
    descricao text,
    cidade text,
    endereco text,
    bairro text,
    numero integer,
    CONSTRAINT fornecedor_id_fk PRIMARY KEY (id)
);

-- E-mail
CREATE TABLE IF NOT EXISTS  email
(
    id SERIAL,
    email text,
    referencia text,
    id_fornecedor integer NOT NULL,
    CONSTRAINT email_id_pk PRIMARY KEY (id),
    CONSTRAINT email_id_fornecedor_fk FOREIGN KEY (id_fornecedor)
        REFERENCES fornecedor (id) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

-- Pedido
CREATE TABLE IF NOT EXISTS pedido
(
    id SERIAL,
    datahora timestamp without time zone DEFAULT CURRENT_DATE,
    notafiscal text,
    valorfrete numeric,
    desconto numeric,
    valortotal numeric,
    id_transportadora integer NOT NULL,
    CONSTRAINT pedido_id_pk PRIMARY KEY (id),
    CONSTRAINT pedido_id_transportadora_fk FOREIGN KEY (id_transportadora)
        REFERENCES transportadora (id) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

-- Produto
CREATE TABLE IF NOT EXISTS produto
(
    id SERIAL,
    nome text,
    descricao text,
    id_fornecedor integer NOT NULL,
    CONSTRAINT produto_id_pk PRIMARY KEY (id),
    CONSTRAINT produto_id_fornecedor_fk FOREIGN KEY (id_fornecedor)
        REFERENCES fornecedor (id) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

-- Item
CREATE TABLE IF NOT EXISTS item
(
    id SERIAL,
    quantidade numeric,
    valor numeric,
    id_produto integer NOT NULL,
    id_pedido integer NOT NULL,
    CONSTRAINT item_id_pk PRIMARY KEY (id),
    CONSTRAINT item_id_pedido_fk FOREIGN KEY (id_pedido)
        REFERENCES pedido (id) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    CONSTRAINT item_id_produto_fk FOREIGN KEY (id_produto)
        REFERENCES produto (id) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

-- Telefone
CREATE TABLE IF NOT EXISTS telefone
(
    id SERIAL,
    ddd text,
    numero text,
    referencia text,
    id_fornecedor integer NOT NULL,
    CONSTRAINT telefone_id_pk PRIMARY KEY (id),
    CONSTRAINT telefone_id_telefone_fk FOREIGN KEY (id_fornecedor)
        REFERENCES fornecedor (id) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);
