-- create database cadastroNotas;
use cadastroNotas;
create table Aluno (
    RA int  not null,
    nome varchar(100)

    constraint PK_aluno PRIMARY KEY (RA)
)
go

create table Disciplina(
    codigo int  not null,
    nome varchar(100),
    cargaHoraria int not null,

    CONSTRAINT PK_Disciplina PRIMARY KEY (codigo)
)
go

create table Matricula(
    id int identity(1,1),  --autoincremento na criação do id
    ra int not null,
    ano int not null,
    semestre int not null,

    constraint PK_Matricula primary KEY (id),
    CONSTRAINT FK_Matricula_Aluno foreign key (ra) references Aluno,
    constraint UN_Matricula unique (ra, ano, semestre)
)
go

create table Item_Matricula (
    id int not null, 
    codigo int not null,
    nota1 decimal(3,1),
    nota2 decimal(3,1),
    sub decimal(3,1),
    faltas int not null,
    situacao varchar(20) not null,

    CONSTRAINT PK_Item_Matricula PRIMARY KEY (id, codigo),
    constraint FK_Item_Matricula_Matricula FOREIGN KEY (id) references Matricula (id),
    constraint FK_Item_Matricula_Disciplina FOREIGN KEY (codigo) references Disciplina(codigo)

)