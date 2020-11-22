-- delete from pessoa;
-- delete from sexo;

-- INSERT INTO sexo (descricao)
--     VALUES ('Masculino'),
--     ('Feminino');

-- INSERT INTO pessoa (nome)
--     VALUES ('Gerundia');
    
  
-- INSERT INTO pessoa_fisica (Pessoa_idPessoa, cpf, Sexo_idSexo, escolaridade, data_nasc, fornecedor)
-- VALUES (last_insert_id(), 01455588822, (select idSexo from sexo where descricao = 'Feminino'),  'Ensino médio completo', '1997-12-09', 0 );

select * from funcionario;

delete from telefone_tem_pessoa;
delete from pessoa_tem_endereco;
delete from pessoa_juridica;
delete from dependente;
delete t1
from  funcionario t1, funcionario t2 
where t1.Pessoa_fisica_Pessoa_idPessoa > t2.Pessoa_fisica_Pessoa_idPessoa ;
delete from funcionario;
delete from pessoa_fisica;
delete from endereco;
delete from tipo_endereco;
delete from bairro;
delete from cidade;
delete from estado;
delete from sexo;
delete from escolaridade;
delete from estado_civil;
delete from pessoa_juridica;
delete from pessoa;
delete from cargo;
delete from setor;
delete from telefone_tem_pessoa;
delete from telefone;
delete from tipo_telefone;









call CriarSexo('Masculino');
call CriarSexo('Feminino');
call CriarSexo('Outro');
-- delete from sexo;
select * from sexo;

call CriarEstado('Distrito Federal');
call CriarEstado('Acre');
call CriarEstado('Paraná');
call CriarEstado('São Paulo');
call CriarEstado('Rio de Janeiro');
-- delete from estado;
select * from estado;

call CriarCidade('Brasília', 'Distrito Federal');
call CriarCidade('Salvador', 'Bahia'); -- Criar cidade com estado ainda nao cadastrado
call CriarCidade('Curitiba', 'Paraná');
call CriarCidade('Acrelândia', 'Acre');
call CriarCidade('Rio de Janeiro', 'Rio de Janeiro');
-- update cidade
-- set nome = 'Picos';
-- delete from cidade;
select * from cidade;

call CriarBairro('Asa Norte', 'Brasília', 'Distrito Federal');
call CriarBairro('Boqueirão', 'Santos', 'São Paulo'); -- Cidade não existente
call CriarBairro('Suelândia', 'Rorainópolis', 'Roraima'); -- Cidade e estado nao existentes
call CriarBairro('Copacabana', 'Rio de Janeiro', 'Rio de Janeiro');
call CriarBairro('Acrelândia', 'Acrelândia', 'Acre');
call CriarBairro('Lugar', 'Lugar', 'Lugar');
-- delete from bairro;
select * from bairro;

(select * from bairro where bairro.nome = 'Acrelândia' and Cidade_idCidade = (select idCidade from cidade where cidade.nome = 'Acrelândia'));

call CriarTipoEndereco('Residencial');
call CriarTipoEndereco('Comercial');
-- delete from Tipo_endereco;
select * from tipo_endereco;


call CriarEndereco('7 de setembro', '29', '69945000', 'Casa', 'Residencial', 'Acrelândia', 'Acrelândia', 'Acre');
call CriarEndereco('Avenida Princesa Isabel', '392', '22011010', 'Hotel', 'Comercial', 'Copacabana', 'Rio de Janeiro', 'Rio de Janeiro');
call CriarEndereco('Rua Doutor Cesário da Mota', '639', '11045003', 'Mercado', 'Comercial', 'Boqueirão', 'Santos', 'São Paulo');
call CriarEndereco('UNB Área 1', '', '70297400', 'Mercado', 'Comercial', 'Asa Norte', 'Brasília', 'Distrito Federal');
call CriarEndereco('UNB Área 1', '', '70297400', 'Mercado', 'Comercial', 'Asa Norte', 'Brasília', 'Distrito Federal');
CALL `mydb`.`CriarEndereco`('General Potiguará', '1553', '81320000', 'Laboratório', 'Comercial','Fazendinha', 'Curitiba', 'Paraná');
-- delete from endereco; 
select * from endereco;

