CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarSexo`(in sexo varchar(45))
BEGIN
insert into sexo (descricao)
values (sexo);
END