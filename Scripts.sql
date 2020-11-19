-- delete from pessoa;
-- delete from sexo;

-- INSERT INTO sexo (descricao)
--     VALUES ('Masculino'),
--     ('Feminino');

-- INSERT INTO pessoa (nome)
--     VALUES ('Gerundia');
    
  
-- INSERT INTO pessoa_fisica (Pessoa_idPessoa, cpf, Sexo_idSexo, escolaridade, data_nasc, fornecedor)
-- VALUES (last_insert_id(), 01455588822, (select idSexo from sexo where descricao = 'Feminino'),  'Ensino médio completo', '1997-12-09', 0 );

delete from sexo;
delete from endereco;
delete from bairro;
delete from cidade;
delete from estado;
delete from tipo_endereco;
delete from escolaridade;
delete from estado_civil;
delete from telefone;
delete from pessoa;
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
-- delete from bairro;
select * from bairro;

(select * from bairro where bairro.nome = 'Acrelândia' and Cidade_idCidade = (select idCidade from cidade where cidade.nome = 'Acrelândia'));

call CriarTipoEndereco('Residencial');
call CriarTipoEndereco('Comercial');
-- delete from Tipo_endereco;
select * from tipo_endereco;


call CriarEndereco('7 de setembro', '29', '69945000', 'Casa', 'Residencial', 'Acrelândia', 'Acrelândia', 'Acre');
call CriarEndereco('Avenida Princesa Isabel', '392', '22011010', 'Hotel', 'Comercial', 'Copacabana', 'Rio de Janeiro', 'Rio de Janeiro');
call CriarEndereco('Rua Doutor Cesário da Mota', '639', '11045003', 'Drogaria', 'Comercial', 'Boqueirão', 'Santos', 'São Paulo');
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

call CriarPessoa('Alexandre Comunista');
select * from pessoa;
select exists (SELECT * FROM sexo WHERE nome = "Masculino");
select exists (select * from sexo where nome = 'Masculino')  = 0;
SELECT idSexo FROM sexo WHERE nome = 'Masculino';
-- insert into pessoa_fisica (Pessoa_idPessoa, cpf, Sexo_idSexo, Escolaridade_idEscolaridade, data_nasc, fornecedor, Estado_civil_idEstado_civil, email, identidade, Cidade_idCidade)
-- values (159, '01433333333', (select idSexo from sexo where nome = 'Masculino'), (select idEscolaridade from escolaridade where nome = 'Ensino Superior Completo'), '2012-12-12', 0, (select idEstado_civil from estado_civil where nome = 'Solteiro(a)'), 'bug@bug.com', '1234567', (select idCidade from cidade where nome = 'Brasília')); 

-- call CriarPF("Ediasdanho", "01578956321", "Masculino", "Ensino Superior Incompleto", "1998-05-02", 0, "Solteiro(a)", "edinho@teste.com", "2780555", "Brasília", "Distrito Federal");
-- call testinho("Feminino", "01578956321", 'blabla' , "Ensino Superior Incompleto", "1998-05-02", 0, "Solteiro(a)", "edinho@teste.com", "2780555", "Brasilia", "Distrito Federal");
-- call CriarPF('Fulano', '123456', 'Feminino', 'Ensino Superior Incompleto', '1995-04-04', 1,  'Solteiro(a)','edinho@bug.com', '1111111', 'Brasília', 'Distrito Federal'); select * from sexo;
-- select  NOT EXISTS (select * from sexo where nome = 'Masculina');
-- call testinho('Masculina');

select * from sexo;
select * from pessoa_fisica;