call CriarTipoTelefone('Comercial');
call CriarTipoTelefone('Residencial');
call CriarTipoTelefone('Pessoal');
select * from tipo_telefone;

call CriarTelefone('35689002', 'Residencial');
call CriarTelefone('981832153', 'Pessoal');
call CriarTelefone('06140028922', 'Comercial');
call CriarTelefone('06798765432', 'Pessoal');
call CriarTelefone('08005478998', 'Comercial');
select * from telefone;

call CriarEscolaridade('Ensino Fundamental Incompleto');
call CriarEscolaridade('Ensino Fundamental Completo');
call CriarEscolaridade('Ensino Médio Incompleto');
call CriarEscolaridade('Ensino Médio Completo');
call CriarEscolaridade('Ensino Superior Incompleto' );
call CriarEscolaridade('Ensino Superior Completo');
select * from escolaridade;

call CriarEstadoCivil('Solteiro(a)');
call CriarEstadoCivil('Casado(a)');
call CriarEstadoCivil('Viúvo(a)');
call CriarEstadoCivil('Divorciado(a)');
call CriarEstadoCivil('Separado(a)');
select * from estado_civil;

-- call CriarPessoa('Alexandre Comunista', 'alexandreComunista@teste.com');
select * from pessoa;

 call CriarPessoaFisica("Edinho", "01578956321", "Masculino", "Ensino Superior Incompleto", "1998-05-02", 0, "Solteiro(a)", "edinho@teste.com", "2780555", "Brasília", "Distrito Federal");
 call CriarPessoaFisica("João das Neves", "01144676434", "Masculino", "Ensino Médio Incompleto", "1945-12-12", 0, "Casado(a)", "joaoneves@teste.com", "2731455", "Manaus", "Amazonas");
 
-- call testinho("Feminino", "01578956321", 'blabla' , "Ensino Superior Incompleto", "1998-05-02", 0, "Solteiro(a)", "edinho@teste.com", "2780555", "Brasilia", "Distrito Federal");
-- call CriarPF('Fulano', '123456', 'Feminino', 'Ensino Superior Incompleto', '1995-04-04', 1,  'Solteiro(a)','edinho@bug.com', '1111111', 'Brasília', 'Distrito Federal'); select * from sexo;
-- select  NOT EXISTS (select * from sexo where nome = 'Masculina');
-- call testinho('Masculina');

select * from sexo;
select * from pessoa_fisica;


call CriarCargo('Gerente', '6500.00', 'Administração');
call CriarCargo('Caixa', '2000.00', 'Atendimento');
call CriarCargo('Devolução', '2000.00', 'Atendimento');
call CriarCargo('Organizador de prateleiras', '2500.00', 'Reabastecimento');
call CriarCargo('Gestor de Estoque', '3500', 'Reabastecimento' );
call CriarCargo('Padeiro', '2699.99', 'Padaria');
call CriarSetor('Limpeza');
select * from cargo;
select * from setor;

CALL `mydb`.`CriarFuncionario`('Alexandre Comunista', '12345678910', 'Masculino', 'Ensino Superior Incompleto', '1998-09-07', 0, 'Solteiro(a)', 'alexandrecomunista@usrr.com', '1234567', 'Brasília', 'Distrito Federal', '0', 'Pai Comunista', '1948-06-06', 'Mãe Rússia', '1948-06-07', 'Gerente', null, 1);
CALL `mydb`.`CriarFuncionario`('Edinho Comunista', '12345678911', 'Masculino', 'Ensino Superior Incompleto', '1998-05-11', 0, 'Solteiro(a)', 'edinhocomunista@usrr.com', '1234566', 'Brasília', 'Distrito Federal', '0.05', 'Pai Comunistovski', '1944-03-01', 'Mãe Stalinovski', '1950-07-23', 'Padeiro', (select matricula from funcionario where funcionario.Cargo_idCargo = ( select idCargo from cargo where cargo.nome = 'Gerente')), 1);
CALL `mydb`.`CriarFuncionario`('Juliana Paes', '12345678912', 'Feminino', 'Ensino Superior Completo', '1966-12-11', 0, 'Casado(a)', 'julianapaes@globo.com', '1234568', 'Rio de Janeiro', 'Rio de Janeiro', '0.05', 'José Paes', '1944-08-30', 'Maria Paes', '1947-04-27', 'Padeiro', (select matricula from funcionario where funcionario.Cargo_idCargo = ( select idCargo from cargo where cargo.nome = 'Gerente')), 1);
CALL `mydb`.`CriarFuncionario`('Biroliro', '12345678913', 'Masculino', 'Ensino Fundamental Incompleto', '1829-01-01', 0, 'Casado(a)', 'biroliro@taokey.com', '1234569', 'Rio de Janeiro', 'Rio de Janeiro', '0.00', 'Pai Biroliro', '1789-06-30', 'Mãe Mourão', '1792-09-13', 'Caixa', (select matricula from funcionario where funcionario.Cargo_idCargo = ( select idCargo from cargo where cargo.nome = 'Gerente')), 0);
CALL `mydb`.`CriarFuncionario`('Michaéu Jáquisson', '12345678914', 'Masculino', 'Ensino Médio Completo', '1958-08-29', 0, 'Divorciado(a)', 'michaeu@au.com', '1234570', 'Acrelândia', 'Acre', '0.02', 'Birijin', '1929-02-28', 'Triller', '1927-09-15', 'Gestor de Estoque', (select matricula from funcionario where funcionario.Cargo_idCargo = ( select idCargo from cargo where cargo.nome = 'Gerente')), 0);

