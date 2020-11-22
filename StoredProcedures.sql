CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP PROCEDURE IF EXISTS `CriarBairro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarBairro`(in nomeBairro text, in nomeCidade text, in nomeEstado text )
BEGIN


call CriarCidade(nomeCidade, nomeEstado);

insert into bairro (nome, Cidade_idCidade)
select * from ( select nomeBairro, (select idCidade from cidade where cidade.nome = nomeCidade and cidade.Estado_idEstado = (select idEstado from estado where estado.nome = nomeEstado))) as tmp
where not exists (select * from bairro where bairro.nome = nomeBairro and Cidade_idCidade =  (select idCidade from cidade where cidade.nome = nomeCidade and cidade.Estado_idEstado = (select idEstado from estado where estado.nome = nomeEstado)));



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarCargo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarCargo`(nome varchar(200), salario float, setor varchar(200))
BEGIN

call CriarSetor(setor);

insert into cargo(nome, salario, Setor_idSetor)
values (nome, salario, (select idSetor from setor where setor.nome = setor));

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarCidade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarCidade`(in nomeCidade text, in nomeEstado text)
BEGIN


call CriarEstado(nomeEstado);


insert into cidade (nome, Estado_idEstado)
select * from (select nomeCidade, (select idEstado from estado where estado.nome = nomeEstado)) as tmp
where not exists (select * from cidade where cidade.nome = nomeCidade and cidade.Estado_idEstado = (select idEstado from estado where estado.nome = nomeEstado));

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarCliente`(nome text, cpf varchar(11), sexo text, escolaridade text, data_nasc date, fornecedor bit(1), estado_civil text, email text, identidade text, cidade text, estado text, matricula int)
BEGIN

CALL `mydb`.`CriarPessoaFisica`( nome, cpf, sexo, escolaridade, data_nasc, fornecedor, estado_civil, email, identidade, cidade, estado);

insert into cliente (Pessoa_fisica_Pessoa_idPessoa, Funcionario_Pessoa_fisica_Pessoa_idPessoa)
values (last_insert_id(), (select Pessoa_fisica_Pessoa_idPessoa from funcionario where funcionario.matricula = matricula));

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarDependente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarDependente`(nome text, cpf varchar(11), sexo varchar(45), escolaridade varchar(45), data_nasc date, fornecedor bit(1), estado_civil varchar(45),  email varchar(200), identidade varchar(7), cidade varchar(200), estado varchar(200), matricula int)
BEGIN

CALL `mydb`.`CriarPessoaFisica`( nome, cpf, sexo, escolaridade, data_nasc, fornecedor, estado_civil, email, identidade, cidade, estado);

insert into dependente (Pessoa_fisica_Pessoa_idPessoa, Funcionario_Pessoa_fisica_Pessoa_idPessoa )
values (last_insert_id(), (select Pessoa_fisica_Pessoa_idPessoa from funcionario where funcionario.matricula = matricula ));


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarEndereco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarEndereco`(in rua text, numero text, cep text, complemento text, Tipo_endereco varchar(45), bairro text, cidade text, estado text)
BEGIN


call CriarTipoEndereco(Tipo_endereco);


call CriarBairro(bairro, cidade, estado);

	
insert into endereco (rua, numero, cep, complemento, Tipo_endereco_idTipo_endereco, Bairro_idBairro) 
select * from ( select rua, numero, cep, complemento, (select idTipo_endereco from tipo_endereco where tipo_endereco.nome = Tipo_endereco), (select idBairro from bairro where bairro.nome = bairro and bairro.Cidade_idCidade = (select idCidade from cidade where cidade.nome = cidade and cidade.Estado_idEstado = (select idEstado from estado where estado.nome = estado) ))) as tmp
where not exists (select * from endereco where endereco.rua = rua and endereco.numero = numero and endereco.cep = cep and endereco.complemento = complemento and endereco.Tipo_endereco_idTipo_endereco = (select idTipo_endereco from tipo_endereco where tipo_endereco.nome = Tipo_endereco) and endereco.Bairro_idBairro =  (select idBairro from bairro where bairro.nome = bairro and bairro.Cidade_idCidade = (select idCidade from cidade where cidade.nome = cidade and cidade.Estado_idEstado = (select idEstado from estado where estado.nome = estado) )));



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarEscolaridade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarEscolaridade`( in nome varchar(45))
BEGIN
if not exists (select * from escolaridade where escolaridade.nome = nome) then
insert into escolaridade (nome)
values (nome);
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarEstado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarEstado`(in estado text)
BEGIN
if not exists (select * from estado where estado.nome = estado) then
insert into estado (nome)
values (estado);
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarEstadoCivil` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarEstadoCivil`(in nome varchar(45))
BEGIN
if not exists (select * from estado_civil where estado_civil.nome = nome) then
insert into estado_civil (nome)
values (nome);
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarFuncionario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarFuncionario`(in nome TEXT,
 in cpf varchar(11),
 in sexo text,
 in escolaridade text,
 in data_nasc DATE,
 in fornecedor BIT(1),
 in estado_civil text,
 in email TEXT,
 in identidade text,
 in cidade TEXT,
 in estado TEXT,
 in comissao float,
 in nome_pai text,
 in data_nasc_pai date,
 in nome_mae varchar(200),
 in data_nasc_mae date,
 in cargo varchar(200),
 in matricula_criador int,
 in ativo bit(1))
