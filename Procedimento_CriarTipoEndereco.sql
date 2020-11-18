CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarTipoEndereco`(in descricao varchar(45))
BEGIN
insert into tipo_endereco (descricao)
values (descricao);
END