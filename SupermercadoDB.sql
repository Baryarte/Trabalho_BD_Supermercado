-- MySQL Script generated by MySQL Workbench
-- Tue Nov 24 17:46:05 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Sexo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Sexo` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Sexo` (
  `idSexo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL COMMENT 'Masculino ou feminino ou outros',
  PRIMARY KEY (`idSexo`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pessoa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Pessoa` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Pessoa` (
  `idPessoa` INT NOT NULL AUTO_INCREMENT,
  `nome` TEXT NOT NULL,
  `email` VARCHAR(200) NULL,
  PRIMARY KEY (`idPessoa`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Escolaridade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Escolaridade` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Escolaridade` (
  `idEscolaridade` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEscolaridade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estado_civil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Estado_civil` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Estado_civil` (
  `idEstado_civil` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstado_civil`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Estado` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Estado` (
  `idEstado` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idEstado`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Cidade` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Cidade` (
  `idCidade` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  `idEstado` INT NOT NULL,
  PRIMARY KEY (`idCidade`),
  INDEX `fk_Cidade_Estado1_idx` (`idEstado` ASC) VISIBLE,
  CONSTRAINT `fk_Cidade_Estado1`
    FOREIGN KEY (`idEstado`)
    REFERENCES `mydb`.`Estado` (`idEstado`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pessoa_fisica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Pessoa_fisica` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Pessoa_fisica` (
  `idPessoa` INT NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `idSexo` INT NOT NULL,
  `idEscolaridade` INT NULL,
  `data_nasc` DATE NOT NULL,
  `fornecedor` BIT(1) NOT NULL,
  `idEstado_civil` INT NOT NULL,
  `identidade` VARCHAR(7) NOT NULL,
  `idCidade` INT NOT NULL,
  PRIMARY KEY (`idPessoa`),
  INDEX `fk_Pessoa_Sexo1_idx` (`idSexo` ASC) VISIBLE,
  INDEX `fk_Pessoa_fisica_Pessoa1_idx` (`idPessoa` ASC) VISIBLE,
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
  INDEX `fk_Pessoa_fisica_Escolaridade1_idx` (`idEscolaridade` ASC) VISIBLE,
  INDEX `fk_Pessoa_fisica_Estado_civil1_idx` (`idEstado_civil` ASC) VISIBLE,
  INDEX `fk_Pessoa_fisica_Cidade1_idx` (`idCidade` ASC) VISIBLE,
  UNIQUE INDEX `identidade_UNIQUE` (`identidade` ASC) INVISIBLE,
  UNIQUE INDEX `pessoa_UNICA` (`cpf` ASC, `idSexo` ASC, `idEscolaridade` ASC, `data_nasc` ASC, `fornecedor` ASC, `idEstado_civil` ASC, `identidade` ASC, `idCidade` ASC) VISIBLE,
  CONSTRAINT `fk_Pessoa_Sexo1`
    FOREIGN KEY (`idSexo`)
    REFERENCES `mydb`.`Sexo` (`idSexo`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Pessoa_fisica_Pessoa1`
    FOREIGN KEY (`idPessoa`)
    REFERENCES `mydb`.`Pessoa` (`idPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Pessoa_fisica_Escolaridade1`
    FOREIGN KEY (`idEscolaridade`)
    REFERENCES `mydb`.`Escolaridade` (`idEscolaridade`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Pessoa_fisica_Estado_civil1`
    FOREIGN KEY (`idEstado_civil`)
    REFERENCES `mydb`.`Estado_civil` (`idEstado_civil`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Pessoa_fisica_Cidade1`
    FOREIGN KEY (`idCidade`)
    REFERENCES `mydb`.`Cidade` (`idCidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Setor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Setor` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Setor` (
  `idSetor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idSetor`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cargo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Cargo` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Cargo` (
  `idCargo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  `salario` FLOAT NOT NULL,
  `idSetor` INT NOT NULL,
  PRIMARY KEY (`idCargo`),
  INDEX `fk_Cargo_Setor1_idx` (`idSetor` ASC) VISIBLE,
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE,
  UNIQUE INDEX `cargo_UNICO` (`nome` ASC, `idSetor` ASC) VISIBLE,
  CONSTRAINT `fk_Cargo_Setor1`
    FOREIGN KEY (`idSetor`)
    REFERENCES `mydb`.`Setor` (`idSetor`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipo_telefone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Tipo_telefone` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Tipo_telefone` (
  `idTipo_Telefone` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL COMMENT 'residencial, pessoal',
  PRIMARY KEY (`idTipo_Telefone`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Telefone` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Telefone` (
  `idTelefone` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(200) NOT NULL,
  `idTipo_Telefone` INT NOT NULL,
  PRIMARY KEY (`idTelefone`),
  INDEX `fk_Telefone_Tipo_telefone1_idx` (`idTipo_Telefone` ASC) VISIBLE,
  UNIQUE INDEX `numero_UNIQUE` (`numero` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_Tipo_telefone1`
    FOREIGN KEY (`idTipo_Telefone`)
    REFERENCES `mydb`.`Tipo_telefone` (`idTipo_Telefone`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipo_endereco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Tipo_endereco` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Tipo_endereco` (
  `idTipo_endereco` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipo_endereco`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bairro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Bairro` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Bairro` (
  `idBairro` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  `idCidade` INT NOT NULL,
  PRIMARY KEY (`idBairro`),
  INDEX `fk_Bairro_Cidade1_idx` (`idCidade` ASC) VISIBLE,
  UNIQUE INDEX `Bairro_UNICO` (`nome` ASC, `idCidade` ASC) VISIBLE,
  CONSTRAINT `fk_Bairro_Cidade1`
    FOREIGN KEY (`idCidade`)
    REFERENCES `mydb`.`Cidade` (`idCidade`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Endereco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Endereco` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Endereco` (
  `idEndereco` INT NOT NULL AUTO_INCREMENT,
  `rua` VARCHAR(200) NOT NULL,
  `numero` VARCHAR(200) NOT NULL,
  `cep` VARCHAR(200) NOT NULL,
  `complemento` VARCHAR(200) NULL,
  `idTipo_endereco` INT NOT NULL,
  `idBairro` INT NOT NULL,
  PRIMARY KEY (`idEndereco`),
  INDEX `fk_Endereco_Tipo_endereco1_idx` (`idTipo_endereco` ASC) INVISIBLE,
  INDEX `fk_Endereco_Bairro1_idx` (`idBairro` ASC) INVISIBLE,
  UNIQUE INDEX `Endereco_UNICO` (`rua` ASC, `numero` ASC, `cep` ASC, `idTipo_endereco` ASC, `idBairro` ASC, `complemento` ASC) INVISIBLE,
  CONSTRAINT `fk_Endereco_Tipo_endereco1`
    FOREIGN KEY (`idTipo_endereco`)
    REFERENCES `mydb`.`Tipo_endereco` (`idTipo_endereco`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Endereco_Bairro1`
    FOREIGN KEY (`idBairro`)
    REFERENCES `mydb`.`Bairro` (`idBairro`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Funcionario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Funcionario` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Funcionario` (
  `idPessoa` INT NOT NULL,
  `matricula` INT NOT NULL AUTO_INCREMENT,
  `comissao` FLOAT NULL,
  `nome_pai` TEXT NULL,
  `data_nasc_pai` DATE NULL,
  `nome_mae` VARCHAR(200) NOT NULL,
  `data_nasc_mae` DATE NULL,
  `idCargo` INT NOT NULL,
  `Funcionario_idPessoa` INT NULL,
  `ativo` BIT(1) NOT NULL,
  PRIMARY KEY (`idPessoa`),
  INDEX `fk_Funcionario_Cargo1_idx` (`idCargo` ASC) VISIBLE,
  INDEX `fk_Funcionario_Pessoa_fisica1_idx` (`idPessoa` ASC) VISIBLE,
  UNIQUE INDEX `matricula_UNIQUE` (`matricula` ASC) VISIBLE,
  INDEX `fk_Funcionario_Funcionario1_idx` (`Funcionario_idPessoa` ASC) VISIBLE,
  UNIQUE INDEX `funcionario_UNICO` (`matricula` ASC, `nome_mae` ASC, `idCargo` ASC, `ativo` ASC) INVISIBLE,
  CONSTRAINT `fk_Funcionario_Cargo1`
    FOREIGN KEY (`idCargo`)
    REFERENCES `mydb`.`Cargo` (`idCargo`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Funcionario_Pessoa_fisica1`
    FOREIGN KEY (`idPessoa`)
    REFERENCES `mydb`.`Pessoa_fisica` (`idPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Funcionario_Funcionario1`
    FOREIGN KEY (`Funcionario_idPessoa`)
    REFERENCES `mydb`.`Funcionario` (`idPessoa`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipo_mercadoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Tipo_mercadoria` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Tipo_mercadoria` (
  `idTipo_mercadoria` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipo_mercadoria`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pessoa_juridica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Pessoa_juridica` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Pessoa_juridica` (
  `idPessoa` INT NOT NULL,
  `cnpj` VARCHAR(14) NOT NULL,
  `fornecedor` BIT(1) NOT NULL,
  `Funcionario_idPessoa` INT NULL,
  PRIMARY KEY (`idPessoa`),
  INDEX `fk_Pessoa_juridica_Pessoa1_idx` (`idPessoa` ASC) VISIBLE,
  INDEX `fk_Pessoa_juridica_Funcionario1_idx` (`Funcionario_idPessoa` ASC) VISIBLE,
  UNIQUE INDEX `cnpj_UNIQUE` (`cnpj` ASC) INVISIBLE,
  CONSTRAINT `fk_Pessoa_juridica_Pessoa1`
    FOREIGN KEY (`idPessoa`)
    REFERENCES `mydb`.`Pessoa` (`idPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Pessoa_juridica_Funcionario1`
    FOREIGN KEY (`Funcionario_idPessoa`)
    REFERENCES `mydb`.`Funcionario` (`idPessoa`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Marca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Marca` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Marca` (
  `idMarca` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(75) NOT NULL,
  `Pessoa_juridica_idPessoa` INT NOT NULL,
  PRIMARY KEY (`idMarca`),
  INDEX `fk_Marca_Pessoa_juridica1_idx` (`Pessoa_juridica_idPessoa` ASC) VISIBLE,
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE,
  UNIQUE INDEX `marca_UNICA` (`nome` ASC, `Pessoa_juridica_idPessoa` ASC) VISIBLE,
  CONSTRAINT `fk_Marca_Pessoa_juridica1`
    FOREIGN KEY (`Pessoa_juridica_idPessoa`)
    REFERENCES `mydb`.`Pessoa_juridica` (`idPessoa`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mercadoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Mercadoria` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Mercadoria` (
  `idMercadoria` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  `preco_venda` FLOAT NOT NULL,
  `peso` VARCHAR(10) NULL,
  `quantidade` INT NOT NULL,
  `data_vencimento` DATE NOT NULL,
  `volume` VARCHAR(10) NULL,
  `criado_em` TIMESTAMP NOT NULL,
  `preco_compra` FLOAT NOT NULL,
  `lote` VARCHAR(100) NOT NULL,
  `data_fabricacao` DATE NOT NULL,
  `Funcionario_idPessoa` INT NOT NULL,
  `idTipo_mercadoria` INT NOT NULL,
  `idMarca` INT NOT NULL,
  PRIMARY KEY (`idMercadoria`),
  INDEX `fk_Mercadoria_Funcionario1_idx` (`Funcionario_idPessoa` ASC) VISIBLE,
  INDEX `fk_Mercadoria_Tipo_mercadoria1_idx` (`idTipo_mercadoria` ASC) VISIBLE,
  INDEX `fk_Mercadoria_Marca1_idx` (`idMarca` ASC) VISIBLE,
  UNIQUE INDEX `mercadoria_UNICA` (`nome` ASC, `idTipo_mercadoria` ASC, `idMarca` ASC, `lote` ASC, `data_fabricacao` ASC) VISIBLE,
  CONSTRAINT `fk_Mercadoria_Funcionario1`
    FOREIGN KEY (`Funcionario_idPessoa`)
    REFERENCES `mydb`.`Funcionario` (`idPessoa`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Mercadoria_Tipo_mercadoria1`
    FOREIGN KEY (`idTipo_mercadoria`)
    REFERENCES `mydb`.`Tipo_mercadoria` (`idTipo_mercadoria`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Mercadoria_Marca1`
    FOREIGN KEY (`idMarca`)
    REFERENCES `mydb`.`Marca` (`idMarca`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idPessoa` INT NOT NULL,
  `Funcionario_idPessoa` INT NOT NULL,
  PRIMARY KEY (`idPessoa`),
  INDEX `fk_Cliente_Funcionario1_idx` (`Funcionario_idPessoa` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Pessoa_fisica1`
    FOREIGN KEY (`idPessoa`)
    REFERENCES `mydb`.`Pessoa_fisica` (`idPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Cliente_Funcionario1`
    FOREIGN KEY (`Funcionario_idPessoa`)
    REFERENCES `mydb`.`Funcionario` (`idPessoa`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Dependente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Dependente` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Dependente` (
  `idPessoa` INT NOT NULL,
  `Funcionario_idPessoa` INT NOT NULL,
  PRIMARY KEY (`idPessoa`),
  INDEX `fk_Dependente_Pessoa_fisica1_idx` (`idPessoa` ASC) VISIBLE,
  INDEX `fk_Dependente_Funcionario1_idx` (`Funcionario_idPessoa` ASC) VISIBLE,
  CONSTRAINT `fk_Dependente_Pessoa_fisica1`
    FOREIGN KEY (`idPessoa`)
    REFERENCES `mydb`.`Pessoa_fisica` (`idPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Dependente_Funcionario1`
    FOREIGN KEY (`Funcionario_idPessoa`)
    REFERENCES `mydb`.`Funcionario` (`idPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Atualizado_em`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Atualizado_em` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Atualizado_em` (
  `idAtualizado_em` INT NOT NULL AUTO_INCREMENT,
  `idMercadoria` INT NOT NULL,
  `Funcionario_idPessoa` INT NOT NULL,
  `instante` TIMESTAMP NOT NULL,
  `preco_antigo` FLOAT NOT NULL,
  `preco_novo` FLOAT NOT NULL,
  `quantidade_antiga` INT NOT NULL,
  `quantidade_nova` INT NOT NULL,
  `preco_compra_antigo` FLOAT NOT NULL,
  `preco_compra_novo` FLOAT NOT NULL,
  PRIMARY KEY (`idAtualizado_em`),
  INDEX `fk_Atualizado_em_Mercadoria1_idx` (`idMercadoria` ASC) VISIBLE,
  INDEX `fk_Atualizado_em_Funcionario1_idx` (`Funcionario_idPessoa` ASC) VISIBLE,
  CONSTRAINT `fk_Atualizado_em_Mercadoria1`
    FOREIGN KEY (`idMercadoria`)
    REFERENCES `mydb`.`Mercadoria` (`idMercadoria`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Atualizado_em_Funcionario1`
    FOREIGN KEY (`Funcionario_idPessoa`)
    REFERENCES `mydb`.`Funcionario` (`idPessoa`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipo_pagamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Tipo_pagamento` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Tipo_pagamento` (
  `idTipo_pagamento` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL COMMENT 'À vista, parcelado',
  PRIMARY KEY (`idTipo_pagamento`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Forma_pagamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Forma_pagamento` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Forma_pagamento` (
  `idForma_pagamento` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL COMMENT 'cartao de debito - a vista, cartao de credito - parcelado, cheque - a vista, cheque - parcelado, dinheiro - a vista',
  `idTipo_pagamento` INT NOT NULL,
  PRIMARY KEY (`idForma_pagamento`),
  INDEX `fk_Forma_pagamento_Tipo_pagamento1_idx` (`idTipo_pagamento` ASC) VISIBLE,
  UNIQUE INDEX `forma_UNICA` (`nome` ASC, `idTipo_pagamento` ASC) VISIBLE,
  CONSTRAINT `fk_Forma_pagamento_Tipo_pagamento1`
    FOREIGN KEY (`idTipo_pagamento`)
    REFERENCES `mydb`.`Tipo_pagamento` (`idTipo_pagamento`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pagamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Pagamento` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Pagamento` (
  `idPagamento` INT NOT NULL AUTO_INCREMENT,
  `idForma_pagamento` INT NOT NULL,
  `Funcionario_idPessoa` INT NOT NULL,
  `Cliente_idPessoa` INT NOT NULL,
  `valor_total` FLOAT NOT NULL,
  `valor_recebido` FLOAT NOT NULL,
  `troco` FLOAT NOT NULL,
  `instante` TIMESTAMP NOT NULL,
  PRIMARY KEY (`idPagamento`),
  INDEX `fk_Pagamento_Funcionario1_idx` (`Funcionario_idPessoa` ASC) VISIBLE,
  INDEX `fk_Pagamento_Forma_pagamento1_idx` (`idForma_pagamento` ASC) VISIBLE,
  INDEX `fk_Pagamento_Cliente1_idx` (`Cliente_idPessoa` ASC) VISIBLE,
  CONSTRAINT `fk_Pagamento_Funcionario1`
    FOREIGN KEY (`Funcionario_idPessoa`)
    REFERENCES `mydb`.`Funcionario` (`idPessoa`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Pagamento_Forma_pagamento1`
    FOREIGN KEY (`idForma_pagamento`)
    REFERENCES `mydb`.`Forma_pagamento` (`idForma_pagamento`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Pagamento_Cliente1`
    FOREIGN KEY (`Cliente_idPessoa`)
    REFERENCES `mydb`.`Cliente` (`idPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Desconto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Desconto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Desconto` (
  `idDesconto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  `valor` FLOAT NOT NULL,
  `validade` DATE NOT NULL,
  PRIMARY KEY (`idDesconto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Compra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Compra` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Compra` (
  `idPagamento` INT NOT NULL,
  `idMercadoria` INT NOT NULL,
  `idDesconto` INT NULL,
  `quantidade` INT NOT NULL,
  `instante` TIMESTAMP NOT NULL,
  PRIMARY KEY (`idPagamento`, `idMercadoria`),
  INDEX `fk_Compra_Pagamento1_idx` (`idPagamento` ASC) VISIBLE,
  INDEX `fk_Compra_Mercadoria1_idx` (`idMercadoria` ASC) VISIBLE,
  INDEX `fk_Compra_Desconto1_idx` (`idDesconto` ASC) VISIBLE,
  CONSTRAINT `fk_Compra_Pagamento1`
    FOREIGN KEY (`idPagamento`)
    REFERENCES `mydb`.`Pagamento` (`idPagamento`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Compra_Mercadoria1`
    FOREIGN KEY (`idMercadoria`)
    REFERENCES `mydb`.`Mercadoria` (`idMercadoria`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Compra_Desconto1`
    FOREIGN KEY (`idDesconto`)
    REFERENCES `mydb`.`Desconto` (`idDesconto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Parcela`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Parcela` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Parcela` (
  `idParcela` INT NOT NULL AUTO_INCREMENT,
  `valor` FLOAT NOT NULL,
  `paga` BIT(1) NULL,
  `multa` FLOAT NULL,
  `data_vencimento` DATE NOT NULL,
  `juros` FLOAT NULL,
  `data_pagamento` DATE NULL,
  `idPagamento` INT NOT NULL,
  `instante` TIMESTAMP NOT NULL,
  PRIMARY KEY (`idParcela`),
  INDEX `fk_Parcela_Pagamento1_idx` (`idPagamento` ASC) VISIBLE,
  CONSTRAINT `fk_Parcela_Pagamento1`
    FOREIGN KEY (`idPagamento`)
    REFERENCES `mydb`.`Pagamento` (`idPagamento`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Reabastecimento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Reabastecimento` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Reabastecimento` (
  `idMercadoria` INT NOT NULL,
  `Funcionario_idPessoa` INT NOT NULL,
  `Pessoa_fisica_idPessoa` INT NULL,
  `Pessoa_juridica_idPessoa` INT NULL,
  `quantidade` INT NOT NULL,
  `instante` TIMESTAMP NOT NULL,
  `valor_total` FLOAT NOT NULL,
  PRIMARY KEY (`idMercadoria`, `Funcionario_idPessoa`),
  INDEX `fk_Pessoa_juridica_has_Mercadoria_Mercadoria1_idx` (`idMercadoria` ASC) VISIBLE,
  INDEX `fk_Pessoa_juridica_has_Mercadoria_Pessoa_juridica1_idx` (`Pessoa_juridica_idPessoa` ASC) VISIBLE,
  INDEX `fk_Reabastecimento_Pessoa_fisica1_idx` (`Pessoa_fisica_idPessoa` ASC) VISIBLE,
  INDEX `fk_Reabastecimento_Funcionario1_idx` (`Funcionario_idPessoa` ASC) VISIBLE,
  CONSTRAINT `fk_Pessoa_juridica_has_Mercadoria_Pessoa_juridica1`
    FOREIGN KEY (`Pessoa_juridica_idPessoa`)
    REFERENCES `mydb`.`Pessoa_juridica` (`idPessoa`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Pessoa_juridica_has_Mercadoria_Mercadoria1`
    FOREIGN KEY (`idMercadoria`)
    REFERENCES `mydb`.`Mercadoria` (`idMercadoria`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Reabastecimento_Pessoa_fisica1`
    FOREIGN KEY (`Pessoa_fisica_idPessoa`)
    REFERENCES `mydb`.`Pessoa_fisica` (`idPessoa`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Reabastecimento_Funcionario1`
    FOREIGN KEY (`Funcionario_idPessoa`)
    REFERENCES `mydb`.`Funcionario` (`idPessoa`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefone_tem_Pessoa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Telefone_tem_Pessoa` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Telefone_tem_Pessoa` (
  `idTelefone` INT NOT NULL AUTO_INCREMENT,
  `idPessoa` INT NOT NULL,
  PRIMARY KEY (`idTelefone`, `idPessoa`),
  INDEX `fk_Telefone_has_Pessoa_Pessoa1_idx` (`idPessoa` ASC) VISIBLE,
  INDEX `fk_Telefone_has_Pessoa_Telefone1_idx` (`idTelefone` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_has_Pessoa_Telefone1`
    FOREIGN KEY (`idTelefone`)
    REFERENCES `mydb`.`Telefone` (`idTelefone`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Telefone_has_Pessoa_Pessoa1`
    FOREIGN KEY (`idPessoa`)
    REFERENCES `mydb`.`Pessoa` (`idPessoa`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pessoa_tem_endereco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Pessoa_tem_endereco` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Pessoa_tem_endereco` (
  `idEndereco` INT NOT NULL,
  `idPessoa` INT NOT NULL,
  PRIMARY KEY (`idEndereco`, `idPessoa`),
  INDEX `fk_Endereco_has_Pessoa_Pessoa1_idx` (`idPessoa` ASC) VISIBLE,
  INDEX `fk_Endereco_has_Pessoa_Endereco1_idx` (`idEndereco` ASC) VISIBLE,
  CONSTRAINT `fk_Endereco_has_Pessoa_Endereco1`
    FOREIGN KEY (`idEndereco`)
    REFERENCES `mydb`.`Endereco` (`idEndereco`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Endereco_has_Pessoa_Pessoa1`
    FOREIGN KEY (`idPessoa`)
    REFERENCES `mydb`.`Pessoa` (`idPessoa`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Historico_desconto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Historico_desconto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Historico_desconto` (
  `idDesconto` INT NOT NULL,
  `idMercadoria` INT NULL,
  `idTipo_mercadoria` INT NULL,
  `idMarca` INT NULL,
  PRIMARY KEY (`idDesconto`),
  INDEX `fk_Mercadoria_has_Desconto_Desconto1_idx` (`idDesconto` ASC) VISIBLE,
  INDEX `fk_Mercadoria_has_Desconto_Mercadoria1_idx` (`idMercadoria` ASC) VISIBLE,
  INDEX `fk_Historico_desconto_Tipo_mercadoria1_idx` (`idTipo_mercadoria` ASC) VISIBLE,
  INDEX `fk_Historico_desconto_Marca1_idx` (`idMarca` ASC) VISIBLE,
  CONSTRAINT `fk_Mercadoria_has_Desconto_Mercadoria1`
    FOREIGN KEY (`idMercadoria`)
    REFERENCES `mydb`.`Mercadoria` (`idMercadoria`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Mercadoria_has_Desconto_Desconto1`
    FOREIGN KEY (`idDesconto`)
    REFERENCES `mydb`.`Desconto` (`idDesconto`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Historico_desconto_Tipo_mercadoria1`
    FOREIGN KEY (`idTipo_mercadoria`)
    REFERENCES `mydb`.`Tipo_mercadoria` (`idTipo_mercadoria`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Historico_desconto_Marca1`
    FOREIGN KEY (`idMarca`)
    REFERENCES `mydb`.`Marca` (`idMarca`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
