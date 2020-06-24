show databases;
-- comentários

-- a linha abaixo cria um banco de dados
create database dbinfox;

-- a linha abaixo escolhe o banco de dados
use dbinfox;

-- o bloco de instruções abaixo cria uma tabela (varchar aceita qualquer caractere)
create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);

-- o comando abaixo descreve a tabela
describe tbusuarios;

-- a  linha abaixo insere dados na tabela (CRUD)
-- create -> insert
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(1,'Gabriel Costa','9999-9999','gabrielcosta','12345');
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(2,'Administrador','9999-9998','adm','12345');
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(3,'Teste','9999-9997','teste','12345');

-- read -> select
select * from tbusuarios;

-- a linha abaixo modifica dados na tabela (CRUD)
-- update -> update
update tbusuarios set fone='9999-9988' where iduser=2;

-- a linha abaixo apaga um registro da tabele (CRUD)
-- delete -> delete
delete from tbusuarios where iduser=3;

select * from tbusuarios;

-- auto increment cria automaticamente os id
create table tbclientes(
idcli int primary key auto_increment,
nomecli varchar(50) not null,
fonecli varchar(50) not null,
emailcli varchar(50) not null
);

ALTER TABLE tbclientes MODIFY fonecli varchar(50) NULL;
ALTER TABLE tbclientes MODIFY fonecli varchar(50) not NULL;

describe tbclientes;

insert into tbclientes(nomecli,fonecli,emailcli)
values('Vinicius Bueno','9991-9999','vini@gmail.com');

select * from tbclientes;

use dbinfox;

create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp,
equipamento varchar(150) not null,
defeito varchar(150) not null,
servico varchar(150),
tecnico varchar(30),
valor decimal(10,2),
idcli int not null,
-- relacionando uma tabela com a outra
foreign key(idcli) references tbclientes(idcli)
);

describe tbos;

insert into tbos(equipamento,defeito,servico,tecnico,valor,idcli)
values('Bicicleta','Camera furada','Trocar camera','Gabriel',10,1);

select * from tbos;

-- o código abaixo traz informações de duas tabelas
select
O.os,equipamento,defeito,servico,valor,
C.nomecli,fonecli,emailcli
from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli);


use dbinfox;

describe tbusuarios;

select * from tbusuarios; 

-- a linha abaixo adiciona um campo a tabela
alter table tbusuarios add column perfil varchar(20) not null;

-- a linha abaixo deleta um campo a tabela
-- alter table tbusuarios drop column perfil;

update tbusuarios set perfil="adm" where iduser=1;
update tbusuarios set perfil="adm" where iduser=2;

insert into tbusuarios(iduser,usuario,fone,login,senha)
values(3,'Rafael Braga','9999-9997','rafabraga','12345');

update tbusuarios set perfil="user" where iduser=3;


-- a linha abaixo cria um apelido aos campos da tabela
select idcli as Id,nomecli as Nome,fonecli as Fone from tbclientes where nomecli like 'v%';

-- a linha abaixo altera a tabela adicionando um campo em uma determinada posição
alter table tbos add tipo varchar(15) not null after data_os;
alter table tbos add situacao varchar(20) not null after tipo;

describe tbos;
select * from tbos;

-- a instrução abaixo seleciona e ordena por nome todos os clientes cadastrados
select * from tbclientes order by nomecli;

-- o bloco de instruções abaixo faz a seleção e a união de duas tabelas
-- OSER é uma variavel que contem os campos desejados da tabela OS
-- CLI é outra variavel que contem os campos desejados da tabela clientes

select
OSER.os,data_os,tipo,situacao,equipamento,valor,
CLI.nomecli,fonecli,emailcli
from tbos as OSER
inner join tbclientes as CLI
on (CLI.idcli = OSER.idcli);





