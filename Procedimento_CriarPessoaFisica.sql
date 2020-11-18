CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarPessoaFisica`( IN nome text, in cpf int, sexo varchar(45), escolaridade varchar(45), data_nasc date, fornecedor bit)
BEGIN

call CriarPessoa(nome);
INSERT INTO pessoa_fisica (Pessoa_idPessoa, cpf, Sexo_idSexo, Escolaridade_idEscolaridade, data_nasc, fornecedor)
values (last_insert_id(), cpf, (select idSexo from sexo where descricao = sexo), (select idEscolaridade from escolaridade where descricao = escolaridade ), data_nasc, fornecedor );

END