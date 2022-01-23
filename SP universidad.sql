show databases;
use universidad;

CREATE procedure ciudad_consulta()
select * from ciudad;

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

CREATE procedure profesor_has_titulo_consulta()
select * from profesor_has_titulo;

CREATE procedure telefono_consulta()
select * from telefono;

#2a.	Listar todos los profesores de un departamento puntual.
CREATE procedure profesores_dep()
select phm.profesor_persona_id_Dni, d.nombre_Dep, d.id_departamento from departamento as d
	inner join profesor_has_materia as phm
		on phm.profesor_departamento_id_departamento=d.id_departamento
		where d.nombre_Dep='Instituto de Ingeniería y Agronomía';
        
#2b.	Listar todos los profesores de una materia puntual
CREATE procedure profesores_materia()
select phm.profesor_persona_id_Dni, m.id_materia, m.nom_materia from materia as m
	inner join profesor_has_materia as phm
		on phm.materia_id_materia=m.id_materia
		where m.id_materia='1';
        
#2c. Listar todos los profesores que hayan nacido en una ciudad puntual.
CREATE procedure profesores_ciudad()
select distinct p.cuil, per.nombre, per.apellido, c.nombre from ciudad as c
	inner join persona as per
		on per.ciudad_id_ciudad=c.id_ciudad
	inner join profesor as p
		on p.persona_ciudad_id_ciudad=per.ciudad_id_ciudad
	where p.cuil='20400000010' limit 1;
    
# 3. Listar el nombre de departamento y la cantidad de docentes que posee cada uno. 
CREATE procedure dep_docentes()
select d.nombre_Dep, Count(*) as 'Cantidad' from profesor as p
	inner join departamento as d
		on p.departamento_id_departamento=d.id_departamento
		group by d.id_departamento;

#4.	Listar el nombre de la ciudad y la cantidad de personas que nacieron en ella.
CREATE procedure ciudad_personas()
select c.nombre, Count(*) as 'Cantidad' from persona as p
	inner join ciudad as c
		on p.ciudad_id_ciudad=c.id_ciudad
		where c.nombre='Quilmes';

#5a.	Listar todos los alumnos que cursan actualmente una materia puntual.
CREATE procedure estudiante_mat()
select ehm.id_estudiante_materia as 'idLegajo', m.id_materia, m.nom_materia  from materia as m
	inner join estudiante_has_materia as ehm
		on ehm.materia_id_materia=m.id_materia
		where m.id_materia='1' and ehm.nota is null;
        
#5b.	Listar todos los alumnos que aprobaron una materia puntual.
CREATE procedure estudiante_aprobar()
select ehm.id_estudiante_materia as 'idLegajo', m.id_materia, m.nom_materia, ehm.nota  from materia as m
	inner join estudiante_has_materia as ehm
		on ehm.materia_id_materia=m.id_materia
		where m.id_materia='2' and ehm.nota>=4;

#5c.	Listar todos los alumnos que residen en una ciudad puntual.
alter table estudiante
add ciudad_res varchar(100) not null;
select * from estudiante;

CREATE procedure estudiante_res()
select distinct e.legajo, c.nombre from estudiante as e
	inner join ciudad as c
		on e.ciudad_res=c.nombre
        where c.nombre='Quilmes';

#6.	Listar los datos del alumno con menor nota de materia.
CREATE procedure e_menor_nota()
SELECT estudiante_has_materia.estudiante_id_estudiante, estudiante_has_materia.materia_id_materia, estudiante_has_materia.nota
FROM estudiante_has_materia
WHERE nota= (SELECT MIN(estudiante_has_materia.nota)  FROM estudiante_has_materia);

#7.	Listar los datos del alumno con mayor nota de materia.
CREATE procedure e_mayor_nota()
SELECT estudiante_has_materia.estudiante_idLegajo, estudiante_has_materia.materia_id_materia, estudiante_has_materia.nota
FROM estudiante_has_materia
WHERE nota= (SELECT MAX(estudiante_has_materia.nota)  FROM estudiante_has_materia);

#8.	Listar los datos de la materia y el promedio de las notas de sus alumnos.
CREATE procedure materia_promedio()
select ehm.materia_id_materia, avg(ehm.nota) as promedio
					from estudiante_has_materia as ehm where nota is not null
					group by ehm.materia_id_materia order by avg(ehm.nota) asc;

#9.	Listar los datos de todas las personas (profesores y estudiantes) en una misma consulta.
CREATE procedure alum_prof()
select * from persona;


/*----------------------------- TRIGGERS ------------------------------*/