BEGIN

call CriarPessoaFisica(nome, cpf, sexo, escolaridade, data_nasc, fornecedor, estado_civil, email, identidade, cidade, estado);

insert into funcionario (Pessoa_fisica_Pessoa_idPessoa, comissao, nome_pai, data_nasc_pai, nome_mae, data_nasc_mae, Cargo_idCargo, Funcionario_Pessoa_fisica_Pessoa_idPessoa, ativo)
values (last_insert_id(), comissao, nome_pai, data_nasc_pai, nome_mae, data_nasc_mae, (select idCargo from cargo where cargo.nome = cargo), (select A.Pessoa_fisica_Pessoa_idPessoa from funcionario A where A.matricula = matricula_criador), ativo);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarPessoa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarPessoa`(in nome text, in email text )
BEGIN
	insert into pessoa (pessoa.nome, pessoa.email)
    values (nome, email);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarPessoaFisica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarPessoaFisica`(
in nome TEXT,
 in cpf varchar(11),
 in sexo text,
 in escolaridade text,
 in data_nasc DATE,
 in fornecedor BIT(1),
 in estado_civil text,
 in email TEXT,
 in identidade text,
 in cidade TEXT,
 in estado TEXT)
BEGIN


call CriarSexo(sexo);

CALL `mydb`.`CriarCidade`(cidade, estado);


call CriarEscolaridade(escolaridade);


call CriarEstadoCivil(estado_civil);


call CriarCidade(cidade, estado);

call CriarPessoa(nome, email);

insert into pessoa_fisica (Pessoa_idPessoa, cpf, Sexo_idSexo, Escolaridade_idEscolaridade, data_nasc, fornecedor, Estado_civil_idEstado_civil, identidade, Cidade_idCidade)
values (last_insert_id(), cpf, (select idSexo from sexo where sexo.nome = sexo), (select idEscolaridade from escolaridade where escolaridade.nome = escolaridade), data_nasc , fornecedor, (select idEstado_civil from estado_civil where estado_civil.nome = estado_civil), identidade, (select idCidade from cidade where cidade.nome = cidade and cidade.Estado_idEstado = (select idEstado from estado where estado.nome = estado))); 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarPessoaFisicaTemEndereco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarPessoaFisicaTemEndereco`(cpf text, rua text, numero text, cep text, complemento text, Tipo_endereco varchar(45), bairro text, cidade text, estado text)
BEGIN

call CriarEndereco(rua, numero, cep, complemento, Tipo_endereco, bairro, cidade, estado);

insert into pessoa_tem_endereco (Pessoa_idPessoa, Endereco_idEndereco)
values ((select Pessoa_idPessoa from pessoa_fisica where pessoa_fisica.cpf = cpf), (select idEndereco from endereco where endereco.rua = rua and endereco.numero = numero and endereco.cep = cep and endereco.complemento = complemento and endereco.Tipo_endereco_idTipo_endereco = (select idTipo_endereco from tipo_endereco where tipo_endereco.nome = Tipo_endereco) and endereco.Bairro_idBairro =  (select idBairro from bairro where bairro.nome = bairro and bairro.Cidade_idCidade = (select idCidade from cidade where cidade.nome = cidade and cidade.Estado_idEstado = (select idEstado from estado where estado.nome = estado))))); 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarPessoaJuridica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarPessoaJuridica`(nome text, email varchar(200), cnpj text, fornecedor bit(1), matricula int)
BEGIN

