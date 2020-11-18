CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarBairro`(in nomeBairro text, in nomeCidade text, in nomeEstado text )
BEGIN

if ((select exists (select * from cidade where nome = nomeCidade)) = 0) 
then call CriarCidade(nomeCidade, nomeEstado);
end if;

insert into bairro (nome, Cidade_idCidade)
values (nomeBairro, (select idCidade from cidade where nome = nomeCidade));

END