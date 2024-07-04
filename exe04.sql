CREATE DATABASE db_cidade_das_carnes;
USE db_cidade_das_carnes;

CREATE TABLE tb_categorias (
id BIGINT AUTO_INCREMENT,
tipo VARCHAR(50),
descricao VARCHAR (100),
Primary key(id)
);

CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(400),
    valor DECIMAL(10, 2),
    estoque INT,
    id_categoria BIGINT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (tipo, descricao) VALUES
('Carnes', 'Produtos de carne para venda.'),
('Aves', 'Produtos de aves para venda.'),
('Porcos', 'Produtos de porcos para venda.'),
('Frutos do Mar', 'Produtos de frutos do mar para venda.'),
('Peixes', 'Produtos de peixes para venda.');

INSERT INTO tb_produtos (nome, descricao, valor, estoque, id_categoria) VALUES
('Picanha', 'Corte nobre de carne bovina.', 80.00, 20, 1),
('Peito de Frango', 'Peito de frango desossado.', 15.00, 50, 2),
('Camarão', 'Fruto do mar limpo e fresco.', 30.50, 100, 4),
('Bacon', 'Carne de porco gordurosa.', 15.00, 80, 3),
('Salmão Fresco', 'Peixe fresco para preparo.', 120.00, 10, 5),
('Costela Suína', 'Corte suculento de carne suína.', 60.00, 30, 3),
('Tilápia', 'Peixe de água doce fresco.', 75.50, 120, 5),
('Mexilhão', 'Fruta do mar do tipo molusco.', 90.00, 150, 4);

SELECT * FROM tb_produtos WHERE valor > 50.00;
SELECT * FROM tb_produtos WHERE valor BETWEEN 50.00 AND 150.00;

SELECT 
    p.nome AS produto,
    p.descricao AS descricao_produto,
    p.valor,
    p.estoque,
    c.tipo AS categoria,
    c.descricao AS descricao_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id;

SELECT 
    p.nome AS produto,
    p.descricao AS descricao_produto,
    p.valor,
    p.estoque,
    c.tipo AS categoria,
    c.descricao AS descricao_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id
WHERE c.tipo IN ('Aves', 'Peixes');
