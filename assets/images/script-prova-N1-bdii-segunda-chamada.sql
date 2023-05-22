drop database if exists prova_n1_bdii_sc;

create database prova_n1_bdii_sc;

use prova_n1_bdii_sc;

create table funcao(
cod_funcao int not null primary key,
descricao varchar(45) not null
);

create table departamento(
cod_departamento int not null primary key,
descricao varchar(45),
matricula_gerente int
);

create table funcionario(
matricula int not null primary key,
cod_departamento int not null,
cod_funcao int not null,
nome varchar(60) not null,
sexo enum('F','M') not null,
data_nascimento date not null,
data_admissao date not null,
salario decimal(12,2) not null,
bonus decimal(12,2) not null,
percentual_comissao float not null default 0,
foreign key(cod_departamento)
	references departamento(cod_departamento),
foreign key(cod_funcao)
	references funcao(cod_funcao)
);

#Adicionando chave estrangeira em departamento
alter table departamento
add constraint foreign key(matricula_gerente)
	references funcionario(matricula);

# Inserindo os dados na tabela Função
insert into funcao (cod_funcao,descricao) values (1,'Analista de Sistemas');
insert into funcao (cod_funcao,descricao) values (2,'Analista de RH');
insert into funcao (cod_funcao,descricao) values (3,'Gestor');
insert into funcao (cod_funcao,descricao) values (4,'Programador');
insert into funcao (cod_funcao,descricao) values (5,'Contador');
commit;

# Inserindo os dados na tabela Departamento
insert into departamento (cod_departamento,descricao) values (1,'TI');
insert into departamento (cod_departamento,descricao) values (2,'RH');
insert into departamento (cod_departamento,descricao) values (3,'Financeiro');
insert into departamento (cod_departamento,descricao) values (4,'Administrativo');
insert into departamento (cod_departamento,descricao) values (5,'Contabilidade');
insert into departamento (cod_departamento,descricao) values (6,'Compras');
commit;

#(matricula,cod_departamento,cod_funcao,nome,sexo,data_nascimento,data_admissao,salario,bonus,percentual_comissao)
# Inserindo os dados na tabela Funcionário
insert into funcionario values (01,1,4,'Ana Maria Silva','F','1981-04-15','2012-02-13',1500,0,0);
insert into funcionario values (02,1,1,'José Antonio','M','1980-04-15','2012-02-13',3000,0,0);
insert into funcionario values (03,3,3,'Miriam Galvão','F','1976-05-05','2011-04-03',3500,2200,5);
insert into funcionario values (04,3,3,'Luiz Melo','M','1982-07-21','2007-10-11',2000,0,0);
insert into funcionario values (05,2,2,'Lúcia Mendonça','F','1985-03-02','2006-09-01',3500,1500,3);
insert into funcionario values (06,3,3,'Mauro Antunes','M','1987-09-12','2013-04-11',2000,0,0);
insert into funcionario values (07,1,1,'Marcos Adriano','M','1988-01-18','2013-01-07',4500,2500,4);
insert into funcionario values (08,2,2,'Maria da Silva','F','1991-10-01','2013-02-15',2500,0,0);
insert into funcionario values (09,2,2,'Joao Silva','M','1981-03-16','2012-02-13',1500,0,0);
insert into funcionario values (10,4,3,'Maria Cunha','F','1980-02-14','2011-04-20',3000,0,0);
insert into funcionario values (11,4,3,'Pedro Aguiar','M','1975-04-02','2007-03-12',4500,1100,2);
insert into funcionario values (12,4,3,'Nando Caixinha','M','1983-08-22','2007-10-11',2000,0,0);
insert into funcionario values (13,5,5,'Antonio Pereira','M','1969-03-02','1990-05-05',2500,0,0);
insert into funcionario values (14,5,5,'Felipe Escolar','M','1968-09-11','2013-03-18',2000,0,0);
insert into funcionario values (15,5,5,'Elaine Luciana','F','1989-01-13','2013-06-22',4200,1500,2);
insert into funcionario values (16,6,3,'Pelé Golias','M','1992-11-11','2014-01-15',2500,0,0);
insert into funcionario values (17,6,3,'Tito Vardones','M','1994-12-01','2014-01-15',2500,0,0);
insert into funcionario values (18,6,3,'Catarina Dias','F','1990-07-26','2014-01-15',3500,1200,2);
commit;

update departamento set matricula_gerente = 07 where cod_departamento =1;
update departamento set matricula_gerente = 05 where cod_departamento =2;
update departamento set matricula_gerente = 03 where cod_departamento =3;
update departamento set matricula_gerente = 11 where cod_departamento =4;
update departamento set matricula_gerente = 15 where cod_departamento =5;
update departamento set matricula_gerente = 18 where cod_departamento =6;
commit;