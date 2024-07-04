CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    descricao VARCHAR(100)
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
('Medicamentos', 'Produtos farmacêuticos para tratamento de doenças.'),
('Cosméticos', 'Produtos para cuidados pessoais e beleza.'),
('Higiene', 'Produtos de higiene pessoal.'),
('Suplementos', 'Produtos para suplementação alimentar.'),
('Curativos', 'Produtos voltados para o tratamento de feridas.');

INSERT INTO tb_produtos (nome, descricao, valor, estoque, id_categoria) VALUES
('Paracetamol', 'Medicamento para alívio da dor e febre.', 10.00, 100, 1),
('Condicionador', 'Produto para hidratação dos cabelos.', 15.00, 50, 2),
('Lenço Umidecido', 'Produto para higiene pessoal para adultos e crianças.', 10.50, 200, 3),
('Vitaminas', 'Suplemento alimentar para reforço nutricional.', 60.00, 75, 4),
('Band-aid', 'Produto para fechamento de machucados.', 5.00, 120, 5),
('Protetor Solar', 'Produto para proteção contra os raios solares.', 45.00, 80, 2),
('Escova de Dentes', 'Produto para higiene bucal.', 15.00, 150, 3),
('Omega 3', 'Suplemento alimentar com ômega 3.', 80.00, 60, 4);

SELECT * FROM tb_produtos WHERE valor > 50.00;
SELECT * FROM tb_produtos WHERE valor BETWEEN 5.00 AND 60.00;
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

SELECT 
    p.nome AS produto,
    p.descricao AS descricao_produto,
    p.valor,
    p.estoque,
    c.tipo AS categoria,
    c.descricao AS descricao_categoria
FROM tb_produtos p
LEFT JOIN tb_categorias c ON p.id_categoria = c.id;

SELECT 
    p.nome AS produto,
    p.descricao AS descricao_produto,
    p.valor,
    p.estoque,
    c.tipo AS categoria,
    c.descricao AS descricao_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id
WHERE c.tipo = 'Cosméticos';


