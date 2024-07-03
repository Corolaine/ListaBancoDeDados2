CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

CREATE TABLE tb_classes (
id BIGINT AUTO_INCREMENT,
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(400),
    descricao VARCHAR(400)
);

CREATE TABLE tb_personagens (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    habilidade VARCHAR(255) NOT NULL,
    poder_de_defesa INT,
    poder_de_ataque INT,
    forca VARCHAR(255) NOT NULL,
    vida INT,
    id_classe BIGINT NOT NULL, 
    FOREIGN KEY (id_classe) REFERENCES tb_classes(id)
);

INSERT INTO tb_classes (tipo, descricao) VALUES
('Ladino', 'Classe astuta que rouba ligeiramente.'),
('Bardo', 'Classe que utiliza seus dons artísticos para usar magia e habilidades.'),
('Arqueiro', 'Classe que utiliza arco e flecha para ataques à distância.'),
('Barbaro', 'Classe que utiliza de sua violência e ira para destruição.'),
('Guerreiro', 'Classe especializada em lutas corpo a corpo.');

INSERT INTO tb_personagens (nome, habilidade, poder_de_ataque, poder_de_defesa, forca, vida, id_classe) VALUES
('Murigorn', 'Furtividade', 2000, 2500, 'Média', 4, 1),
('Querico', 'Música Encantadora', 1700, 2200, 'Média', 5, 2),
('Legolas', 'Precisão com Arco', 2100, 1200, 'Alta', 7, 3),
('Cornihu', 'Martelo Mágico', 2800, 2000, 'Alta', 10, 4),
('Muniu', 'Fúria Descontrolada', 3400, 2000, 'Alta', 5, 5),
('Sheilon', 'Canto Hipnotizante', 1500, 2700, 'Baixa', 3, 2),
('Kirin', 'Mestre das Lâminas', 2000, 1700, 'Média', 6, 2),
('Pasmanc', 'Flechas da Morte', 5000, 7000, 'Alta', 9, 3);

SELECT * FROM tb_personagens WHERE poder_de_ataque > 2000;
SELECT * FROM tb_personagens WHERE poder_de_defesa BETWEEN 1000 AND 2000;
SELECT * FROM tb_personagens WHERE nome LIKE '%C%';

SELECT 
    p.nome AS personagem,
    p.habilidade,
    p.poder_de_ataque,
    p.poder_de_defesa,
    p.forca,
    p.vida,
    c.tipo AS classe,
    c.descricao AS descricao_classe
FROM tb_personagens p
INNER JOIN tb_classes c ON p.id_classe = c.id;

SELECT 
    p.nome AS personagem,
    p.habilidade,
    p.poder_de_ataque,
    p.poder_de_defesa,
    p.forca,
    p.vida,
    c.tipo AS classe,
    c.descricao AS descricao_classe
FROM tb_personagens p
INNER JOIN tb_classes c ON p.id_classe = c.id
WHERE c.tipo = 'Arqueiro';