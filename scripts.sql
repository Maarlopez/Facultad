show databases;
use facultad;

select * from ciudad;
insert into ciudad 
values 
    ('Avellaneda','Avellaneda'),
    ('Avellaneda','Quilmes'),
    ('Bernal','Bernal'),
	('Bernal','Quilmes'),
    ('Berazategui','Berazategui'),
    ('Berazategui','Ezpeleta'),
    ('Berazategui','Quilmes'),
    ('Berazategui','Florencio varela'),
    ('Florencio varela','Bernal'),
    ('Florencio varela','Florencio varela'),
    ('Quilmes','Bernal'),
    ('Quilmes','Quilmes'),
	('Quilmes','Avellaneda'),
    ('San Francisco Solano','San Francisco Solano'),
	('San Francisco Solano','Quilmes');
    
/*insert into ciudad 
values 
    ('Ezpeleta','Quilmes',null,null);*/
    
insert into persona (Nombre,Apellido,idDni,ciudad_idCiudadNac,ciudad_idCiudadRes)
values
	('Ana','Lopez','40000001','Quilmes','Quilmes'),
    ('Juan','Perez','40000002','Quilmes','Avellaneda'),
    ('Estefanía','Gonzalez','40000003','Bernal','Bernal'),
    ('Andrea','Cruz','40000004','Avellaneda','Avellaneda'),
    ('Carlos','Gomez','40000005','San Francisco Solano','San Francisco Solano'),
    ('Carolina','Torres','40000006','Florencio varela','Florencio varela'),
    ('Daniel','Hernandez','40000007','Berazategui','Berazategui'),
    ('Daniela','Guzman','40000008','Berazategui','Quilmes'),
	('Nicolas','Olmedo','40000009','Berazategui','Florencio varela'),
    ('Gabriel','Guerrero','41000001','Bernal','Quilmes'),
    ('Analía','Mendes','41000002','Quilmes','Avellaneda'),
    ('María','Agüero','41000003','Quilmes','Bernal'),
    ('Belen','Benegas','41000004','Avellaneda','Quilmes'),
    ('Ludmila','Juarez','41000005','San Francisco Solano','Quilmes'),
    ('Amalia','Benitez','41000006','Florencio varela','Bernal'),
    ('Cecilia','Gutierrez','41000007','Berazategui','Florencio varela'),
    ('Javier','Lopez','41000008','Berazategui','Quilmes'),
    ('Camila','Martinez','41000009','Berazategui','Ezpeleta');
    
/*insert into persona (Nombre,Apellido,idDni,ciudad_idCiudadNac,ciudad_idCiudadRes)
values
	('Casandra','Valencia','41000010','Ezpeleta','Quilmes');*/
    
insert into titulo (id_titulo)
values
	('Ing. en Informática'),
    ('Ing. en Sistemas'),
    ('Analista en Sistemas'),
    ('Lic. en Enfermería'),
    ('Fisioterapeuta'),
    ('Doctorado en Ciencias Económicas'),
    ('Lic. en Sociología'),
    ('Lic. en Derecho');

insert into departamento (idIniciales,NombreDep)
values
	('IIyA','Instituto de Ingeniería y Agronomía'),
    ('ICS','Instituto de Ciencias de la Salud'),
    ('ICSyA','Instituto de Ciencias Sociales y Administración');
    
insert into materia (id_materia,NomMateria,año_en_plan)
values
	('1','Base de Datos 2','4'),
    ('2','Salud Pública','2'),
    ('3','Política y Sociedad','2');

insert into profesor (idCuil,persona_idDni,titulo_id_titulo,departamento_NombreDep,persona_ciudad_idCiudadNac)
values
    ('20400000010','40000001','Ing. en Informática','Instituto de Ingeniería y Agronomía','Quilmes'),
    ('20400000021','40000002','Ing. en Sistemas','Instituto de Ingeniería y Agronomía','Quilmes'),
    ('20400000032','40000003','Analista en Sistemas','Instituto de Ingeniería y Agronomía','Bernal'),
    ('20400000043','40000004','Lic. en Enfermería','Instituto de Ciencias de la Salud','Avellaneda'),
    ('20400000054','40000005','Fisioterapeuta','Instituto de Ciencias de la Salud','San Francisco Solano'),
    ('20400000065','40000006','Lic. en Enfermería','Instituto de Ciencias de la Salud','Florencio varela'),
    ('20400000076','40000007','Doctorado en Ciencias Económicas','Instituto de Ciencias Sociales y Administración','Berazategui'),
    ('20400000087','40000008','Lic. En Sociología','Instituto de Ciencias Sociales y Administración','Berazategui'),
    ('20400000098','40000009','Lic. En Derecho','Instituto de Ciencias Sociales y Administración','Berazategui');

