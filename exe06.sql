CREATE DATABASE db_curso_ead;
USE db_curso_ead;

CREATE TABLE tb_categorias (
id BIGINT AUTO_INCREMENT,
tipo VARCHAR(50),
duracao VARCHAR (100),
Primary key(id)
);

CREATE TABLE tb_cursos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(400),
    valor DECIMAL(10, 2),
    carga_horaria INT,
    id_categoria BIGINT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (tipo, descricao) VALUES
('Administração', 'Cursos de desenvolvimento de software e programação.'),
('Design', 'Cursos de design gráfico e web design.'),
('Marketing', 'Cursos de marketing digital e publicidade.'),
('Negócios', 'Cursos de gestão empresarial e empreendedorismo.'),
('Oratória', 'Cursos de Oratória, aprendendo a ase comunicar.');

INSERT INTO tb_cursos (nome, descricao, valor, carga_horaria, id_categoria) VALUES
('Cruso de Gestão de Pessoas', 'Curso completo de Gestão de Pessoas.', 1000.00, 60, 1),
('Curso de Photoshop', 'Curso de edição de imagens com Photoshop.', 450.00, 40, 2),
('Curso de Organização', 'Curso para esninar técnicas de organização.', 500.00, 30, 1),
('Curso de Gestão de Projetos', 'Curso de gerenciamento de projetos.', 800.00, 50, 4),
('Curso para Falar em público', 'Curso para aprender a se comunicar com público.', 600.00, 100, 5),
('Curso de Administração empresarial', 'Curso de administração de empresas.', 980.00, 60, 1),
('Curso de Illustrator', 'Curso de design gráfico com Illustrator.', 400.00, 40, 2),
('Curso de oratória empresarial', 'Curso para se comunicar no mercado empresarial.', 970.00, 100, 5);

SELECT * FROM tb_cursos WHERE valor > 500.00;
SELECT * FROM tb_cursos WHERE valor BETWEEN 600.00 AND 1000.00;
SELECT * FROM tb_cursos WHERE nome LIKE '%J%';

SELECT 
    c.nome AS curso,
    c.descricao AS descricao_curso,
    c.valor,
    c.carga_horaria,
    cat.tipo AS categoria,
    cat.descricao AS descricao_categoria
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.id_categoria = cat.id;

SELECT 
    c.nome AS curso,
    c.descricao AS descricao_curso,
    c.valor,
    c.carga_horaria,
    cat.tipo AS categoria,
    cat.descricao AS descricao_categoria
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.id_categoria = cat.id
WHERE cat.tipo = 'Programação';


