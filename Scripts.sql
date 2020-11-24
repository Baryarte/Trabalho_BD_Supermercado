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
delete from atualizado_em;
delete from reabastecimento;
delete from compra;
delete from parcela;
delete from pagamento;
delete from forma_pagamento;
delete from tipo_pagamento;
delete from historico_desconto;
delete from mercadoria;
delete from tipo_mercadoria;
delete from marca;
delete from desconto;
delete from cliente;
delete from desconto;
delete from telefone_tem_pessoa;
delete from pessoa_tem_endereco;
delete from pessoa_juridica;
delete from dependente;
delete t1
from  funcionario t1, funcionario t2 
where t1.idPessoa > t2.idPessoa ;
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

CALL `mydb`.`CriarFuncionario`('Alexandre Comunista', '12345678910', 'Masculino', 'Ensino Superior Incompleto', '1998-09-07', 0, 'Solteiro(a)', 'alexandrecomunista@usrr.com', '1234567', 'Brasília', 'Distrito Federal', '0', 'Pai Comunista', '1948-06-06', 'Mãe Rússia', '1948-06-07', 'Gerente', 'Administração', '6500', 1);
CALL `mydb`.`CriarFuncionario`('Edinho Comunista', '12345678911', 'Masculino', 'Ensino Superior Incompleto', '1998-05-11', 0, 'Solteiro(a)', 'edinhocomunista@usrr.com', '1234566', 'Brasília', 'Distrito Federal', '0.05', 'Pai Comunistovski', '1944-03-01', 'Mãe Stalinovski', '1950-07-23', 'Padeiro', 'Padaria', '2699.99', 1);
CALL `mydb`.`CriarFuncionario`('Juliana Paes', '12345678912', 'Feminino', 'Ensino Superior Completo', '1966-12-11', 0, 'Casado(a)', 'julianapaes@globo.com', '1234568', 'Rio de Janeiro', 'Rio de Janeiro', '0.05', 'José Paes', '1944-08-30', 'Maria Paes', '1947-04-27', 'Padeiro', 'Padaria', '2699.99', 1);
CALL `mydb`.`CriarFuncionario`('Biroliro', '12345678913', 'Masculino', 'Ensino Fundamental Incompleto', '1829-01-01', 0, 'Casado(a)', 'biroliro@taokey.com', '1234569', 'Rio de Janeiro', 'Rio de Janeiro', '0.00', 'Pai Biroliro', '1789-06-30', 'Mãe Mourão', '1792-09-13', 'Caixa', 'Atendimento', '2000', 0);
CALL `mydb`.`CriarFuncionario`('Michaéu Jáquisson', '12345678914', 'Masculino', 'Ensino Médio Completo', '1958-08-29', 0, 'Divorciado(a)', 'michaeu@au.com', '1234570', 'Acrelândia', 'Acre', '0.02', 'Birijin', '1929-02-28', 'Triller', '1927-09-15', 'Gestor de Estoque', 'Reabastecimento', '3500', 0);
CALL `mydb`.`CriarFuncionario`('Yudi Tamashiro', '12345678915', 'Masculino', 'Ensino Médio Completo', '1992-05-13', 0, 'Solteiro(a)', 'yudi@playstation.com', '1234571', 'Santos', 'São Paulo', '0.03', 'Hiraki Tamashiro', '1959-03-03', 'Priscila Tamashiro', '1961-10-12', 'Vendedor de eletrônicos', 'Informática', '3000',  1);

select * from funcionario;
select * from pessoa;

CALL `mydb`.`CriarPessoaJuridica`('Cristal Inc.', 'cristal@inc.com','01234567891011', 1);
CALL `mydb`.`CriarPessoaJuridica`('Ypê Inc.', 'ype@inc.com','01234567891012', 1);
CALL `mydb`.`CriarPessoaJuridica`('Sony Inc.', 'sony@inc.com','01234567891013', 1);
CALL `mydb`.`CriarPessoaJuridica`('Microsoft Inc.', 'microsoft@inc.com','01234567891014', 1);
CALL `mydb`.`CriarPessoaJuridica`('Apple Inc.', 'apple@inc.com','01234567891015', 1);
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