select * from funcionario;
select * from pessoa;

CALL `mydb`.`CriarPessoaJuridica`('Cristal Inc.', 'cristal@inc.com','01234567891011', 1, (select matricula from funcionario where funcionario.Cargo_idCargo = ( select idCargo from cargo where cargo.nome = 'Gerente')));
CALL `mydb`.`CriarPessoaJuridica`('Ypê Inc.', 'ype@inc.com','01234567891012', 1, (select matricula from funcionario where funcionario.Cargo_idCargo = ( select idCargo from cargo where cargo.nome = 'Gerente')));
CALL `mydb`.`CriarPessoaJuridica`('Sony Inc.', 'sony@inc.com','01234567891013', 1, (select matricula from funcionario where funcionario.Cargo_idCargo = ( select idCargo from cargo where cargo.nome = 'Gerente')));
CALL `mydb`.`CriarPessoaJuridica`('Microsoft Inc.', 'microsoft@inc.com','01234567891014', 1, (select matricula from funcionario where funcionario.Cargo_idCargo = ( select idCargo from cargo where cargo.nome = 'Gerente')));
CALL `mydb`.`CriarPessoaJuridica`('Apple Inc.', 'apple@inc.com','01234567891015', 1, (select matricula from funcionario where funcionario.Cargo_idCargo = ( select idCargo from cargo where cargo.nome = 'Gerente')));
select * from pessoa_juridica;
select * from pessoa;
select * from pessoa_fisica;

CALL `mydb`.`CriarPessoaFisicaTemEndereco`('12345678910', 'Rússia', '51', '51525020', 'Casa', 'Residencial', 'Asa Norte', 'Brasília', 'Distrito Federal');
call CriarPessoaFisicaTemEndereco('01578956321', 'Rua de Casa', '72', '66666666', 'Cemitério', 'Residencial', 'Red', 'Cor', 'Colorido');
call CriarPessoaFisicaTemEndereco('12345678914', 'Rua de Casa', '72', '66666666', 'Cemitério', 'Residencial', 'Red', 'Cor', 'Colorido');
CALL `mydb`.`CriarPessoaFisicaTemEndereco`('01144676434', '7 de setembro', '29', '69945000', 'Casa', 'Residencial', 'Acrelândia', 'Acrelândia', 'Acre');
CALL `mydb`.`CriarPessoaFisicaTemEndereco`('12345678912', 'Avenida Princesa Isabel', '392', '22011010', 'Hotel', 'Comercial', 'Copacabana', 'Rio de Janeiro', 'Rio de Janeiro');
CALL `mydb`.`CriarPessoaJuridicaTemEndereco`('01234567891011', 'Rússia', '54', '25685471', 'Empresa', 'Comercial', 'Asa Norte', 'Brasília', 'Distrito Federal');

select * from pessoa_tem_endereco;
select * from endereco;
select * from bairro;

