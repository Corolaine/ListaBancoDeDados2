CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

CREATE TABLE tb_categorias (
	id BIGINT AUTO_INCREMENT,
	tipo VARCHAR(255) NOT NULL,
	descricao VARCHAR (100) NOT NULL,
	Primary key(id)
	);

CREATE TABLE tb_pizzas (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    ingredientes TEXT NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    tamanho VARCHAR(100) NOT NULL,
    id_categoria BIGINT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (tipo, descricao) VALUES
('Tradicional', 'Pizzas tradicionais com sabores clássicos como margerita e calabresa.'),
('Especial', 'Pizzas com ingredientes e sabores especiais.'),
('Vegetariana', 'Pizzas sem carne, com ingredientes vegetais e derivados de animais com leite e ovos.'),
('Vegana', 'Pizzas completamente vegetais, sem nenhuma origem animal.'),
('Doce', 'Pizzas com sabores doce, como de sorvete e morango com nutella.');

INSERT INTO tb_pizzas (nome, ingredientes, valor, tamanho, id_categoria) VALUES
('Margherita', 'Tomate, Mussarela, Manjericão', 35.00, 'Média', 1),
('Pepperoni', 'Pepperoni, Mussarela, Molho de Tomate', 50.00, 'Grande', 2),
('Calabresa Veg', 'Mussarela Vegana, Calabresa Vegana, Molho de Tomate, Manjericão', 55.00, 'Grande', 4),
('Portuguesa', 'Presunto, Ovo, Cebola, Azeitona, Mussarela', 45.00, 'Média', 1),
('Vegetariana', 'Tomate, Pimentão, Cebola, Azeitona, Milho, Mussarela', 40.00, 'Média', 3),
('Nutella com morango', 'Nutella, Morango, Chantilly', 30.00, 'Média', 5),
('Lombo Canadense', 'Lombo Canadense, Queijo Brie, Molho de tomate, Manjericão', 60.00, 'Grande', 2),
('Banofe Vegana', 'Banana, Doce de Leite vegano, Creme vegano, Canela', 48.00, 'Média', 4);

SELECT * FROM tb_pizzas WHERE valor > 45.00;
SELECT * FROM tb_pizzas WHERE valor BETWEEN 50.00 AND 100.00;
SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';

SELECT 
    p.nome AS pizza,
    p.ingredientes,
    p.valor,
    p.tamanho,
    c.tipo AS categoria,
    c.descricao AS descricao_categoria
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = c.id;

SELECT 
    p.nome AS pizza,
    p.ingredientes,
    p.valor,
    p.tamanho,
    c.tipo AS categoria,
    c.descricao AS descricao_categoria
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = c.id
WHERE c.tipo = 'Doce';





