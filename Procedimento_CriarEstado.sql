CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarEstado`(in estado text)
BEGIN
insert into estado (nome)
values (estado);
END