insert into estudiante (idLegajo,persona_idDni,persona_ciudad_idCiudadNac,persona_ciudad_idCiudadRes)
values
	('10001','41000001','Bernal','Quilmes'),
    ('10002','41000002','Quilmes','Avellaneda'),
    ('10003','41000003','Quilmes','Bernal'),
    ('10004','41000004','Avellaneda','Quilmes'),
    ('10005','41000005','San Francisco Solano','Quilmes'),
    ('10006','41000006','Florencio varela','Bernal'),
    ('10007','41000007','Berazategui','Florencio varela'),
    ('10008','41000008','Berazategui','Quilmes'),
    ('10009','41000009','Berazategui','Ezpeleta');

insert into contacto (Cod_Area,Telefono,Tipo,persona_idDni)
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

insert into profesor_has_materia (profesor_idCuil,materia_id_materia)
values
	('20400000010','1'),
    ('20400000021','1'),
    ('20400000032','1'),
    ('20400000043','2'),
    ('20400000054','2'),
    ('20400000065','2'),
    ('20400000076','3'),
    ('20400000087','3'),
    ('20400000098','3');

insert into estudiante_has_materia (estudiante_idLegajo,materia_id_materia,nota,año_en_curso)
values
	/*primera materia*/
	('10001','1',null,'2021'),
    ('10002','1',null,'2021'),
    ('10003','1',null,'2021'),
    ('10004','1','9','2016'),
    ('10005','1','2','2015'),
    ('10006','1','5','2015'),
    ('10007','1','6','2018'),
    ('10008','1','8','2020'),
    ('10009','1','5','2016'), 
    ('10001','2',null,'2021'), /*segunda materia*/
    ('10002','2',null,'2021'),
    ('10003','2',null,'2021'),
    ('10004','2','7','2016'),
    ('10005','2','2','2015'),
    ('10006','2','5','2015'),
    ('10001','3',null,'2021'), /*tercera materia*/
    ('10002','3',null,'2021'),
    ('10003','3',null,'2021');

/*--------------------- STORED PROCEDURES -------------------*/

CREATE procedure ciudad_consulta()
select * from ciudad;

CREATE procedure contacto_consulta()
select * from contacto;

CREATE procedure departamento_consulta()
select * from departamento;

CREATE procedure estudiante_consulta()
select * from estudiante;

CREATE procedure estudiante_has_materia_consulta()
select * from estudiante_has_materia;

CREATE procedure materia_consulta()
select * from materia;

CREATE procedure persona_consulta()
select * from persona;

CREATE procedure profesor_consulta()
select * from profesor;

CREATE procedure profesor_has_materia_consulta()
select * from profesor_has_materia;

CREATE procedure titulo_consulta()
select * from titulo;

CREATE procedure profesores_dep()
select p.idCuil, d.NombreDep, d.idIniciales from departamento as d
	inner join profesor as p
		on p.departamento_NombreDep=d.NombreDep
		where d.NombreDep='Instituto de Ingeniería y Agronomía';

CREATE procedure profesores_materia()
select p.idCuil, phm.materia_id_materia from profesor as p
	inner join profesor_has_materia as phm
		on p.idCuil=phm.profesor_idCuil
		where phm.materia_id_materia='1';

CREATE procedure profesores_ciudad()
select distinct p.idCuil, per.Nombre, per.Apellido, c.idCiudadNac from ciudad as c
	inner join persona as per
		on per.ciudad_idCiudadNac=c.idCiudadNac
	inner join profesor as p
		on p.persona_ciudad_idCiudadNac=per.ciudad_idCiudadNac
	where p.idCuil='20400000010';

CREATE procedure dep_docentes()
select d.NombreDep, Count(*) as 'Cantidad' from profesor as p
	inner join departamento as d
		on p.departamento_NombreDep=d.NombreDep
		group by d.NombreDep;

CREATE procedure ciudad_personas()
select d.NombreDep, Count(*) as 'Cantidad' from profesor as p
	inner join departamento as d
		on p.departamento_NombreDep=d.NombreDep
		where d.NombreDep='Instituto de Ingeniería y Agronomía';

