CREATE DATABASE db_construindo_vidas;
USE db_construindo_vidas;

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
('Ferramentas', 'Ferramentas manuais e elétricas.'),
('Materiais de Construção', 'Produtos para construção civil.'),
('Hidráulica', 'Produtos para instalações hidráulicas.'),
('Elétrica', 'Produtos para instalações elétricas.'),
('Pintura', 'Produtos para pintura e acabamento.');

INSERT INTO tb_produtos (nome, descricao, valor, estoque, id_categoria) VALUES
('Martelo', 'Ferramenta manual utilizada em contruções.', 25.00, 50, 1),
('Cimento', 'Saco de cimento 50kg.', 30.00, 100, 2),
('Prego', 'Material utilizado em contrução.', 5.00, 200, 3),
('Fio Elétrico', 'Fio elétrico de 2,5mm.', 35.00, 150, 4),
('Tinta Acrílica', 'Tinta acrílica para paredes.', 70.00, 75, 5),
('Cerra elétrica', 'Ferramenta elétrica para realizar cortes.', 250.00, 30, 1),
('Argamassa', 'Saco de argamassa 20kg.', 15.00, 80, 2),
('Chave de Fenda', 'Ferramenta manual utilizada para concertos e contrução.', 20.00, 100, 1);

SELECT * FROM tb_produtos WHERE valor > 100.00;
SELECT * FROM tb_produtos WHERE valor BETWEEN 70.00 AND 150.00;
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

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
WHERE c.tipo = 'Hidráulica';


