SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema digital-booking
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `digital-booking` DEFAULT CHARACTER SET utf8 ;
USE `digital-booking` ;

-- Tabela Caracteristicas

CREATE TABLE IF NOT EXISTS `digital-booking`.`caracteristicas` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `uid` BIGINT NOT NULL,
  `nome` VARCHAR(255),
  `icone` VARCHAR(255),
    PRIMARY KEY (`id`),
    UNIQUE INDEX `uid_UNIQUE` (`uid` ASC),
    UNIQUE INDEX `id_caracteristicas_UNIQUE` (`id` ASC) 
  )
ENGINE = InnoDB;

-- Tabela Categorias

CREATE TABLE IF NOT EXISTS `digital-booking`.`categorias` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `uid` BIGINT NOT NULL,
  `descricao` VARCHAR(255),
  `url_imagem` VARCHAR(255),
  PRIMARY KEY (`id`),
	UNIQUE INDEX `uid_UNIQUE` (`uid` ASC),
	UNIQUE INDEX `id_categorias_UNIQUE` (`id` ASC)
  )
 ENGINE = InnoDB;
 
-- Tabela Cidades

CREATE TABLE IF NOT EXISTS `digital-booking`.`cidades` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `uid` BIGINT NOT NULL,
  `nome` VARCHAR(255),
  `pais` VARCHAR(255),
	PRIMARY KEY (`id`),
	UNIQUE INDEX `uid_UNIQUE` (`uid` ASC),
	UNIQUE INDEX `id_cidades_UNIQUE` (`id` ASC))
ENGINE = InnoDB;

-- Tabela Imagens

CREATE TABLE IF NOT EXISTS `digital-booking`.`imagens` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `uid` BIGINT NOT NULL,
  `titulo` VARCHAR(255),
  `url` VARCHAR(255),
    PRIMARY KEY (`id`),
	UNIQUE INDEX `uid_UNIQUE` (`uid` ASC),
	UNIQUE INDEX `id_imagens_UNIQUE` (`id` ASC) )
ENGINE = InnoDB;

-- Tabela Produtos

CREATE TABLE IF NOT EXISTS `digital-booking`.`produtos` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `classificacao` INT NOT NULL,
  `descricao` VARCHAR(512),
  `latitude` DOUBLE NOT NULL,
  `longitude` DOUBLE NOT NULL,
  `nome` VARCHAR(255) ,
  `qualificacao` INT NOT NULL,
  `uid` BIGINT NOT NULL,
  `categoria_id` BIGINT NOT NULL,
  `cidade_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
UNIQUE INDEX `uid_UNIQUE` (`uid` ASC),
  INDEX `fk_produtos_categorias_idx` (`categoria_id` ASC),
  INDEX `fk_produtos_cidades_idx` (`cidade_id` ASC),
CONSTRAINT `fk_produtos_categorias`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `digital-booking`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT `fk_produtos_cidades`
    FOREIGN KEY (`cidade_id`)
    REFERENCES `digital-booking`.`cidades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Tabela intermediária Produto-Imagens

CREATE TABLE IF NOT EXISTS `digital-booking`.`produto_imagens`(
`produto_id` BIGINT NOT NULL,
`imagem_id` BIGINT NOT NULL,
  PRIMARY KEY (`produto_id`,`imagem_id`),
  INDEX `fk_produto_imagem_produto_idx` (`produto_id` ASC),
  INDEX `fk_produto_imagem_imagem_idx` (`imagem_id` ASC),
-- UNIQUE INDEX `imagem_id` (`imagem_id`),
  CONSTRAINT `fk_produto_imagem_produto`
    FOREIGN KEY (`produto_id`)
    REFERENCES `digital-booking`.`produtos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT `fk_produto_imagem_imagem`
    FOREIGN KEY (`imagem_id`)
    REFERENCES `digital-booking`.`imagens` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Tabela Intermediária Produtos-Caracteristicas

CREATE TABLE IF NOT EXISTS `digital-booking`.`produtos_caracteristicas` (
  `produto_id` BIGINT NOT NULL,
  `caracteristica_id` BIGINT NOT NULL,
  PRIMARY KEY (`produto_id`, `caracteristica_id`),
  INDEX `fk_produto_caracteristica_caracteristica_idx` (`caracteristica_id` ASC),
  INDEX `fk_produto_caracteristica_produto_idx` (`produto_id` ASC),
  CONSTRAINT `fk_produto_caracteristica_produto`
    FOREIGN KEY (`produto_id`)
    REFERENCES `digital-booking`.`produtos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_caracteristica_caracteristica`
    FOREIGN KEY (`caracteristica_id`)
    REFERENCES `digital-booking`.`caracteristicas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Sprint 3

-- Tabela perfis

CREATE TABLE IF NOT EXISTS `digital-booking`.`perfis` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  -- `uid` BIGINT NOT NULL,
  `nome` VARCHAR(255) ,
  PRIMARY KEY (`id`),
  -- UNIQUE INDEX `uid_UNIQUE` (`uid` ASC),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC),
  UNIQUE INDEX `id_funcoes_UNIQUE` (`id` ASC) )