#1.	Al momento de insertar una nueva persona, que se actualicé automáticamente el valor de la cantidad de 
# ciudadanos nacidos incrementándose en 1 el valor de la ciudad correspondiente a la persona que se insertó.
CREATE TRIGGER ciudadanosNac_AI 
AFTER INSERT ON persona
FOR EACH ROW
	UPDATE ciudad
    SET ciudad.cant_nac = ciudad.cant_nac + 1 
    where ciudad.id_ciudad = new.ciudad_id_ciudad;
    
#2. Al momento de eliminar una persona, que se actualicé automáticamente 
 # el valor de la cantidad de ciudadanos nacidos decrementándose en 1 el valor de la ciudad correspondiente a la persona que se eliminó.
 
CREATE TRIGGER ciudadanosNac_AD
AFTER DELETE ON persona
FOR EACH ROW
	UPDATE ciudad
    SET ciudad.cant_nac = ciudad.cant_nac - 1 
    where ciudad.id_ciudad = old.ciudad_id_ciudad;
    
#3.	Al momento de insertar un nuevo estudiante, que se actualicé automáticamente 
# el valor de la cantidad de ciudadanos residentes incrementándose en 1 el valor de la ciudad correspondiente al estudiante que se insertó.

CREATE TRIGGER ciudadanosRes_AI 
AFTER INSERT ON estudiante
FOR EACH ROW
	UPDATE ciudad
    SET ciudad.cant_res = ciudad.cant_res + 1
    where ciudad.id_ciudad = new.ciudad_id_ciudad;
    
# 4. Al momento de eliminar un nuevo estudiante, que se actualicé automáticamente
# el valor de la cantidad de ciudadanos residentes decrementándose en 1 el valor de la ciudad correspondiente al estudiante que se eliminó.

CREATE TRIGGER ciudadanosRes_AD 
AFTER DELETE ON estudiante
FOR EACH ROW
	UPDATE ciudad
    SET cant_res = cant_res - 1
    where ciudad.id_ciudad = old.ciudad_id_ciudad;
    
# 5. Al momento de insertar un nuevo profesor, que se actualicé automáticamente el valor de la cantidad de profesores 
# en ese departamento incrementándose en 1 el valor del departamento correspondiente al profesor que se insertó.

CREATE TRIGGER cantProfesores_AI
AFTER INSERT ON profesor
FOR EACH ROW
	UPDATE departamento
    SET departamento.cant_empleados = departamento.cant_empleados + 1
    where departamento.id_departamento = new.departamento_id_departamento;

# 6. Al momento de eliminar un nuevo profesor, que se actualicé automáticamente el valor de la cantidad de profesores 
# en ese departamento decrementándose en 1 el valor del departamento correspondiente al profesor que se insertó.

CREATE TRIGGER cantProfesores_AD
AFTER DELETE ON profesor
FOR EACH ROW
	UPDATE departamento
    SET departamento.cant_empleados = departamento.cant_empleados - 1
    where departamento.id_departamento = old.departamento_id_departamento;
    
#7.	Al momento de insertar un nuevo profesor que dicta una materia, que se actualicé automáticamente el valor de la cantidad 
#de profesores que dictan esa materia incrementándose en 1 el valor de la materia correspondiente al profesor que se insertó.

CREATE TRIGGER comision_AI
AFTER INSERT ON profesor_has_materia
FOR EACH ROW
	UPDATE profesor_has_materia
    SET profesor_has_materia.cant_prof = profesor_has_materia.cant_prof + 1;
    
#8.	Al momento de eliminar un profesor que dicta una materia, que se actualicé automáticamente el valor de la cantidad de profesores
# que dictan esa materia decrementándose en 1 el valor de la materia correspondiente al profesor que se eliminó.

CREATE TRIGGER comision_AI
AFTER INSERT ON profesor_has_materia
FOR EACH ROW
	UPDATE profesor_has_materia
    SET profesor_has_materia.cant_prof = profesor_has_materia.cant_prof - 1;
    
# 9. Al momento de anotar un estudiante en una materia, que se actualicé automáticamente el valor de la cantidad de inscriptos 
# a esa materia incrementándose en 1 el valor de la cantidad de estudiantes a la materia correspondiente al estudiante que se insertó. 

CREATE TRIGGER matricula_AI
AFTER INSERT ON estudiante_has_materia
FOR EACH ROW
	UPDATE estudiante_has_materia
    SET estudiante_has_materia.cant_alum = estudiante_has_materia.cant_alum + 1;

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

#12.	Al momento de actualizar la nota de un estudiante que ya existía, que se actualicé automáticamente el valor de la cantidad 
#de aprobados o desaprobados según corresponda a esa materia.

CREATE TRIGGER estudiantesActualizados_AU
AFTER UPDATE ON estudiante_has_materia
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
