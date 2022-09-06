--- Creo la tabla estudiante
create table estudiantes1(
	id bigserial not null primary key
	nombre character varying(60),
    apellido character varying(60),
    email character varying(150),
    batch integer
)

--- Poblar la tabla estudiante

insert into estudiantes (nombre, apellido, email, batch) 
	values 
	('Estudiante12', 'apellido12', 'correo12@correo.com', 2),
	('Estudiante13', 'apellido13', 'correo13@correo.com', 2),
	('Estudiante14', 'apellido14', 'correo14@correo.com', 3),
	('Estudiante15', 'apellido15', 'correo15@correo.com', 3),
	('Estudiante16', 'apellido16', 'correo16@correo.com', 3),
	('Estudiante17', 'apellido17', 'correo17@correo.com', 1),
	('Estudiante18', 'apellido18', 'correo18@correo.com', 1),
	('Estudiante19', 'apellido19', 'correo19@correo.com', 1),
	('Estudiante20', 'apellido20', 'correo20@correo.com', 4);

--Consultas sql

--Mostrar todos los estudiantes 
select * from public.estudiantes; 

-- Mostrar solo el nombre del estudiante 
select nombre from public.estudiantes;

-- Mostrar nombre y apelido del estudiante 
select nombre, apellido from public.estudiantes; -- trae los nombres y apellidos de los estudiantes 

-- Mostrar los estudiantes que se encuentran en el batch 1
select * from public.estudiantes where batch = 1; 

-- Mostrar los estudiantes cuyo nombre comienzan con la letra A
select * from public.estudiantes where nombre like 'A%'; 


-- operador AND
--Mostrar los estudiantes cuyo nombre empieza por la letra A y se encuentra en batch 1
select * from public.estudiantes where nombre like 'A%' and batch = 1; 


-- operador OR
-- Mostrar los estudiantes que tienen batch 1 y batch 3
select * from public.estudiantes where batch = 1 or batch = 3; 


--- operador NOT
-- Mostrar los estudiantes que no se encuentra en batch 3
select * from public.estudiantes where not (batch = 3); 


-- ordenar los datos 
select * from public.estudiantes e order by batch asc;
select * from public.estudiantes e order by batch asc, nombre desc;


-- actualizar datos 
update public.estudiantes 
set batch = 3, nombre = 'Estuden'
where id = 2

select * from estudiantes; -- mostrar los nuevos datos


-- Eliminar registros que empiza por la letra r
delete from public.estudiantes where nombre like 'r%';


-- limitar registros 
select * from public.estudiantes e limit 5;

-- Limitar los registros saltando los dos primeros
select * from public.estudiantes e limit 5 offset 2;


--- Crear una tabla con llave foranea
create table ciudad (
id bigserial primary key not null,
nombre varchar(60) not null,
id_estudiantes integer,
constraint fk_estudiantes
	foreign key (id_estudiantes)
	references estudiantes(id)
	on delete cascade
)


-- Utilizando inner join 
select e.nombre, e.apellido, e.batch, c.nombre
from public.estudiantes e 
inner join public.ciudad c on c.id_estudiantes = e.id ;


select e.nombre, e.apellido, e.batch, c.nombre
from public.estudiantes e, public.ciudad c
where e.id = c.id_estudiantes;