ENGINE = InnoDB;

-- Tabela usuários

CREATE TABLE IF NOT EXISTS `digital-booking`.`usuarios` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  -- `uid` BIGINT NOT NULL,
  `email` VARCHAR(200),
  `nome` VARCHAR(50)  ,
  `senha` VARCHAR(90),
  `sobrenome` VARCHAR(50) ,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_usuarios_UNIQUE` (`id` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC)
-- 	UNIQUE INDEX `uid_UNIQUE` (`uid` ASC),
 )
ENGINE = InnoDB;

-- Tabela usuarios_perfis

CREATE TABLE IF NOT EXISTS `digital-booking`.`usuarios_perfis`(
`usuario_id` BIGINT NOT NULL,
`perfis_id` BIGINT NOT NULL,
	PRIMARY KEY (`usuario_id`, `perfis_id`),
	INDEX `fk_usuario_perfis_usuario_idx`(`usuario_id` ASC),
    INDEX `fk_usuario_perfis_perfis_idx`(`perfis_id` ASC),
	CONSTRAINT `fk_usuario_perfis_usuario_idx`
		FOREIGN KEY (`usuario_id`)
		REFERENCES `digital-booking`.`usuarios` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
    CONSTRAINT `fk_usuario_perfis_perfis_idx`
		FOREIGN KEY (`perfis_id`)
        REFERENCES `digital-booking`.`perfis` (`id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Tabela reservas

CREATE TABLE IF NOT EXISTS `digital-booking`.`reservas`(
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `horario_inicio_reserva` DATETIME,
  `data_inicial_reserva` DATE,
  `data_final_reserva` DATE,
  `data_inicio_reserva` DATETIME (6),
  `uid` BIGINT NOT NULL,
  `nome` DATETIME(6),
  `produto_id` BIGINT NOT NULL,
  `usuario_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uid_UNIQUE` (`uid` ASC), 
  UNIQUE INDEX `id_reservas_UNIQUE` (`id` ASC),
  UNIQUE INDEX `nome` (`nome` ASC),
  INDEX `fk_produto_idx` (`produto_id` ASC),
  INDEX `fk_usuario_idx` (`usuario_id` ASC),
	CONSTRAINT `fk_produto_idx`
		FOREIGN KEY (`produto_id`)
		REFERENCES `digital-booking`.`produtos` (`id`)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	CONSTRAINT `fk_usuario_idx`
		FOREIGN KEY (`usuario_id`)
		REFERENCES `digital-booking`.`usuarios` (`id`)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT
  ) 
ENGINE = InnoDB;


-- Tabela intermediária produtos_reservas

CREATE TABLE IF NOT EXISTS `digital-booking`.`produtos_reservas` (
  `produto_id` BIGINT NOT NULL,
  `reserva_id` BIGINT NOT NULL,
  PRIMARY KEY (`produto_id`, `reserva_id`),
  INDEX `fk_produto_reserva_reserva_idx` (`reserva_id` ASC),
  INDEX `fk_produto_reserva_produto_idx` (`produto_id` ASC),
  CONSTRAINT `fk_produto_reserva_produto`
    FOREIGN KEY (`produto_id`)
    REFERENCES `digital-booking`.`produtos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_reserva_reserva`
    FOREIGN KEY (`reserva_id`)
    REFERENCES `digital-booking`.`reservas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Tabela intermediária reservas_usuários

CREATE TABLE IF NOT EXISTS `digital-booking`.`reservas_usuarios` (
  `reserva_id` BIGINT NOT NULL,
  `usuario_id` BIGINT NOT NULL,
  PRIMARY KEY (`reserva_id`, `usuario_id`),
  INDEX `fk_reserva_usuario_usuario_idx` (`usuario_id` ASC),
  INDEX `fk_reserva_usuario_reserva_idx` (`reserva_id` ASC),
  CONSTRAINT `fk_reserva_usuario_reserva`
    FOREIGN KEY (`reserva_id`)
    REFERENCES `digital-booking`.`reservas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva_usuario_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `digital-booking`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