call CriarPessoa(nome, email);
insert into pessoa_juridica (Pessoa_idPessoa, cnpj, fornecedor, Funcionario_Pessoa_fisica_Pessoa_idPessoa )
values (last_insert_id(), cnpj, fornecedor, (select Pessoa_fisica_Pessoa_idPessoa from funcionario where funcionario.matricula = matricula));

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarPessoaJuridicaTemEndereco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarPessoaJuridicaTemEndereco`(cnpj text, rua text, numero text, cep text, complemento text, Tipo_endereco varchar(45), bairro text, cidade text, estado text)
BEGIN

call CriarEndereco(rua, numero, cep, complemento, Tipo_endereco, bairro, cidade, estado);

insert into pessoa_tem_endereco (Pessoa_idPessoa, Endereco_idEndereco)
values ((select Pessoa_idPessoa from pessoa_juridica where pessoa_juridica.cnpj = cnpj), (select idEndereco from endereco where endereco.rua = rua and endereco.numero = numero and endereco.cep = cep and endereco.complemento = complemento and endereco.Tipo_endereco_idTipo_endereco = (select idTipo_endereco from tipo_endereco where tipo_endereco.nome = Tipo_endereco) and endereco.Bairro_idBairro =  (select idBairro from bairro where bairro.nome = bairro and bairro.Cidade_idCidade = (select idCidade from cidade where cidade.nome = cidade and cidade.Estado_idEstado = (select idEstado from estado where estado.nome = estado))))); 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarSetor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarSetor`( in nome text )
BEGIN

if not exists (select * from setor where setor.nome = nome) then

insert into setor (nome)
values (nome);

end if;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarSexo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarSexo`(in sexo varchar(45))
BEGIN

if not exists (select * from sexo where sexo.nome = sexo) then
insert into sexo (nome)
values (sexo);
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarTelefone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarTelefone`(in numero text, tipo_telefone  varchar(45))
BEGIN

 call CriarTipoTelefone(tipo_telefone);

insert into telefone (numero, Tipo_telefone_idTipo_Telefone)
values (numero, (select idTipo_Telefone from tipo_telefone where tipo_telefone.nome = tipo_telefone));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarTelefoneTemPessoaFisica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarTelefoneTemPessoaFisica`(cpf varchar(11), numero varchar(200), tipo_telefone varchar(45))
BEGIN

if not exists (select * from telefone where telefone.numero = numero) then
call CriarTelefone (numero, tipo_telefone);
end if;

insert into telefone_tem_pessoa (Telefone_idTelefone, Pessoa_idPessoa)
values ((select idTelefone from telefone where telefone.numero = numero), (select Pessoa_idPessoa from pessoa_fisica where pessoa_fisica.cpf = cpf));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarTelefoneTemPessoaJuridica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarTelefoneTemPessoaJuridica`(cnpj varchar(14), numero varchar(200), tipo_telefone varchar(45))
BEGIN

if not exists (select * from telefone where telefone.numero = numero) then
call CriarTelefone (numero, tipo_telefone);
end if;

insert into telefone_tem_pessoa (Telefone_idTelefone, Pessoa_idPessoa)
values ((select idTelefone from telefone where telefone.numero = numero), (select Pessoa_idPessoa from pessoa_juridica where pessoa_juridica.cnpj = cnpj));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarTipoEndereco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarTipoEndereco`(in nome text)
BEGIN

if (not exists (select * from  tipo_endereco where tipo_endereco.nome = nome)) then
insert into tipo_endereco (nome)
values (nome);
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarTipoTelefone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarTipoTelefone`(in nome varchar(45))
BEGIN
if not exists (select * from tipo_telefone where tipo_telefone.nome = nome) then
insert into tipo_telefone (nome)
values (nome);
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PessoaPessoaFisicaDependente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PessoaPessoaFisicaDependente`()
BEGIN
SELECT a. * , b. * , c. *
FROM pessoa a
LEFT OUTER JOIN pessoa_fisica b on a.idPessoa=b.Pessoa_idPessoa
LEFT OUTER JOIN dependente c on a.idPessoa=c.Pessoa_fisica_Pessoa_idPessoa
UNION
SELECT a. * , b. * , c. *
FROM pessoa_fisica b
LEFT OUTER JOIN pessoa a on b.Pessoa_idPessoa=a.idPessoa
LEFT OUTER JOIN dependente c on b.Pessoa_idPessoa=c.Pessoa_fisica_Pessoa_idPessoa
UNION
SELECT a. * , b. * , c. *
FROM dependente c
LEFT OUTER JOIN pessoa a on c.Pessoa_fisica_Pessoa_idPessoa=a.idPessoa
LEFT OUTER JOIN pessoa_fisica b on c.Pessoa_fisica_Pessoa_idPessoa=b.Pessoa_idPessoa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `testinho` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `testinho`(
in sexo varchar(45),
in cpf varchar(11),
in nome text,
in escolaridade varchar(45),
in data_nasc date,
in fornecedor bit(1),
in estado_civil varchar(45),
in email text,
in identidade varchar(7),
in cidade text,
in estado text)
BEGIN

IF NOT EXISTS (SELECT * FROM sexo WHERE nome = sexo)
THEN
call CriarSexo(sexo);
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-21 22:34:45
