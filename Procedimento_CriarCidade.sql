CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarCidade`(in nomeCidade text, in nomeEstado text)
BEGIN

if ((select exists (select * from estado where nome = nomeEstado)) = 0) 
then call CriarEstado(nomeEstado);
end if;

insert into cidade (nome, Estado_idEstado)
values (nomeCidade, (select idEstado from estado where nome = nomeEstado));

END