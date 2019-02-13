-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 27-Nov-2018 às 03:42
-- Versão do servidor: 5.6.13
-- versão do PHP: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `db_cms`
--
CREATE DATABASE IF NOT EXISTS `db_cms` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `db_cms`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_contatos`
--

CREATE TABLE IF NOT EXISTS `tb_contatos` (
  `cd_contatos` int(11) NOT NULL AUTO_INCREMENT,
  `nm_telefone` varchar(14) DEFAULT NULL,
  `nm_celular` varchar(15) DEFAULT NULL,
  `cd_usuario` int(11) NOT NULL,
  PRIMARY KEY (`cd_contatos`),
  KEY `fk_contatos_usuario` (`cd_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `tb_contatos`
--

INSERT INTO `tb_contatos` (`cd_contatos`, `nm_telefone`, `nm_celular`, `cd_usuario`) VALUES
(1, '(13) 3034-4425', '(13) 99665-8271', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_funcao_usuario`
--

CREATE TABLE IF NOT EXISTS `tb_funcao_usuario` (
  `cd_funcao` int(11) NOT NULL AUTO_INCREMENT,
  `cd_usuario` int(11) NOT NULL,
  PRIMARY KEY (`cd_funcao`,`cd_usuario`),
  KEY `fk_funcao_usuario` (`cd_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `tb_funcao_usuario`
--

INSERT INTO `tb_funcao_usuario` (`cd_funcao`, `cd_usuario`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_funcoes`
--

CREATE TABLE IF NOT EXISTS `tb_funcoes` (
  `cd_funcao` int(11) NOT NULL AUTO_INCREMENT,
  `nm_funcao` varchar(45) NOT NULL,
  PRIMARY KEY (`cd_funcao`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `tb_funcoes`
--

INSERT INTO `tb_funcoes` (`cd_funcao`, `nm_funcao`) VALUES
(1, 'Admin');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_permissoes`
--

CREATE TABLE IF NOT EXISTS `tb_permissoes` (
  `cd_permissao` int(11) NOT NULL AUTO_INCREMENT,
  `nm_permissao` varchar(45) NOT NULL,
  PRIMARY KEY (`cd_permissao`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `tb_permissoes`
--

INSERT INTO `tb_permissoes` (`cd_permissao`, `nm_permissao`) VALUES
(1, 'Criar postagens');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_posts`
--

CREATE TABLE IF NOT EXISTS `tb_posts` (
  `cd_post` int(11) NOT NULL AUTO_INCREMENT,
  `nm_post` varchar(45) NOT NULL,
  `dt_post` varchar(12) NOT NULL,
  `ds_conteudo` varchar(380) NOT NULL,
  `ds_imagem` varchar(255) DEFAULT NULL,
  `cd_usuario` int(11) DEFAULT NULL,
  `cd_categoria` int(11) NOT NULL,
  `nm_categoria` varchar(45) NOT NULL,
  `cd_subcategoria` int(11) DEFAULT NULL,
  `nm_subcategoria` varchar(45) DEFAULT NULL,
  `ic_exibir` char(3) NOT NULL,
  PRIMARY KEY (`cd_post`),
  KEY `fk_posts_usuario` (`cd_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=45 ;

--
-- Extraindo dados da tabela `tb_posts`
--

INSERT INTO `tb_posts` (`cd_post`, `nm_post`, `dt_post`, `ds_conteudo`, `ds_imagem`, `cd_usuario`, `cd_categoria`, `nm_categoria`, `cd_subcategoria`, `nm_subcategoria`, `ic_exibir`) VALUES
(40, 'Sobre o novo CMS', '26/11/2018', 'Esse CMS (Content Management System), foi desenvolvido pelo grupo Etec Brothers, como Trabalho de Conclusão de Curso, para a ETEC de Praia Grande - Extensão Balneário Maracanã.&nbsp;', '22243.png', NULL, 0, 'Início', NULL, NULL, 'Sim'),
(41, 'Sobre a ETEC', '26/11/2018', 'A ETEC é uma das instituições de ensino mais renomadas do país.', '31396.png', NULL, 0, 'Início', NULL, NULL, 'Sim'),
(42, 'Novos Vagas', '26/11/2018', 'Prefeitura abre novas vagas para cargos na área de TI.', '24589.png', NULL, 0, 'Início', NULL, NULL, 'Sim'),
(44, 'Venha!', '26/11/2018', 'Venha fazer parte de uma das melhores escolas técnicas de São Paulo!', '19923.png', NULL, 0, 'Início', NULL, NULL, 'Sim');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuarios`
--

CREATE TABLE IF NOT EXISTS `tb_usuarios` (
  `cd_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `cd_senha` int(18) NOT NULL,
  `nm_funcao` varchar(45) DEFAULT NULL,
  `nm_usuario` varchar(45) NOT NULL,
  `nm_email` varchar(45) NOT NULL,
  PRIMARY KEY (`cd_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=20 ;

--
-- Extraindo dados da tabela `tb_usuarios`
--

INSERT INTO `tb_usuarios` (`cd_usuario`, `cd_senha`, `nm_funcao`, `nm_usuario`, `nm_email`) VALUES
(1, 123, 'admin', 'Jefferson', 'jeffersonadmin@gmail.com'),
(18, 123, 'admin', 'Henrique', 'henriquefizzzi@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuarios_permissoes`
--

CREATE TABLE IF NOT EXISTS `tb_usuarios_permissoes` (
  `cd_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `cd_permissoes` int(11) NOT NULL,
  PRIMARY KEY (`cd_usuario`,`cd_permissoes`),
  KEY `fk_usuario_permissoes` (`cd_permissoes`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `tb_usuarios_permissoes`
--

INSERT INTO `tb_usuarios_permissoes` (`cd_usuario`, `cd_permissoes`) VALUES
(1, 1);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tb_contatos`
--
ALTER TABLE `tb_contatos`
  ADD CONSTRAINT `fk_contatos_usuario` FOREIGN KEY (`cd_usuario`) REFERENCES `tb_usuarios` (`cd_usuario`);

--
-- Limitadores para a tabela `tb_funcao_usuario`
--
ALTER TABLE `tb_funcao_usuario`
  ADD CONSTRAINT `fk_funcao_usuario` FOREIGN KEY (`cd_usuario`) REFERENCES `tb_usuarios` (`cd_usuario`),
  ADD CONSTRAINT `fk_usuario_funcao` FOREIGN KEY (`cd_funcao`) REFERENCES `tb_funcoes` (`cd_funcao`);

--
-- Limitadores para a tabela `tb_posts`
--
ALTER TABLE `tb_posts`
  ADD CONSTRAINT `fk_posts_usuario` FOREIGN KEY (`cd_usuario`) REFERENCES `tb_usuarios` (`cd_usuario`);

--
-- Limitadores para a tabela `tb_usuarios_permissoes`
--
ALTER TABLE `tb_usuarios_permissoes`
  ADD CONSTRAINT `fk_permissoes_usuario` FOREIGN KEY (`cd_usuario`) REFERENCES `tb_usuarios` (`cd_usuario`),
  ADD CONSTRAINT `fk_usuario_permissoes` FOREIGN KEY (`cd_permissoes`) REFERENCES `tb_permissoes` (`cd_permissao`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
