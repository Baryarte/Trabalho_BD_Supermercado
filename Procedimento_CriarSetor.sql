CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarSetor`( in nome text )
BEGIN
insert into setor (nome)
values (nome);

END