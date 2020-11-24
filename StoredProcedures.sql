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
/*!50003 DROP PROCEDURE IF EXISTS `ConsultaDescontoMarca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultaDescontoMarca`(marca varchar(75))
BEGIN

(select valor, idDesconto from desconto where desconto.idDesconto = (select idDesconto from historico_desconto where historico_desconto.idMarca = (select idMarca from marca where marca.nome = marca)));

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultaDescontoMercadoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultaDescontoMercadoria`(mercadoria varchar(200), marca varchar(75))
BEGIN

(select valor, idDesconto from desconto where desconto.idDesconto = (select idDesconto from historico_desconto where historico_desconto.idMercadoria = (select idMercadoria from mercadoria where mercadoria.nome = mercadoria and mercadoria.idMarca = (select idMarca from marca where marca.nome = marca))));


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultaDescontoTipoMercadoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultaDescontoTipoMercadoria`(tipo_mercadoria varchar(45))
BEGIN

(select valor, idDesconto from desconto where desconto.idDesconto = (select idDesconto from historico_desconto where historico_desconto.idTipo_mercadoria = (select idTipo_mercadoria from tipo_mercadoria where tipo_mercadoria.nome = tipo_mercadoria)));


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultaMaiorDescontoMercadoriaTipoMercadoriaMarca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultaMaiorDescontoMercadoriaTipoMercadoriaMarca`(mercadoria varchar(200), marca varchar(75))
BEGIN

select a.idDesconto from (select t1.idDesconto, t1.nome, t1.valor, t1.validade, t2.idMercadoria, t2.idTipo_mercadoria, t2.idMarca from desconto t1
left join historico_desconto t2 on t1.idDesconto = t2.idDesconto where (select idMercadoria from mercadoria where mercadoria.nome = mercadoria and mercadoria.idMarca = (select idMarca from marca where marca.nome = marca)) in (select t2.idMercadoria) or (select idMarca from marca where marca.nome = marca) in (select t2.idMarca) or (select idTipo_mercadoria from mercadoria where mercadoria.nome = mercadoria and mercadoria.idMarca = (select idMarca from marca where marca.nome = marca)) in (select t2.idTipo_mercadoria)) a  where (datediff(a.validade, current_date) >= 0) order by valor desc limit 1;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultaPessoaPessoaFisicaDependente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultaPessoaPessoaFisicaDependente`()
BEGIN
SELECT a. * , b. * , c. *
FROM pessoa a
LEFT OUTER JOIN pessoa_fisica b on a.idPessoa=b.idPessoa
LEFT OUTER JOIN dependente c on a.idPessoa=c.idPessoa
UNION
SELECT a. * , b. * , c. *
FROM pessoa_fisica b
LEFT OUTER JOIN pessoa a on b.idPessoa=a.idPessoa
LEFT OUTER JOIN dependente c on b.idPessoa=c.idPessoa
UNION
SELECT a. * , b. * , c. *
FROM dependente c
LEFT OUTER JOIN pessoa a on c.idPessoa=a.idPessoa
LEFT OUTER JOIN pessoa_fisica b on c.idPessoa=b.idPessoa;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultaPessoaPessoaFisicaFuncionario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultaPessoaPessoaFisicaFuncionario`()
BEGIN
SELECT a. * , b. * , c. *
FROM pessoa a
LEFT OUTER JOIN pessoa_fisica b on a.idPessoa=b.idPessoa
LEFT OUTER JOIN funcionario c on a.idPessoa=c.idPessoa
UNION
SELECT a. * , b. * , c. *
FROM pessoa_fisica b
LEFT OUTER JOIN pessoa a on b.idPessoa=a.idPessoa
LEFT OUTER JOIN funcionario c on b.idPessoa=c.idPessoa
UNION
SELECT a. * , b. * , c. *
FROM funcionario c
LEFT OUTER JOIN pessoa a on c.idPessoa=a.idPessoa
LEFT OUTER JOIN pessoa_fisica b on c.idPessoa=b.idPessoa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultaPessoaPessoaJuridicaMarca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultaPessoaPessoaJuridicaMarca`()
BEGIN
SELECT a. * , b. * , c. *
FROM pessoa a
LEFT OUTER JOIN pessoa_juridica b on a.idPessoa=b.idPessoa
LEFT OUTER JOIN marca c on a.idPessoa=c.Pessoa_juridica_idPessoa
UNION
SELECT a. * , b. * , c. *
FROM pessoa_juridica b
LEFT OUTER JOIN pessoa a on b.idPessoa=a.idPessoa
LEFT OUTER JOIN marca c on b.idPessoa=c.Pessoa_juridica_idPessoa
UNION
SELECT a. * , b. * , c. *
FROM marca c
LEFT OUTER JOIN pessoa a on c.Pessoa_juridica_idPessoa = a.idPessoa
LEFT OUTER JOIN pessoa_juridica b on c.Pessoa_juridica_idPessoa=b.idPessoa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultaPrecoVendaMercadoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultaPrecoVendaMercadoria`(mercadoria varchar(200), marca varchar(75))
BEGIN

select preco_venda from mercadoria where mercadoria.nome = mercadoria and mercadoria.idMarca = (select idMarca from marca where marca.nome = marca);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultaTipoDaMercadoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultaTipoDaMercadoria`(mercadoria varchar(200), marca varchar(75))
BEGIN

((select nome from tipo_mercadoria where tipo_mercadoria.idTipo_mercadoria = (select idTipo_mercadoria from mercadoria where mercadoria.nome = mercadoria and mercadoria.idMarca = (select idMarca from marca where marca.nome = marca))));


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarAtualizadoEm` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarAtualizadoEm`(mercadoria varchar(200), marca varchar(75), lote varchar(100), matricula int, preco_antigo float, preco_novo float, quantidade_antiga int, quantidade_nova int, preco_compra_antigo float, preco_compra_novo float)
BEGIN

declare elote text;
declare idMerc int;
declare idMa int;

select mercadoria.idMercadoria, mercadoria.idMarca, mercadoria.lote into idMerc, idMa, elote from mercadoria where mercadoria.nome = mercadoria and mercadoria.idMarca = (select idMarca from marca where marca.nome = marca) and mercadoria.lote = lote;

insert into atualizado_em (idMercadoria, Funcionario_idPessoa, instante, preco_antigo, preco_novo, quantidade_antiga, quantidade_nova, preco_compra_antigo, preco_compra_novo)
values (idMerc, (select idPessoa from funcionario where funcionario.matricula = matricula), current_timestamp(), preco_antigo, preco_novo, quantidade_antiga, quantidade_nova, preco_compra_antigo, preco_compra_novo);




END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarBairro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarBairro`(in nomeBairro text, in nomeCidade text, in nomeEstado text )
BEGIN


call CriarCidade(nomeCidade, nomeEstado);

insert into bairro (nome, idCidade)
select * from ( select nomeBairro, (select idCidade from cidade where cidade.nome = nomeCidade and cidade.idEstado = (select idEstado from estado where estado.nome = nomeEstado))) as tmp
where not exists (select * from bairro where bairro.nome = nomeBairro and idCidade =  (select idCidade from cidade where cidade.nome = nomeCidade and cidade.idEstado = (select idEstado from estado where estado.nome = nomeEstado)));



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

insert into cargo(nome, salario, idSetor)
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarCidade`(in nomeCidade text, in nomeEstado text)
BEGIN


call CriarEstado(nomeEstado);


insert into cidade (nome, idEstado)
select * from (select nomeCidade, (select idEstado from estado where estado.nome = nomeEstado)) as tmp
where not exists (select * from cidade where cidade.nome = nomeCidade and cidade.idEstado = (select idEstado from estado where estado.nome = nomeEstado));

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

insert into cliente (idPessoa, Funcionario_idPessoa)
values (last_insert_id(), (select idPessoa from funcionario where funcionario.matricula = matricula));

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

insert into dependente (idPessoa, Funcionario_idPessoa )
values (last_insert_id(), (select idPessoa from funcionario where funcionario.matricula = matricula ));


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarDesconto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarDesconto`(nome varchar(200), valor float, validade date)
BEGIN
	
insert into desconto (nome, valor, validade)
values (nome, valor, validade);    
    
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarEndereco`(in rua text, numero text, cep text, complemento text, Tipo_endereco varchar(45), bairro text, cidade text, estado text)
BEGIN


call CriarTipoEndereco(Tipo_endereco);


call CriarBairro(bairro, cidade, estado);

	
insert into endereco (rua, numero, cep, complemento, idTipo_endereco, idBairro) 
select * from ( select rua, numero, cep, complemento, (select idTipo_endereco from tipo_endereco where tipo_endereco.nome = Tipo_endereco), (select idBairro from bairro where bairro.nome = bairro and bairro.idCidade = (select idCidade from cidade where cidade.nome = cidade and cidade.idEstado = (select idEstado from estado where estado.nome = estado) ))) as tmp
where not exists (select * from endereco where endereco.rua = rua and endereco.numero = numero and endereco.cep = cep and endereco.complemento = complemento and endereco.idTipo_endereco = (select idTipo_endereco from tipo_endereco where tipo_endereco.nome = Tipo_endereco) and endereco.idBairro =  (select idBairro from bairro where bairro.nome = bairro and bairro.idCidade = (select idCidade from cidade where cidade.nome = cidade and cidade.idEstado = (select idEstado from estado where estado.nome = estado) )));



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
/*!50003 DROP PROCEDURE IF EXISTS `CriarFormaPagamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarFormaPagamento`(nome varchar(45), tipo_pagamento varchar(45))
BEGIN

if not exists (select * from tipo_pagamento where tipo_pagamento.nome = tipo_pagamento) then
call CriarTipoPagamento(tipo_pagamento);
end if;

insert into forma_pagamento(nome, idTipo_pagamento )
values (nome, (select idTipo_pagamento from tipo_pagamento where tipo_pagamento.nome = tipo_pagamento));

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
 in setor varchar(200),
 in salario float,
 in ativo bit(1))
BEGIN

if not exists (select * from cargo where cargo.nome = cargo) then
call CriarCargo(cargo, salario, setor);
end if;

call CriarPessoaFisica(nome, cpf, sexo, escolaridade, data_nasc, fornecedor, estado_civil, email, identidade, cidade, estado);

if ((select count(*) from funcionario) = 0) then
insert into funcionario (idPessoa, comissao, nome_pai, data_nasc_pai, nome_mae, data_nasc_mae, idCargo, Funcionario_idPessoa, ativo)
values (last_insert_id(), comissao, nome_pai, data_nasc_pai, nome_mae, data_nasc_mae, (select idCargo from cargo where cargo.nome = cargo), null, ativo);

else 
insert into funcionario (idPessoa, comissao, nome_pai, data_nasc_pai, nome_mae, data_nasc_mae, idCargo, Funcionario_idPessoa, ativo)
values (last_insert_id(), comissao, nome_pai, data_nasc_pai, nome_mae, data_nasc_mae, (select idCargo from cargo where cargo.nome = cargo), (select A.idPessoa from funcionario A where A.idCargo = ( select idCargo from cargo where cargo.nome = 'Gerente')), ativo);

end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarHistoricoDesconto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarHistoricoDesconto`(descontoNome varchar(200), descontoData date, mercadoria varchar(200), marcaMercadoria varchar(75), tipo_mercadoria varchar(45), marca varchar(75) )
BEGIN

insert into historico_desconto(idDesconto, idMercadoria, idTipo_mercadoria, idMarca )
values ((select idDesconto from desconto where desconto.nome = descontoNome and desconto.validade = descontoData ), (select idMercadoria from mercadoria where mercadoria.nome = mercadoria and mercadoria.idMarca = (select idMarca from marca where marca.nome = marcaMercadoria)), (select idTipo_mercadoria from tipo_mercadoria where tipo_mercadoria.nome = tipo_mercadoria), (select idMarca from marca where marca.nome = marca));


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarMarca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarMarca`(nome varchar(75), cnpj varchar(14))
BEGIN

insert into marca (nome, Pessoa_juridica_idPessoa)
values (nome, (select idPessoa from pessoa_juridica where pessoa_juridica.cnpj = cnpj));

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarMercadoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarMercadoria`(nome varchar (200), preco_venda float, peso varchar(10), quantidade int, data_vencimento date, volume varchar(10), preco_compra float, lote varchar(100), data_fabricacao date, matricula int, tipo_mercadoria varchar(45), marca varchar(75))
BEGIN

if not exists (select * from tipo_mercadoria where tipo_mercadoria.nome = tipo_mercadoria) then
call CriarTipoMercadoria(tipo_mercadoria);
end if;

insert into mercadoria(nome, preco_venda, peso, quantidade, data_vencimento, volume, criado_em, preco_compra, lote, data_fabricacao, Funcionario_idPessoa, idTipo_mercadoria, idMarca)
values (nome, preco_venda, peso, quantidade, data_vencimento, volume, current_timestamp(), preco_compra, lote, data_fabricacao, (select idPessoa from funcionario where funcionario.matricula = matricula), (select idTipo_mercadoria from tipo_mercadoria where tipo_mercadoria.nome = tipo_mercadoria), (select idMarca from marca where marca.nome = marca));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarPagamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarPagamento`(descontoNome varchar(200), descontoValidade date, forma_pagamento varchar(45), matricula int, cpf varchar(11), valor_total float , valor_recebido float, troco float, quantidadeParcelas int)
BEGIN

declare i int default 0;
declare vencimento date default CURRENT_DATE ;


insert into pagamento(idDesconto, idForma_pagamento, Funcionario_idPessoa, Cliente_idPessoa, valor_total, valor_recebido, troco, instante)
values ((select idDesconto from desconto where desconto.nome = descontoNome and desconto.validade = descontoValidade), (select idForma_pagamento from forma_pagamento where forma_pagamento.nome = forma_pagamento), (select idPessoa from funcionario where funcionario.matricula = matricula), (select idPessoa from pessoa_fisica where pessoa_fisica.cpf = cpf), valor_total, valor_recebido, troco, current_timestamp());

if (select idTipo_pagamento from tipo_pagamento where tipo_pagamento.nome = 'Parcelado') = (select idTipo_pagamento from forma_pagamento where forma_pagamento.nome = forma_pagamento) then

while i < quantidadeParcelas do

insert into parcela (valor, paga, multa, data_vencimento, juros, data_pagamento, idPagamento)
values ((select valor_total/quantidadeParcelas), 0, '0',  last_day(vencimento), '0', null, last_insert_id());

set vencimento = date_add(vencimento, interval 1 month);
set i = i + 1;

end while;

end if;





END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarPagamentoParcelaCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarPagamentoParcelaCompra`(forma_pagamento varchar(45), tipo_pagamento varchar(200), matricula int, cpf varchar(11), valor_recebido float, quantidadeParcelas int, mercadoria varchar(200), marca varchar(75), quantidade int, inout idMesmoPagamento int)
BEGIN

declare i int default 0;
declare vencimento date default CURRENT_DATE ;
declare pagamentoTimestamp timestamp;
declare valor_total float default '0';
declare idMaiorDesconto int default (select a.idDesconto from (select t1.idDesconto, t1.nome, t1.valor, t1.validade, t2.idMercadoria, t2.idTipo_mercadoria, t2.idMarca from desconto t1
left join historico_desconto t2 on t1.idDesconto = t2.idDesconto where (select idMercadoria from mercadoria where mercadoria.nome = mercadoria and mercadoria.idMarca = (select idMarca from marca where marca.nome = marca)) in (select t2.idMercadoria) or (select idMarca from marca where marca.nome = marca) in (select t2.idMarca) or (select idTipo_mercadoria from mercadoria where mercadoria.nome = mercadoria and mercadoria.idMarca = (select idMarca from marca where marca.nome = marca)) in (select t2.idTipo_mercadoria)) a  where (datediff(a.validade, current_date)>0) order by valor desc limit 1);
declare valorMaiorDesconto float default (select valor from desconto where desconto.idDesconto = idMaiorDesconto);

set pagamentoTimestamp = current_timestamp();

if isnull(valorMaiorDesconto) then
 set valorMaiorDesconto = 0;
end if;

if (isnull(idMesmoPagamento)) then

insert into pagamento(idForma_pagamento, Funcionario_idPessoa, Cliente_idPessoa, valor_total, valor_recebido, troco, instante)
 values ((select idForma_pagamento from forma_pagamento where forma_pagamento.nome = forma_pagamento and forma_pagamento.idTipo_pagamento = (select idTipo_pagamento from tipo_pagamento where tipo_pagamento.nome = tipo_pagamento)), (select  idPessoa from funcionario where funcionario.matricula = matricula), (select idPessoa from pessoa_fisica where pessoa_fisica.cpf = cpf), valor_total, valor_recebido, (valor_recebido - valor_total), pagamentoTimestamp);

set idMesmoPagamento = last_insert_id();

if (select idTipo_pagamento from tipo_pagamento where tipo_pagamento.nome = 'Parcelado') = (select idTipo_pagamento from forma_pagamento where forma_pagamento.nome = forma_pagamento and forma_pagamento.idTipo_pagamento = (select idTipo_pagamento from tipo_pagamento where tipo_pagamento.nome = tipo_pagamento)) then



while i < quantidadeParcelas do

insert into parcela (valor, paga, multa, data_vencimento, juros, data_pagamento, idPagamento, instante)
values ((select valor_total/quantidadeParcelas), 0, '0',  last_day(vencimento), '0', null, idMesmoPagamento, pagamentoTimestamp);

set vencimento = date_add(vencimento, interval 1 month);
set i = i + 1;

end while;

end if;

end if;



insert into compra (idPagamento, idMercadoria, idDesconto, quantidade, instante)
values ((select idPagamento from pagamento where pagamento.idPagamento = idMesmoPagamento), (select idMercadoria from mercadoria where mercadoria.nome = mercadoria and mercadoria.idMarca = (select idMarca from marca where marca.nome = marca)), idMaiorDesconto ,quantidade, pagamentoTimestamp);

update mercadoria
set mercadoria.quantidade = (select mercadoria.quantidade) - quantidade
where mercadoria.nome = mercadoria and mercadoria.idMarca = (select idMarca from marca where marca.nome = marca);

set valor_total = (select valor_total from pagamento where pagamento.idPagamento = idMesmoPagamento) + (select preco_venda from mercadoria where mercadoria.nome = mercadoria and mercadoria.idMarca = (select idMarca from marca where marca.nome = marca) ) * (1 - valorMaiorDesconto) * quantidade;

update pagamento
set valor_total = valor_total, troco = troco - (select preco_venda from mercadoria where mercadoria.nome = mercadoria and mercadoria.idMarca = (select idMarca from marca where marca.nome = marca) ) * (1 - valorMaiorDesconto) * quantidade
where idPagamento = idMesmoPagamento;

if (select idTipo_pagamento from tipo_pagamento where tipo_pagamento.nome = 'Parcelado') = (select idTipo_pagamento from forma_pagamento where forma_pagamento.nome = forma_pagamento and forma_pagamento.idTipo_pagamento = (select idTipo_pagamento from tipo_pagamento where tipo_pagamento.nome = tipo_pagamento)) then

update parcela
set valor = valor_total/quantidadeParcelas
where idPagamento = idMesmoPagamento;

end if;



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

insert into pessoa_fisica (idPessoa, cpf, idSexo, idEscolaridade, data_nasc, fornecedor, idEstado_civil, identidade, idCidade)
values (last_insert_id(), cpf, (select idSexo from sexo where sexo.nome = sexo), (select idEscolaridade from escolaridade where escolaridade.nome = escolaridade), data_nasc , fornecedor, (select idEstado_civil from estado_civil where estado_civil.nome = estado_civil), identidade, (select idCidade from cidade where cidade.nome = cidade and cidade.idEstado = (select idEstado from estado where estado.nome = estado))); 

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

insert into pessoa_tem_endereco (idPessoa, idEndereco)
values ((select idPessoa from pessoa_fisica where pessoa_fisica.cpf = cpf), (select idEndereco from endereco where endereco.rua = rua and endereco.numero = numero and endereco.cep = cep and endereco.complemento = complemento and endereco.idTipo_endereco = (select idTipo_endereco from tipo_endereco where tipo_endereco.nome = Tipo_endereco) and endereco.idBairro =  (select idBairro from bairro where bairro.nome = bairro and bairro.idCidade = (select idCidade from cidade where cidade.nome = cidade and cidade.idEstado = (select idEstado from estado where estado.nome = estado))))); 

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
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarPessoaJuridica`(nome text, email varchar(200), cnpj text, fornecedor bit(1))
BEGIN

call CriarPessoa(nome, email);
insert into pessoa_juridica (idPessoa, cnpj, fornecedor, Funcionario_idPessoa )
values (last_insert_id(), cnpj, fornecedor,  (select idPessoa from funcionario where funcionario.idCargo = ( select idCargo from cargo where cargo.nome = 'Gerente')));

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

insert into pessoa_tem_endereco (idPessoa, idEndereco)
values ((select idPessoa from pessoa_juridica where pessoa_juridica.cnpj = cnpj), (select idEndereco from endereco where endereco.rua = rua and endereco.numero = numero and endereco.cep = cep and endereco.complemento = complemento and endereco.idTipo_endereco = (select idTipo_endereco from tipo_endereco where tipo_endereco.nome = Tipo_endereco) and endereco.idBairro =  (select idBairro from bairro where bairro.nome = bairro and bairro.idCidade = (select idCidade from cidade where cidade.nome = cidade and cidade.idEstado = (select idEstado from estado where estado.nome = estado))))); 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarReabastecimento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarReabastecimento`(mercadoria varchar(200) ,
preco_venda float ,
peso varchar(10) ,
quantidade int ,
data_vencimento date ,
volume varchar(10) ,
preco_compra float ,
lote varchar(100) ,
data_fabricacao date ,
matricula int ,
tipo_mercadoria varchar(200) ,
marca varchar(75))
BEGIN
	declare id int;
	declare pva float;
    declare qua text;
    declare pca float;
    
    
    
    if not exists (select * from mercadoria where mercadoria.nome = mercadoria and mercadoria.idMarca = (select idMarca from marca where marca.nome = marca) and mercadoria.lote = lote) then
    
    
    CALL `mydb`.`CriarMercadoria`(mercadoria, preco_venda, peso, quantidade, data_vencimento, volume, preco_compra, lote, data_fabricacao, matricula, tipo_mercadoria, marca);
    
	select idMercadoria, preco_venda, quantidade, preco_compra into id, pva, qua, pca from mercadoria where mercadoria.nome = mercadoria and mercadoria.idMarca = (select idMarca from marca where marca.nome = marca) and mercadoria.lote = lote;
    
    else
    
    select idMercadoria, preco_venda, quantidade, preco_compra into id, pva, qua, pca from mercadoria where mercadoria.nome = mercadoria and mercadoria.idMarca = (select idMarca from marca where marca.nome = marca) and mercadoria.lote = lote;
    
   -- CALL `mydb`.`CriarAtualizadoEm`(mercadoria, marca, matricula, (select preco_venda from mercadoria where mercadoria.nome = mercadoria and mercadoria.idMarca = (select idMarca from marca where marca.nome = marca)), preco_venda, (select quantidade from mercadoria where ), <{quantidade_nova int}>, <{preco_compra_antigo float}>, <{preco_compra_novo float}>);
    CALL `mydb`.`CriarAtualizadoEm`(mercadoria, marca, lote, matricula, pva, preco_venda, qua, quantidade , pca, preco_compra);

    
    update mercadoria
    set mercadoria.preco_venda = preco_venda, mercadoria.quantidade = mercadoria.quantidade + quantidade
    where mercadoria.idMercadoria = id;
    
    
    end if;
    
    
    insert into reabastecimento (idMercadoria, Funcionario_idPessoa, Pessoa_fisica_idPessoa, Pessoa_juridica_idPessoa, quantidade)
    values (id, (select idPessoa from funcionario where funcionario.matricula = matricula), (select idPessoa from pessoa_fisica where pessoa_fisica.cpf = cpf), (select idPessoa from pessoa_juridica where pessoa_juridica.cnpj = cnpj), quantidade);

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarTelefone`(in numero text, tipo_telefone  varchar(45))
BEGIN

 call CriarTipoTelefone(tipo_telefone);

insert into telefone (numero, idTipo_Telefone)
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

insert into telefone_tem_pessoa (idTelefone, idPessoa)
values ((select idTelefone from telefone where telefone.numero = numero), (select idPessoa from pessoa_fisica where pessoa_fisica.cpf = cpf));
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

insert into telefone_tem_pessoa (idTelefone, idPessoa)
values ((select idTelefone from telefone where telefone.numero = numero), (select idPessoa from pessoa_juridica where pessoa_juridica.cnpj = cnpj));
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
/*!50003 DROP PROCEDURE IF EXISTS `CriarTipoMercadoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarTipoMercadoria`(nome varchar (45) )
BEGIN

insert into tipo_mercadoria(nome)
values (nome);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarTipoPagamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarTipoPagamento`(nome varchar(200))
BEGIN

insert into tipo_pagamento (nome)
values (nome);

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
/*!50003 DROP PROCEDURE IF EXISTS `ModifcarFuncionarioAtivo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModifcarFuncionarioAtivo`(in matricula int, atvio bit(1))
BEGIN

update funcionario
set ativo = ativo
where funcionario.matricula = matricula;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarBairro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarBairro`(in bairro_antigo varchar(200), bairro_novo varchar(200), cidade varchar(200), estado varchar(200))
BEGIN

update bairro
set nome = bairro_novo
where bairro.nome = bairro_antigo and idCidade = (select idCidade from cidade where cidade.nome = cidade) and idCidade = (select idCidade from cidade where cidade.idEstado = (select idEstado from estado where estado.nome = estado));


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarCEP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarCEP`(in cep_novo varchar(200), cep_antigo varchar(200))
BEGIN

update endereco
set cep = cep_novo
where endereco.cep = cep_antigo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarCidade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarCidade`(in cidade_antigo varchar(200), cidade_novo varchar(200), estado varchar(200))
BEGIN

update cidade
set cidade.nome = cidade_novo
where cidade.nome = cidade_antigo and cidade.idEstado = (select idEstado from estado where estado.nome = estado);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarClienteCPF` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarClienteCPF`(in cpf varchar(11), identidade varchar(7))
BEGIN

update pessoa_fisica
set cpf = cpf
where pessoa_fisica.identidade = identidade;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarCNPJ` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarCNPJ`(in cnpj_antigo varchar(14), novo_cnpj varchar(14) )
BEGIN

update pessoa_juridica
set pessoa_juridica.cnpj = novo_cnpj
where pessoa_juridica.cnpj = cnpj_antigo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarComissao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarComissao`(in matricula int, comissao float)
BEGIN

update funcionario
set comissao = comissao
where funcionario.matricula = matricula;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarCPF` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarCPF`(in cpf varchar(11), identidade varchar(7))
BEGIN

update pessoa_fisica
set cpf = cpf
where pessoa_fisica.identidade = identidade;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarDataNascimento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarDataNascimento`(in cpf varchar(11), data_nasc date)
BEGIN

update pessoa_fisica
set data_nasc = data_nasc
where pessoa_fisica.cpf = cpf;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarDataNascimentoMae` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarDataNascimentoMae`(in matricula int, data_nasc date)
BEGIN

update funcionario
set data_nasc_mae = data_nasc
where funcionario.matricula = matricula;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarDataNascimentoPai` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarDataNascimentoPai`(in matricula int, data_nasc date)
BEGIN

update funcionario
set data_nasc_pai = data_nasc
where funcionario.matricula = matricula;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarEndereco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarEndereco`(in cep_novo varchar(200), cep_antigo varchar(200), rua_nova varchar(200), rua_antiga varchar(200), numero_novo varchar(200), numero_antigo varchar(200), complemento_novo varchar(200), complemento_antigo varchar(200), tipo_endereco_novo varchar(45), bairro_novo varchar(200), cidade_nova varchar(200), estado_novo varchar(200))
BEGIN

update endereco
set cep = cep_novo
where endereco.cep = cep_antigo and endereco.rua = rua_antiga and endereco.numero = numero_antigo and endereco.complemento = complemento_antigo;

update endereco
set rua = rua_nova
where endereco.rua = rua_antiga and endereco.cep = cep_novo and endereco.numero = numero_antigo and endereco.complemento = complemento_antigo;

update endereco
set numero = numero_novo
where endereco.numero = numero_antigo and endereco.cep = cep_novo and endereco.rua = rua_nova and endereco.complemento = complemento_antigo;

update endereco
set complemento = complemento_novo
where endereco.complemento = complemento_antigo and endereco.cep = cep_novo and endereco.rua = rua_nova and endereco.numero = numero_novo;

update endereco
set idTipo_endereco = (select idTipo_endereco from tipo_endereco where tipo_endereco.nome = tipo_endereco_novo)
where endereco.complemento = complemento_novo and endereco.cep = cep_novo and endereco.rua = rua_nova and endereco.numero = numero_novo;
 
 call CriarBairro(bairro_novo, cidade_nova, estado_novo);
 
 update endereco
 set idBairro = (select idBairro from bairro where bairro.nome = bairro_novo)
 where endereco.complemento = complemento_novo and endereco.cep = cep_novo and endereco.rua = rua_nova and endereco.numero = numero_novo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarEscolaridade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarEscolaridade`(in cpf varchar(11), escolaridade text)
BEGIN

update pessoa_fisica
set idEscolaridade = (select idEscolaridade from escolaridade where escolaridade.nome = escolaridade)
where pessoa_fisica.cpf = cpf;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarEstado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarEstado`(in estado_antigo varchar(200), novo_estado varchar(200))
BEGIN
update estado
set nome = novo_estado
where estado.nome = estado_antigo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarEstadoCivil` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarEstadoCivil`(in cpf varchar(11), estado_civil text)
BEGIN

update pessoa_fisica
set IdEstado_civil = (select idEstado_civil from estado_civil where estado_civil.nome = estado_civil)
where pessoa_fisica.cpf = cpf;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarFuncionarioAtivo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarFuncionarioAtivo`(in matricula int, ativo bit(1))
BEGIN

update funcionario
set ativo = ativo
where funcionario.matricula = matricula;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarFuncionarioCargo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarFuncionarioCargo`(in matricula int, cargo varchar(200))
BEGIN

update funcionario
set idCargo = (select idCargo from cargo where cargo.nome = cargo)
where funcionario.matricula = matricula;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarIdentidade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarIdentidade`(in cpf varchar(11), identidade varchar(7))
BEGIN

update pessoa_fisica
set identidade = identidade
where pessoa_fisica.cpf = cpf;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarMercadoriaNome` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarMercadoriaNome`(in marca varchar(75), nome_novo varchar(200), nome_antigo varchar(200))
BEGIN

update mercadoria
set nome = nome_novo
where mercadoria.idMarca = (select idMarca from marca where marca.nome = marca) and mercadoria.nome = nome_antigo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarMercadoriaQuantidade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarMercadoriaQuantidade`(in marca varchar(75), mercadoria varchar(200), quantidade int, matricula int)
BEGIN

 call CriarAtualizadoEm(mercadoria,marca,matricula,(select preco_venda from mercadoria where mercadoria.nome = mercadoria and mercadoria.idMarca = (select idMarca from marca where marca.nome = marca)),(select preco_venda from mercadoria where mercadoria.nome = mercadoria and mercadoria.idMarca = (select idMarca from marca where marca.nome = marca)),(select quantidade from mercadoria where mercadoria.nome = mercadoria and mercadoria.idMarca = (select idMarca from marca where marca.nome = marca)),quantidade, (select preco_compra from mercadoria where mercadoria.nome = mercadoria and mercadoria.idMarca = (select idMarca from marca where marca.nome = marca)), (select preco_compra from mercadoria where mercadoria.nome = mercadoria and mercadoria.idMarca = (select idMarca from marca where marca.nome = marca)));
 
 update mercadoria
 set mercadoria.quantidade = quantidade
 where mercadoria.nome = mercadoria and mercadoria.idMarca = (select idMarca from marca where marca.nome = marca);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarNomeMae` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarNomeMae`(in matricula int, nome_mae varchar(200))
BEGIN

update funcionario
set nome_mae = nome_mae
where funcionario.matricula = matricula;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarNomePai` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarNomePai`(in matricula int, nome_pai text)
BEGIN

update funcionario
set nome_pai = nome_pai
where funcionario.matricula = matricula;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarPessoaFisicaEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarPessoaFisicaEmail`(in cpf varchar(11), email text)
BEGIN

update pessoa
set email = email
where pessoa.idPessoa = (select idPessoa from pessoa_fisica where pessoa_fisica.cpf = cpf);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarPessoaFisicaFornecedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarPessoaFisicaFornecedor`(in cpf varchar(11), fornecedor bit(1))
BEGIN

update pessoa_fisica
set fornecedor = fornecedor
where pessoa_fisica.cpf = cpf;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarPessoaFisicaNome` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarPessoaFisicaNome`(in cpf varchar(11), nome text)
BEGIN

update pessoa
set nome = nome
where pessoa.idPessoa = (select idPessoa from pessoa_fisica where pessoa_fisica.cpf = cpf);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarPessoaJuridicaEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarPessoaJuridicaEmail`(in cnpj varchar(14), email text)
BEGIN

update pessoa
set email = email
where pessoa.idPessoa = (select idPessoa from pessoa_juridica where pessoa_juridica.cnpj = cnpj);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarPessoaJuridicaFornecedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarPessoaJuridicaFornecedor`(in cnpj varchar(14), fornecedor bit(1))
BEGIN

update pessoa_juridica
set fornecedor = fornecedor
where pessoa_juridica.cnpj = cnpj;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarPessoaJuridicaNome` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarPessoaJuridicaNome`(in cnpj varchar(14), nome text)
BEGIN

update pessoa
set nome = nome
where pessoa.idPessoa = (select idPessoa from pessoa_juridica where pessoa_juridica.cnpj = cnpj);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarSexo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarSexo`(in cpf varchar(11), sexo text)
BEGIN

update pessoa_fisica
set idSexo = (select idSexo from sexo where sexo.nome = sexo)
where pessoa_fisica.cpf = cpf;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ModificarTelefone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarTelefone`(in numero_novo varchar(200), numero_antigo varchar(200),tipo_telefone varchar(45))
BEGIN

update telefone
set numero = numero_novo
where telefone.numero = numero_antigo;

update telefone
set idTipo_Telefone = (select idTipo_Telefone from tipo_telefone where tipo_telefone.nome = tipo_telefone)
where telefone.numero = numero_novo;
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
LEFT OUTER JOIN pessoa_fisica b on a.idPessoa=b.idPessoa
LEFT OUTER JOIN dependente c on a.idPessoa=c.idPessoa
UNION
SELECT a. * , b. * , c. *
FROM pessoa_fisica b
LEFT OUTER JOIN pessoa a on b.idPessoa=a.idPessoa
LEFT OUTER JOIN dependente c on b.idPessoa=c.idPessoa
UNION
SELECT a. * , b. * , c. *
FROM dependente c
LEFT OUTER JOIN pessoa a on c.idPessoa=a.idPessoa
LEFT OUTER JOIN pessoa_fisica b on c.idPessoa=b.idPessoa;
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

-- Dump completed on 2020-11-24 16:23:49
