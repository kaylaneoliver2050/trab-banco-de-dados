create table users(
id_user int primary key auto_increment,
name varchar(40) not null,
email varchar(30) not null,
password varchar(20) not null unique,
telefone varchar(11) not null,
cidade varchar(20) not null
);

insert into users
(name,email,password,telefone,cidade)
values
("Kaio Gouveia","kaio.gouveiafreire@gmail.com","30042005","85986693269","Redenção-CE"),
("Kananda Larry","kananda.oli@gmail.com","01082006","85994270631","Acarape-CE"),
("Hyvina Lino","hyvinasilva@gmail.com","20102006","85986303449","Acarape-CE"),
("Antônia Clara","antclara10@gmail.com","08082006","85986693269","Acarape-CE"),
("Erik Gabriel","eriklima@gmail.com","24122005","85991013084","Acarape-CE");

select * from users;


create table roles(
id_roles int primary key auto_increment,
name varchar(20) not null
);

insert into roles
(name)
values
("Admin"),
("Client"),
("Employee");

select * from roles;

create table user_roles(
id_user int,
id_roles int,
foreign key(id_user) references users(id_user),
foreign key(id_roles) references roles(id_roles)
);

insert into user_roles
(id_user, id_roles)
values
(1,1),
(2,1),
(3,1),
(4,2),
(5,3),
(3,3);

select * from user_roles;

create table post(
id_post int primary key auto_increment ,
title varchar(40),
description text,
id_user int,
foreign key(id_user) references users(id_user)
);

insert into post
(title,description,id_user)
values
("Pantera Negra 2","Melhor filme lançamento de 2022!","1"),
("Top 3 melhores filmes mindfuck","1:Clube da Luta. 2:Donnie Darko. 3:Uma Mente Brilhante","1"),
("Libertários não morrem","Melhor música de Felipe Ret","2"),
("Lugar Distante","Música do trapper Matuê","2"),
("Quentin Tarantino","Diretor de cinema dos famosos filmes Pulp Fiction, Django Livre, Kill Bill e etc ","3"),
("Martin Scorsese","Produtor de cinema e roteirista, diretor das obras Táxi Driver, O Irlandês e O Lobo de Wall Street ","3"),
("Streamings de música","1.Spotify, 2.Youtube Music, 3.Amazon Music","4"),
("Top 3 plataformas de filmes","1.Netflix, 2.HBO Max, 3.Disney+","4"),
("Animes de aventura/ação","1.One Piece, 2.Hunter X Hunter, 3.Dragon Ball","5"),
("Calcinha Preta","Banda de forró eletrônico e dona dos hits Hoje á noite, Mágica e Liga pra mim'","5");

select * from post;

select
post.id_post,
post.title,
post.description,
post.id_user,
users.id_user,
users.name from post inner join users on post.id_user = users.id_user
where users.id_user = 5;

select
post.id_post,
post.title,
post.description,
post.id_user,
users.id_user,
users.name from post inner join users on post.id_user = users.id_user
where users.id_user = 3;

select
post.id_post,
post.title,
post.description,
post.id_user,
users.id_user,
users.name from post inner join users on post.id_user = users.id_user
where users.id_user = 5;

delete from user_roles
where id_user = 2;

delete from post 
where id_user = 2;

delete from users
where id_user = 2;

delete from post 
where id_post = 4;


update post
set title = "Guardiões da Galáxia 2",
description = "melhor filme da marvel"
where id_user = 1
;

select
users.id_user,
users.name,
roles.name from user_roles 
join users on user_roles.id_user = users.id_user 
join roles on roles.id_roles = user_roles.id_roles 
where roles.name = "Admin";


