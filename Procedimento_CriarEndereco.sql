CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarEndereco`(in rua text, numero text, cep text, complemento text, Tipo_endereco varchar(45), bairro text, cidade text, estado text)
BEGIN

if ((select exists (select * from tipo_endereco where nome = Tipo_endereco)) = 0) 
then call CriarTipoEndereco(Tipo_endereco);
end if;

if ((select exists (select * from bairro where nome = bairro)) = 0) 
then call CriarBairro(bairro, cidade, estado);
end if;
	
insert into endereco (rua, numero, cep, complemento, Tipo_endereco_idTipo_endereco, Bairro_idBairro)
values (rua, numero, cep, complemento, (select idTipo_endereco from tipo_endereco where nome = Tipo_endereco), (select idBairro from bairro where nome = bairro));

END