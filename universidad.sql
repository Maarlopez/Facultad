show databases;
use facultad;

select * from ciudad;
insert into ciudad 
values 
    ('1','Avellaneda'),
    ('2','Quilmes'),
    ('3','Bernal'),
    ('4','Berazategui'),
    ('5','Ezpeleta'),
    ('6','Florencio varela'),
    ('7','San Francisco Solano');
    
select * from persona;
insert into persona (id_Dni,nombre,apellido,ciudad_id_ciudad)
values
	('40000001','Ana','Lopez','2'),
    ('40000002','Juan','Perez','2'),
    ('40000003','Estefanía','Gonzalez','3'),
    ('40000004','Andrea','Cruz','1'),
    ('40000005','Carlos','Gomez','7'),
    ('40000006','Carolina','Torres','6'),
    ('40000007','Daniel','Hernandez','4'),
    ('40000008','Daniela','Guzman','4'),
	('40000009','Nicolas','Olmedo','4'),
    ('41000001','Gabriel','Guerrero','3'),
    ('41000002','Analía','Mendes','2'),
    ('41000003','María','Agüero','2'),
    ('41000004','Belen','Benegas','1'),
    ('41000005','Ludmila','Juarez','7'),
    ('41000006','Amalia','Benitez','6'),
    ('41000007','Cecilia','Gutierrez','4'),
    ('41000008','Javier','Lopez','4'),
    ('41000009','Camila','Martinez','4');
    
insert into persona (id_Dni,nombre,apellido,ciudad_id_ciudad)
values
	('40000010','Casandra','Suarez','5');
select * from titulo;
insert into titulo (id_titulo,nombre_titulo)
values
	('1','Ing. en Informática'),
    ('2','Ing. en Sistemas'),
    ('3','Analista en Sistemas'),
    ('4','Lic. en Enfermería'),
    ('5','Fisioterapeuta'),
    ('6','Doctorado en Ciencias Económicas'),
    ('7','Lic. en Sociología'),
    ('8','Lic. en Derecho');

select * from departamento;
insert into departamento (id_departamento,nombre_Dep)
values
	('1','Instituto de Ingeniería y Agronomía'),
    ('2','Instituto de Ciencias de la Salud'),
    ('3','Instituto de Ciencias Sociales y Administración');
    
select * from materia;
insert into materia (id_materia,nom_materia,año_en_plan)
values
	('1','Base de Datos 2','4'),
    ('2','Salud Pública','2'),
    ('3','Política y Sociedad','2');
    
select * from profesor;
insert into profesor (id_profesor,cuil,persona_id_Dni,departamento_id_departamento,persona_ciudad_id_ciudad)
values
    ('1','20400000010','40000001','1','2'),
    ('2','20400000021','40000002','1','2'),
    ('3','20400000032','40000003','1','3'),
    ('4','20400000043','40000004','2','1'),
    ('5','20400000054','40000005','2','7'),
    ('6','20400000065','40000006','2','6'),
    ('7','20400000076','40000007','3','4'),
    ('8','20400000087','40000008','3','4'),
    ('9','20400000098','40000009','3','4');

select * from estudiante;
insert into estudiante (id_estudiante,legajo,persona_id_Dni,ciudad_id_ciudad,ciudad_res)
values
	('1','10001','41000001','3','2'),
    ('2','10002','41000002','2','1'),
    ('3','10003','41000003','2','3'),
    ('4','10004','41000004','1','1'),
    ('5','10005','41000005','7','7'),
    ('6','10006','41000006','6','6'),
    ('7','10007','41000007','4','4'),
    ('8','10008','41000008','4','2'),
    ('9','10009','41000009','4','6');
    

select * from telefono;
insert into telefono (id_telefono,numero_tel,tipo,persona_id_Dni)
values
	('011','42100011','Fijo','40000001'),
    ('011','42100012','Fijo','40000002'),
    ('011','42100013','Fijo','40000003'),
    ('011','42100014','Fijo','40000004'),
    ('011','42100015','Fijo','40000005'),
    ('011','42100016','Fijo','40000006'),
    ('011','42100017','Fijo','40000007'),
    ('011','42100018','Fijo','40000008'),
    ('011','42100019','Fijo','40000009'),
    ('011','62952201','Movil','41000001'),
    ('011','62952202','Movil','41000002'),
    ('011','62952203','Movil','41000003'),
    ('011','62952204','Movil','41000004'),
    ('011','62952205','Movil','41000005'),
    ('011','62952206','Movil','41000006'),
    ('011','62952207','Movil','41000007'),
    ('011','62952208','Movil','41000008'),
    ('011','62952209','Movil','41000009');
    
select * from profesor_has_materia;
insert into profesor_has_materia (profesor_id_profesor,profesor_persona_id_Dni,profesor_departamento_id_departamento,materia_id_materia)
values
	('1','40000001','1','1'),
    ('2','40000002','1','1'),
    ('3','40000003','1','1'),
    ('4','40000004','2','2'),
    ('5','40000005','2','2'),
    ('6','40000006','2','2'),
    ('7','40000007','3','3'),
    ('8','40000008','3','3'),
    ('9','40000009','3','3');

select * from estudiante_has_materia;
insert into estudiante_has_materia (id_estudiante_materia,estudiante_id_estudiante,materia_id_materia,nota,año_en_curso)
values
	/*primera materia*/
	('1','1','1',null,'2021'),
    ('2','2','1',null,'2021'),
    ('3','3','1',null,'2021'),
    ('4','4','1','9','2016'),
    ('5','5','1','2','2015'),
    ('6','6','1','5','2015'),
    ('7','7','1','6','2018'),
    ('8','8','1','8','2020'),
    ('9','9','1','5','2016'), 
    ('10','1','2',null,'2021'), /*segunda materia*/
    ('11','2','2',null,'2021'),
    ('12','3','2',null,'2021'),
    ('13','4','2','7','2016'),
    ('14','5','2','2','2015'),
    ('15','6','2','5','2015'),
    ('16','1','3',null,'2021'), /*tercera materia*/
    ('17','2','3',null,'2021'),
    ('18','3','3',null,'2021');

update estudiante_has_materia
set nota='1'
where estudiante_id_estudiante='4';

update estudiante
set ciudad_res='Florencio Varela'
where id_estudiante='7';

select * from estudiante_has_materia;



/*----------------------------- AGREGAR COLUMNAS ------------------------------*/

#1.	Cantidad de ciudadanos residentes y cantidad de ciudadanos nacidos en la tabla ciudades.
alter table ciudad
add cant_nac integer not null,
add cant_res integer not null;

#1.	Al momento de insertar una nueva persona, que se actualicé automáticamente el valor de la cantidad de 
# ciudadanos nacidos incrementándose en 1 el valor de la ciudad correspondiente a la persona que se insertó.


#2.	Cantidad de personas que trabajan en cada departamento en la tabla de departamentos.
alter table departamento
add cant_empleados integer not null;

#3.	Cantidad de profesores que dictan la materia en la tabla profesor_has_materia.
alter table profesor_has_materia
add  cant_prof integer not null;

#4.	Cantidad de alumnos que cursan la materia, que aprobaron la materia y que desaprobaron la materia en la tabla estudiante_has_materia.
alter table estudiante_has_materia
add  cant_alum integer not null,
add  cant_aprob integer not null,
add  cant_des integer not null;

select * from ciudad;