CALL `mydb`.`CriarDependente`('Beatriz', '01574269534', 'Feminino', 'Ensino Superior Incompleto', '2000-01-08', 0, 'Solteiro(a)', 'beatriz@bia.com', '2859754', 'Salvador', 'Bahia', (select matricula from funcionario where funcionario.idPessoa = (select idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678913')));
CALL `mydb`.`CriarDependente`('Carlos Alberto', '01545269534', 'Masculino', 'Ensino Médio Incompleto', '2005-01-08', 0, 'Solteiro(a)', 'carlos@alberto.com', '2855754', 'Anápolis', 'Goiás', (select matricula from funcionario where funcionario.idPessoa = (select idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678913')));
CALL `mydb`.`CriarDependente`('Geovanna Silva', '01495239534', 'Feminino', 'Ensino Fundamental Incompleto', '2010-03-29', 0, 'Solteiro(a)', 'geovanna@silva.com', '2865775', 'Rio de Janeiro', 'Rio de Janeiro',  (select matricula from funcionario where funcionario.idPessoa = (select idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678914')));
CALL `mydb`.`CriarDependente`('Maria Júlia', '01766232141', 'Feminino', 'Ensino Superior Incompleto', '1999-03-15', 0, 'Solteiro(a)', 'maria@xulia.com', '2705775', 'Brasília', 'Distrito Federal',  (select matricula from funcionario where funcionario.idPessoa = (select idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678911')));
CALL `mydb`.`CriarDependente`('Bartolomeu da Silva', '01363321191', 'Masculino', 'Ensino Superior Completo', '1949-07-21', 0, 'Casado(a)', 'bartolomeu@silva.com', '2895415', 'Acrelândia', 'Acre',  (select matricula from funcionario where funcionario.idPessoa = (select idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678911')));
select * from pessoa_fisica;
select a.*, b.* from pessoa_fisica a left outer join dependente b on a.idPessoa = b.idPessoa;
call PessoaPessoaFisicaDependente();
select * from pessoa;

CALL `mydb`.`CriarCliente`('Pietro Giovanni', '10987654321', 'Masculino', 'Ensino Médio Completo', '1996-11-19', 0, 'Viúvo(a)', 'pietro@giovanni.com', '2734111', 'Curitiba', 'Paraná', (select matricula from funcionario where funcionario.idPessoa = (select idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678912')));
CALL `mydb`.`CriarCliente`('Roberta Castilho', '78945685215', 'Feminino', 'Ensino Superior Completo', '1989-12-26', 0, 'Separado(a)', 'roberta@castilho.com', '7458962', 'Touro Morto', 'Mato Grosso do Sul', (select matricula from funcionario where funcionario.idPessoa = (select idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678912')));
CALL `mydb`.`CriarCliente`('Vitória Secredos', '17584652319', 'Feminino', 'Ensino Superior Incompleto', '1979-04-17', 0, 'Divorciado(a)', 'vitoria@secreta.com', '4659873', 'Kadiwéu', 'Mato Grosso do Sul', (select matricula from funcionario where funcionario.idPessoa = (select idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678911')));
CALL `mydb`.`CriarCliente`('Já Queline', '09568732456', 'Feminino', 'Ensino Fundamental Completo', '1985-09-11', 0, 'Divorciado(a)', 'ja@queline.com', '5437698', 'Brasília', 'Distrito Federal', (select matricula from funcionario where funcionario.idPessoa = (select idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678910')));
CALL `mydb`.`CriarCliente`('Marivaldo Pereira', '32143267351', 'Outro', 'Ensino Superior Completo', '1992-02-01', 0, 'Solteiro(a)', 'marivaldo@pereira.com', '5463411', 'Brasília', 'Distrito Federal', (select matricula from funcionario where funcionario.idPessoa = (select idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678911')));
select * from cliente;

CALL `mydb`.`CriarDesconto`('Dia dos Pais', '0.25', '2020-08-12');
CALL `mydb`.`CriarDesconto`('Dia das Mães', '0.30', '2020-05-14');
CALL `mydb`.`CriarDesconto`('Black Friday', '0.40', '2020-11-30');
CALL `mydb`.`CriarDesconto`('Natal', '0.25', '2020-12-30');
CALL `mydb`.`CriarDesconto`('Desconto da semana', '0.15', '2020-11-28');
CALL `mydb`.`CriarDesconto`('Desconto de aniversário', '0.20', '2020-12-23');
CALL `mydb`.`CriarDesconto`('Desconto surpresa', '0.45', '2020-11-23');
select * from desconto;

CALL `mydb`.`CriarMarca`('Ypê', '01234567891012');
CALL `mydb`.`CriarMarca`('Playstation', '01234567891013');
CALL `mydb`.`CriarMarca`('Xbox', '01234567891014');
CALL `mydb`.`CriarMarca`('Cristal', '01234567891011');
CALL `mydb`.`CriarMarca`('iPhone', '01234567891015');
CALL `mydb`.`ConsultaPessoaPessoaJuridicaMarca`();

CALL `mydb`.`CriarTipoMercadoria`('Limpeza');
CALL `mydb`.`CriarTipoMercadoria`('Grão');
CALL `mydb`.`CriarTipoMercadoria`('Celular');
CALL `mydb`.`CriarTipoMercadoria`('Videogame');
CALL `mydb`.`CriarTipoMercadoria`('Biscoito');
select * from tipo_mercadoria;

CALL `mydb`.`CriarMercadoria`('Arroz', '19.99', '5kg', '500', '2021-01-22', null, '15.40', '34980JT4038', current_date, (select matricula from funcionario where funcionario.idPessoa = (select idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678911')), 'Grão', 'Cristal');
CALL `mydb`.`CriarMercadoria`('Arroz', '21.99', '5kg', '400', '2021-03-27', null, '16.40', '64440JT4038', '2020-01-27', (select matricula from funcionario where funcionario.idPessoa = (select idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678911')), 'Grão', 'Cristal');
CALL `mydb`.`CriarMercadoria`('iPhone 11', '4350.99', '194g', '100', '3000-01-01' , null, '2850.45', 'F30K9F30', current_date, (select matricula from funcionario where funcionario.idPessoa = (select idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678910')), 'Celular', 'iPhone');
CALL `mydb`.`CriarMercadoria`('Playstation 5', '5599.99', '5Kg', '50', '3000-01-01' , null, '3559.99', 'FK039KF9', current_date, (select matricula from funcionario where funcionario.idPessoa = (select idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678915')), 'Videogame', 'Playstation');
CALL `mydb`.`CriarMercadoria`('Xbox Series X', '4999.90', '4.5Kg', '50', '3000-01-01' , null, '2999.90', 'FK39053U', current_date, (select matricula from funcionario where funcionario.idPessoa = (select idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678915')), 'Videogame', 'Xbox');
CALL `mydb`.`CriarMercadoria`('Detergente', '1.65', null , '700', '2022-03-22' , '500ml', '0.59', 'L403L42',current_date, (select matricula from funcionario where funcionario.idPessoa = (select idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678910')), 'Limpeza', 'Ypê');
CALL `mydb`.`ConsultaPessoaPessoaFisicaFuncionario`();
select * from mercadoria;
select * from funcionario;
select * from pessoa_fisica;
select * from pessoa;



CALL `mydb`.`CriarHistoricoDesconto`('Desconto da semana', '2020-11-28', 'Arroz', 'Cristal', '34980JT4038', null, null);
CALL `mydb`.`CriarHistoricoDesconto`('Black Friday', '2020-11-30', null , null , null, 'Videogame', null);
CALL `mydb`.`CriarHistoricoDesconto`('Natal', '2020-12-30', null , null , null ,null, 'Ypê');
CALL `mydb`.`CriarHistoricoDesconto`('Dia das Mães', '2020-05-14', 'iPhone 11' , 'iPhone' ,null, null , null);
CALL `mydb`.`CriarHistoricoDesconto`('Dia dos Pais', '2020-08-12', 'Arroz' , 'Cristal' , null,null , null);
CALL `mydb`.`CriarHistoricoDesconto`('Desconto de aniversário', '2020-12-23', null , null , null , null, 'Cristal');
CALL `mydb`.`CriarHistoricoDesconto`('Desconto surpresa', '2020-11-23', 'Playstation 5' , 'Playstation' , null, null , null);
select * from desconto;
select * from historico_desconto;
select * from tipo_mercadoria;
select * from mercadoria;
select * from marca;


CALL `mydb`.`CriarTipoPagamento`('À vista');
CALL `mydb`.`CriarTipoPagamento`('Parcelado');
select * from tipo_pagamento;

CALL `mydb`.`CriarFormaPagamento`('Cartão - débito', 'À vista');
CALL `mydb`.`CriarFormaPagamento`('Cheque', 'À vista');
CALL `mydb`.`CriarFormaPagamento`('Dinheiro', 'À vista');
CALL `mydb`.`CriarFormaPagamento`('Cartão - crédito', 'Parcelado');
CALL `mydb`.`CriarFormaPagamento`('Cheque', 'Parcelado');
select * from forma_pagamento;

select nome from tipo_pagamento where tipo_pagamento.nome = 'Parcelado';
(select idTipo_pagamento from tipo_pagamento where tipo_pagamento.nome = 'Parcelado');
(select idTipo_pagamento from forma_pagamento where forma_pagamento.nome = 'Cartão - crédito');
select greatest(1,2,3);
select LAST_DAY(CURRENT_DATE);


(select valor from desconto where desconto.idDesconto = (select idDesconto from historico_desconto where historico_desconto.idMercadoria = (select idMercadoria from mercadoria where mercadoria.nome = 'iPhone 11' and mercadoria.idMarca = (select idMarca from marca where marca.nome = 'iPhone'))));
(select valor from desconto where desconto.idDesconto = (select idDesconto from historico_desconto where historico_desconto.idTipo_mercadoria = (select idTipo_mercadoria from tipo_mercadoria where tipo_mercadoria.nome = 'Videogame')));
CALL `mydb`.`ConsultaTipoDaMercadoria`('Detergente' , 'Ypê');

(select idDesconto, valor, validade from desconto where desconto.idDesconto = (select idDesconto from historico_desconto where historico_desconto.idMarca = (select idMarca from marca where marca.nome = 'Ypê'))) union
(select idDesconto, valor, validade from desconto where desconto.idDesconto = (select idDesconto from historico_desconto where historico_desconto.idTipo_mercadoria = (select idTipo_mercadoria from tipo_mercadoria where tipo_mercadoria.nome = 'Videogame'))) union
(select idDesconto, valor, validade from desconto where desconto.idDesconto = (select idDesconto from historico_desconto where historico_desconto.idMercadoria = (select idMercadoria from mercadoria where mercadoria.nome = 'iPhone 11' and mercadoria.idMarca = (select idMarca from marca where marca.nome = 'iPhone')))) order by  valor desc;


(select idDesconto from ((select idDesconto, valor, validade from desconto where desconto.idDesconto = (select idDesconto from historico_desconto where historico_desconto.idMarca = (select idMarca from marca where marca.nome = 'Ypê'))) union
(select idDesconto, valor, validade from desconto where desconto.idDesconto = (select idDesconto from historico_desconto where historico_desconto.idTipo_mercadoria = (select idTipo_mercadoria from tipo_mercadoria where tipo_mercadoria.nome = 'Videogame'))) union
(select idDesconto, valor, validade from desconto where desconto.idDesconto = (select idDesconto from historico_desconto where historico_desconto.idMercadoria = (select idMercadoria from mercadoria where mercadoria.nome = 'iPhone 11' and mercadoria.idMarca = (select idMarca from marca where marca.nome = 'iPhone'))))) T where (datediff(T.validade,current_date()) > 0 )) order by valor desc limit 1;


select null into @idMesmoPagamento;
select @idMesmoPagamento;
CALL `mydb`.`CriarPagamentoParcelaCompra`('Cheque', 'Parcelado', (select matricula from funcionario where funcionario.idPessoa = ( select idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678910')), '17584652319', '4350.99', 3, 'iPhone 11', 'iPhone', 'F30K9F30', 1, @idMesmoPagamento);
select @idMesmoPagamento;
set @idMesmoPagamento = null;
CALL `mydb`.`CriarPagamentoParcelaCompra`('Dinheiro', 'À vista', (select matricula from funcionario where funcionario.idPessoa = ( select idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678915')), '17584652319', '13288.25', 0, 'Playstation 5', 'Playstation', 'FK039KF9', 2, @idMesmoPagamento);
CALL `mydb`.`CriarPagamentoParcelaCompra`('Cartão - crédito', 'Parcelado', (select matricula from funcionario where funcionario.idPessoa = ( select idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678915')), '17584652319', '13288.25', 0, 'Xbox Series X', 'Xbox', 'FK39053U', 1, @idMesmoPagamento);
set @idMesmoPagamento = null;
CALL `mydb`.`CriarPagamentoParcelaCompra`('Cartão - débito', 'À vista', (select matricula from funcionario where funcionario.idPessoa = ( select idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678915')), '10987654321', '7000.00', 0, 'Playstation 5', 'Playstation', 'FK039KF9', 1, @idMesmoPagamento);
set @idMesmoPagamento = null;
select @idMesmoPagamento;
CALL `mydb`.`CriarPagamentoParcelaCompra`('Cheque', 'Parcelado', (select matricula from funcionario where funcionario.idPessoa = ( select idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678910')), '09568732456' , '199.99', 12, 'Arroz', 'Cristal', '34980JT4038', 10, @idMesmoPagamento);
set @idMesmoPagamento = null;
CALL `mydb`.`CriarPagamentoParcelaCompra`('Dinheiro', 'À vista', (select matricula from funcionario where funcionario.idPessoa = ( select idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678910')), '78945685215' , '500.00', 5, 'Detergente', 'Ypê', 'L403L42', 35, @idMesmoPagamento);
 
 
 (select a.idDesconto from (select t1.idDesconto, t1.nome, t1.valor, t1.validade, t2.idMercadoria, t2.idTipo_mercadoria, t2.idMarca from desconto t1
left join historico_desconto t2 on t1.idDesconto = t2.idDesconto where (select idMercadoria from mercadoria where mercadoria.nome = 'Arroz' and mercadoria.idMarca = (select idMarca from marca where marca.nome = 'Cristal') and mercadoria.lote = '34980JT4038') in (select t2.idMercadoria) or (select idMarca from marca where marca.nome = 'Cristal') in (select t2.idMarca) or (select idTipo_mercadoria from mercadoria where mercadoria.nome = 'Arroz' and mercadoria.idMarca = (select idMarca from marca where marca.nome = '34980JT4038') and mercadoria.lote = '34980JT4038') in (select t2.idTipo_mercadoria)) a  where (datediff(a.validade, current_date)>0) order by valor desc limit 1);



select t1.idDesconto, t1.nome, t1.valor, t1.validade, t2.idMercadoria, t2.idTipo_mercadoria, t2.idMarca from desconto t1
left join historico_desconto t2 on t1.idDesconto = t2.idDesconto where '36' in (select t2.idMercadoria) or '39' in (select t2.idMarca) or '37' in (select t2.idTipo_mercadoria) order by valor desc limit 1;

select a.idDesconto from (select t1.idDesconto, t1.nome, t1.valor, t1.validade, t2.idMercadoria, t2.idTipo_mercadoria, t2.idMarca from desconto t1
left join historico_desconto t2 on t1.idDesconto = t2.idDesconto where '36' in (select t2.idMercadoria) or '39' in (select t2.idMarca) or '37' in (select t2.idTipo_mercadoria)) a where (datediff(a.validade, current_date)>0) order by valor desc limit 1111;
CALL `mydb`.`ConsultaMaiorDescontoMercadoriaTipoMercadoriaMarca`('Arroz', 'Cristal', '34980JT4038');
CALL `mydb`.`ConsultaMaiorDescontoMercadoriaTipoMercadoriaMarca`('Playstation 5', 'Playstation', 'FK039KF9');

select * from mercadoria;
select * from marca;
select * from tipo_mercadoria;
select * from desconto;
select * from historico_desconto;
select * from forma_pagamento;
select * from tipo_pagamento;
select * from pagamento;
select * from parcela;
select * from compra;
select * from pessoa;
select * from mercadoria;
select * from pessoa_juridica;
select * from pessoa;



CALL `mydb`.`CriarReabastecimento`('Playstation 5', '7000.0', '5kg', '10', '3000-05-25', null, '5000', 'FK039KF9',  '2020-11-21', (select matricula from funcionario where funcionario.idPessoa = (select idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678910' )), 'Videogame', 'Playstation', null, '01234567891013');
CALL `mydb`.`CriarReabastecimento`('Detergente', '7000.0', '5kg', '10', '3000-05-25', null, '5000', 'L403L42',  '2020-11-21', (select matricula from funcionario where funcionario.idPessoa = (select idPessoa from pessoa_fisica where pessoa_fisica.cpf = '12345678910' )), 'Limpeza', 'Ypê', null, '01234567891013');
select * from atualizado_em;
select * from mercadoria;
select * from reabastecimento;










-- parcela, pagamento, compra, reabastecimento 



