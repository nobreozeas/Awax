use prova_sc_n2_bdii;

# 1) Liste a matrícula, nome, nome do departamento, nome da função,
# data de nascimento (no formato dd/mm/yyyy) e idade dos 5 funcionários mais velhos.
# Crie uma função para calcular a idade. 
#Esta função deverá ser usada na consulta. (2,0)
select f.nome as nome, d.descricao as departamento, fu.descricao as funcao, 
f.data_nascimento as data_nascimento,(f.data_nascimento )-(2018-07-05) idade

from funcionario f, departamento d, funcao fu

where 
f.cod_departamento=d.cod_departamento and
f.cod_funcao=fu.cod_funcao;


/* 2) Crie uma stored procedure que receba o código do funcionário 
como parâmetro e que tenha como saída o valor da remuneração total
(salário + bônus), valor do imposto de renda (15% sobre o total da remuneração)
 e o valor do salário líquido
 (valor da remuneração – imposto de renda). (3,0 */ 
 
  delimiter |
 
  create procedure salario(funcionario.matricula)
  
  funcionario.salario+funcionario.bonus
  return remuneracao_total;

 |
 /* 3) Crie triggers, conforme a seguir: (2,0)
TABELA FUNCIONARIO
Evento Ação da trigger
INSERT
Ao incluir um registro na tabela funcionário,
 esta trigger deverá calcular o valor do bônus 
 multiplicando o valor do salário pelo percentual de comissão informado.
UPDATE

Ao atualizar um registro na tabela funcionário, 
esta trigger deverá calcular o valor do bônus multiplicando o valor 
do salário pelo percentual de comissão informado
 (caso haja alteração no campo salário ou do percentual de comissão). */
 

delimiter |
 create trigger after_insert
 after insert on funcionario for each row
 begin
 
 update funcionario
 set bonus = salario * percentual_comissao
 where salario > 0;
 
 
 end;
 |
 delimiter ;


delimiter |
 create trigger after_insert
 before insert on funcionario for each row
 begin
 
 update funcionario
 set bonus = salario * percentual_comissao
 where salario > 0;
 
 
 end;
 |
 delimiter ;



 
 
