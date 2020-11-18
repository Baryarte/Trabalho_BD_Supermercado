CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarEscolaridade`( in descricao varchar(45))
BEGIN
insert into escolaridade (descricao)
values (descricao);
END