CREATE procedure estudiante_mat()
select ehm.estudiante_idLegajo as 'idLegajo', m.id_materia, m.NomMateria  from materia as m
	inner join estudiante_has_materia as ehm
		on ehm.materia_id_materia=m.id_materia
		where m.id_materia='2' and ehm.nota is null;

CREATE procedure estudiante_aprobar()
select ehm.estudiante_idLegajo as 'idLegajo', m.id_materia, m.NomMateria, ehm.nota  from materia as m
	inner join estudiante_has_materia as ehm
		on ehm.materia_id_materia=m.id_materia
		where m.id_materia='2' and ehm.nota>=4;
        
CREATE procedure estudiante_res()
select distinct e.idLegajo, c.idCiudadNac from estudiante as e
	inner join ciudad as c
		on e.persona_ciudad_idCiudadNac=c.idCiudadNac
        where c.idCiudadNac='Quilmes';

CREATE procedure e_menor_nota()
SELECT estudiante_has_materia.estudiante_idLegajo, estudiante_has_materia.materia_id_materia, estudiante_has_materia.nota
FROM estudiante_has_materia
WHERE nota= (SELECT MIN(estudiante_has_materia.nota)  FROM estudiante_has_materia);

CREATE procedure e_mayor_nota()
SELECT estudiante_has_materia.estudiante_idLegajo, estudiante_has_materia.materia_id_materia, estudiante_has_materia.nota
FROM estudiante_has_materia
WHERE nota= (SELECT MAX(estudiante_has_materia.nota)  FROM estudiante_has_materia);

CREATE procedure materia_promedio()
select ehm.materia_id_materia, avg(ehm.nota) as promedio
					from estudiante_has_materia as ehm where nota is not null
					group by ehm.materia_id_materia order by avg(ehm.nota) asc;

CREATE procedure alum_prof()
select * from persona;

/*----------------------------- AGREGAR COLUMNAS ------------------------------*/

#1.	Cantidad de ciudadanos residentes y cantidad de ciudadanos nacidos en la tabla ciudades.
alter table ciudad
add cant_nac integer,
add cant_res integer;

#2.	Cantidad de personas que trabajan en cada departamento en la tabla de departamentos.
alter table departamento
add cant_empleados integer;

#3.	Cantidad de profesores que dictan la materia en la tabla profesor_has_materia.
alter table profesor_has_materia
add  cant_prof integer;

#4.	Cantidad de alumnos que cursan la materia, que aprobaron la materia y que desaprobaron la materia en la tabla estudiante_has_materia.
alter table estudiante_has_materia
add  cant_alum integer,
add  cant_aprob integer,
add  cant_des integer;

/*----------------------------- TRIGGERS ------------------------------*/

#1.	Al momento de insertar una nueva persona, que se actualicé automáticamente el valor de la cantidad de 
# ciudadanos nacidos incrementándose en 1 el valor de la ciudad correspondiente a la persona que se insertó.

CREATE TRIGGER ciudadanosNac_AI 
AFTER INSERT ON persona
FOR EACH ROW
	UPDATE ciudad
    SET cant_nac = cant_nac + 1 
    where ciudad.idCiudadNac = new.ciudad_idCiudadNac;

 
 #2. Al momento de eliminar una persona, que se actualicé automáticamente 
 # el valor de la cantidad de ciudadanos nacidos decrementándose en 1 el valor de la ciudad correspondiente a la persona que se eliminó.
 
CREATE TRIGGER ciudadanosNac_AD
AFTER DELETE ON persona
FOR EACH ROW
	UPDATE ciudad
    SET cant_nac = cant_nac - 1 and ciudad.idCiudadNac = idCiudadNac.cant_nac - 1;
    
#3.	Al momento de insertar un nuevo estudiante, que se actualicé automáticamente 
# el valor de la cantidad de ciudadanos residentes incrementándose en 1 el valor de la ciudad correspondiente al estudiante que se insertó.

/*CREATE TRIGGER ciudadanosRes_AI 
AFTER INSERT ON persona
FOR EACH ROW
	UPDATE ciudad
    SET cant_res = cant_res + 1;*/
    
CREATE TRIGGER ciudadanosRes_AI
AFTER INSERT ON persona
FOR EACH ROW
	UPDATE ciudad
    SET cant_res = cant_res + 1 and ciudad.idCiudadRes = idCiudadRes.cant_res + 1;
    
