DROP DATABASE IF EXISTS lojaBrinquedos;
CREATE DATABASE IF NOT EXISTS lojaBrinquedos;

DROP TABLE IF EXISTS `brinquedo`;
DROP TABLE IF EXISTS `administracao`;

use lojaBrinquedos;
CREATE TABLE `administracao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `login` varchar(50) NOT NULL,
  `senha` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
CREATE TABLE `brinquedo` (
  `codigo` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  `categoria` varchar(255) DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `descricao` text,
  `image` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `administracao` (`nome`, `login`, `senha`) VALUES
  ('Jadir Custódio', 'jadir@toylandia', '2,5'),
  ('Carlos Eduardo', 'carlos@toylandia', '29936489'),
  ('Felipe Pires', 'felipe@toylandia', '29957478'),
  ('Matheus Banqueiro', 'matheus@toylandia', '29960231'),
  ('Renan Miguel', 'renan@toylandia', '29316561'),
  ('Rodrigo Fernandes', 'rodrigo@toylandia', '29760119');
