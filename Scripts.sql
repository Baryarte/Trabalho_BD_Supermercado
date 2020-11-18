-- delete from pessoa;
-- delete from sexo;

-- INSERT INTO sexo (descricao)
--     VALUES ('Masculino'),
--     ('Feminino');

-- INSERT INTO pessoa (nome)
--     VALUES ('Gerundia');
    
  
-- INSERT INTO pessoa_fisica (Pessoa_idPessoa, cpf, Sexo_idSexo, escolaridade, data_nasc, fornecedor)
-- VALUES (last_insert_id(), 01455588822, (select idSexo from sexo where descricao = 'Feminino'),  'Ensino médio completo', '1997-12-09', 0 );



call CriarSexo('Masculino');
call CriarSexo('Feminino');
call CriarSexo('Outro');
select * from sexo;

call CriarEstado('Distrito Federal');
call CriarEstado('Acre');
call CriarEstado('Paraná');
call CriarEstado('São Paulo');
call CriarEstado('Rio de Janeiro');
select * from estado;

call CriarCidade('Brasília', 'Distrito Federal');
call CriarCidade('Salvador', 'Bahia'); -- Criar cidade com estado ainda nao cadastrado
call CriarCidade('Curitiba', 'Paraná');
call CriarCidade('Acrelândia', 'Acre');
call CriarCidade('Rio de Janeiro', 'Rio de Janeiro');
-- update cidade
-- set nome = 'Picos'
select * from cidade;

call CriarBairro('Asa Norte', 'Brasília', 'Distrito Federal');
call CriarBairro('Santos', 'São Paulo', 'São Paulo'); -- Cidade não existente
call CriarBairro('Suelândia', 'Rorainópolis', 'Roraima'); -- Cidade e estado nao existentes
call CriarBairro('Copacabana', 'Rio de Janeiro', 'Rio de Janeiro');
call CriarBairro('Acrelândia', 'Acrelândia', 'Acre');
select * from bairro;

call CriarTipoEndereco('Residencial');
call CriarTipoEndereco('Comercial');
select * from tipo_endereco;