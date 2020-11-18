CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarPessoa`(in nome text )
BEGIN
	insert into pessoa (nome)
    values (nome);
END