CALL `mydb`.`CriarTelefoneTemPessoaFisica`('12345678910', '981832153', 'Pessoal');
CALL `mydb`.`CriarTelefoneTemPessoaFisica`('12345678913', '666666666', 'Pessoal');
CALL `mydb`.`CriarTelefoneTemPessoaFisica`('01144676434', '35689002', 'Residencial');
CALL `mydb`.`CriarTelefoneTemPessoaJuridica`('01234567891011', '08181438177', 'Comercial');
CALL `mydb`.`CriarTelefoneTemPessoaJuridica`('01234567891013', '06140028922', 'Comercial');
select * from telefone_tem_pessoa;
select * from pessoa_juridica;
select * from pessoa_fisica;
select * from pessoa;
select * from telefone;

CALL `mydb`.`CriarDependente`('Beatriz', '01574269534', 'Feminino', 'Ensino Superior Incompleto', '2000-01-08', 0, 'Solteiro(a)', 'beatriz@bia.com', '2859754', 'Salvador', 'Bahia', (select matricula from funcionario where funcionario.Pessoa_fisica_Pessoa_idPessoa = (select Pessoa_idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678913')));
CALL `mydb`.`CriarDependente`('Carlos Alberto', '01545269534', 'Masculino', 'Ensino Médio Incompleto', '2005-01-08', 0, 'Solteiro(a)', 'carlos@alberto.com', '2855754', 'Anápolis', 'Goiás', (select matricula from funcionario where funcionario.Pessoa_fisica_Pessoa_idPessoa = (select Pessoa_idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678913')));
CALL `mydb`.`CriarDependente`('Geovanna Silva', '01495239534', 'Feminino', 'Ensino Fundamental Incompleto', '2010-03-29', 0, 'Solteiro(a)', 'geovanna@silva.com', '2865775', 'Rio de Janeiro', 'Rio de Janeiro',  (select matricula from funcionario where funcionario.Pessoa_fisica_Pessoa_idPessoa = (select Pessoa_idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678914')));
CALL `mydb`.`CriarDependente`('Maria Júlia', '01766232141', 'Feminino', 'Ensino Superior Incompleto', '1999-03-15', 0, 'Solteiro(a)', 'maria@xulia.com', '2705775', 'Brasília', 'Distrito Federal',  (select matricula from funcionario where funcionario.Pessoa_fisica_Pessoa_idPessoa = (select Pessoa_idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678911')));
CALL `mydb`.`CriarDependente`('Bartolomeu da Silva', '01363321191', 'Masculino', 'Ensino Superior Completo', '1949-07-21', 0, 'Casado(a)', 'bartolomeu@silva.com', '2895415', 'Acrelândia', 'Acre',  (select matricula from funcionario where funcionario.Pessoa_fisica_Pessoa_idPessoa = (select Pessoa_idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678911')));
select * from pessoa_fisica;
select a.*, b.* from pessoa_fisica a left outer join dependente b on a.Pessoa_idPessoa = b.Pessoa_fisica_Pessoa_idPessoa;
call PessoaPessoaFisicaDependente();
select * from pessoa;

CALL `mydb`.`CriarCliente`('Pietro Giovanni', '10987654321', 'Masculino', 'Ensino Médio Completo', '1996-11-19', 0, 'Viúvo(a)', 'pietro@giovanni.com', '2734111', 'Curitiba', 'Paraná', (select matricula from funcionario where funcionario.Pessoa_fisica_Pessoa_idPessoa = (select Pessoa_idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678912')));
CALL `mydb`.`CriarCliente`('Roberta Castilho', '78945685215', 'Feminino', 'Ensino Superior Completo', '1989-12-26', 0, 'Separado(a)', 'roberta@castilho.com', '7458962', 'Touro Morto', 'Mato Grosso do Sul', (select matricula from funcionario where funcionario.Pessoa_fisica_Pessoa_idPessoa = (select Pessoa_idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678912')));
CALL `mydb`.`CriarCliente`('Vitória Secredos', '17584652319', 'Feminino', 'Ensino Superior Incompleto', '1979-04-17', 0, 'Divorciado(a)', 'vitoria@secreta.com', '4659873', 'Kadiwéu', 'Mato Grosso do Sul', (select matricula from funcionario where funcionario.Pessoa_fisica_Pessoa_idPessoa = (select Pessoa_idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678911')));