# 4. Al momento de eliminar un nuevo estudiante, que se actualicé automáticamente
# el valor de la cantidad de ciudadanos residentes decrementándose en 1 el valor de la ciudad correspondiente al estudiante que se eliminó.

/*/CREATE TRIGGER ciudadanosRes_AD
AFTER DELETE ON persona
FOR EACH ROW
	UPDATE ciudad
    SET cant_res = cant_res - 1;*/
    
CREATE TRIGGER ciudadanosRes_AD
AFTER DELETE ON persona
FOR EACH ROW
	UPDATE ciudad
    SET cant_res = cant_res - 1 and ciudad.idCiudadRes = idCiudadRes.cant_res - 1;
    
# 5. Al momento de insertar un nuevo profesor, que se actualicé automáticamente el valor de la cantidad de profesores 
# en ese departamento incrementándose en 1 el valor del departamento correspondiente al profesor que se insertó.

/*CREATE TRIGGER cantProfesores_AI
AFTER INSERT ON profesor
FOR EACH ROW
	UPDATE departamento
    SET cant_empleados = cant_empleados + 1;*/

CREATE TRIGGER cantProfesores_AI
AFTER INSERT ON profesor
FOR EACH ROW
	UPDATE departamento
    SET cant_empleados = cant_empleados + 1 and departamento.idCuil = NombreDep.cant_empleados + 1;
    
# 6. Al momento de eliminar un nuevo profesor, que se actualicé automáticamente el valor de la cantidad de profesores 
# en ese departamento decrementándose en 1 el valor del departamento correspondiente al profesor que se insertó.

CREATE TRIGGER cantProfesores_AD
AFTER DELETE ON profesor
FOR EACH ROW
	UPDATE departamento
    SET cant_empleados = cant_empleados - 1;
    
# 7. Al momento de insertar un nuevo profesor que dicta una materia, que se actualicé automáticamente el valor de la cantidad 
# de profesores que dictan esa materia incrementándose en 1 el valor de la materia correspondiente al profesor que se insertó.

CREATE TRIGGER comision_AI
AFTER INSERT ON profesor_has_materia
FOR EACH ROW
	UPDATE profesor_has_materia
    SET cant_prof = cant_prof + 1;
    
#8.	Al momento de eliminar un profesor que dicta una materia, que se actualicé automáticamente el valor de la cantidad de profesores
# que dictan esa materia decrementándose en 1 el valor de la materia correspondiente al profesor que se eliminó.

CREATE TRIGGER comision_AD
AFTER DELETE ON profesor_has_materia
FOR EACH ROW
	/* actualizar profesores en determinada materia del docente que se borro*/

# 9. Al momento de anotar un estudiante en una materia, que se actualicé automáticamente el valor de la cantidad de inscriptos 
# a esa materia incrementándose en 1 el valor de la cantidad de estudiantes a la materia correspondiente al estudiante que se insertó. 

CREATE TRIGGER matricula_AI
AFTER INSERT ON estudiante_has_materia
FOR EACH ROW
	UPDATE estudiante_has_materia
    SET cant_alum = cant_alum + 1;

# 10. Al momento de eliminar un estudiante en una materia, que se actualicé automáticamente el valor de la cantidad de inscriptos 
# a esa materia decrementándose en 1 el valor de inscriptos a la materia correspondiente al estudiante que se eliminó. 

CREATE TRIGGER matricula_AD
AFTER DELETE ON estudiante_has_materia
FOR EACH ROW
	UPDATE estudiante_has_materia
    SET cant_alum = cant_alum - 1;

# 11. Al momento de anotar un estudiante en una materia, NOTA no nula, que se actualice automáticamente 
# el valor de la cantidad de aprobados o desaprobados según corresponda a esa materia. 

DELIMITER $$
CREATE TRIGGER estudiantesAprobYDes_AI
AFTER INSERT ON estudiante_has_materia
FOR EACH ROW
BEGIN
	IF (NEW.estudiante_has_materia.nota > 7) then
	update estudiante_has_materia
    set estudiante_has_materia.cant_aprob = estudiante_has_materia.cant_aprob + 1;
    ELSEIF (NEW.estudiante_has_materia.nota < 7) then
    update estudiante_has_materia
    set estudiante_has_materia.cant_des = estudiante_has_materia.cant_des + 1;
    end if;
END $$
   
# 12. Al momento de actualizar la nota de un estudiante que ya existía, que se actualicé automáticamente el valor
# de la cantidad de aprobados o desaprobados según corresponda a esa materia. (nota < 7 desaprobado)

