show databases;
use facultad;

/*--------------------------------------------------------*/

#1b i) Listar todos los profesores de un departamento puntual
/*select * from profesor where departamento_NombreDep='Instituto de Ingeniería y Agronomía';*/
select p.idCuil, d.NombreDep, d.idIniciales from departamento as d
	inner join profesor as p
		on p.departamento_NombreDep=d.NombreDep
		where d.NombreDep='Instituto de Ingeniería y Agronomía';

#1b ii) Listar todos los profesores de una materia puntual
select p.idCuil, phm.materia_id_materia from profesor as p
	inner join profesor_has_materia as phm
		on p.idCuil=phm.profesor_idCuil
		where phm.materia_id_materia='1';
        
#1b iii) Listar todos los profesores de una ciudad puntual
select distinct p.idCuil, per.Nombre, per.Apellido, c.idCiudadNac from ciudad as c
	inner join persona as per
		on per.ciudad_idCiudadNac=c.idCiudadNac
	inner join profesor as p
		on p.persona_ciudad_idCiudadNac=per.ciudad_idCiudadNac
	where p.idCuil='20400000010';

# 1c) Listar el nombre de departamento y la cantidad de docentes que posee cada uno. 
select d.NombreDep, Count(*) as 'Cantidad' from profesor as p
	inner join departamento as d
		on p.departamento_NombreDep=d.NombreDep
		group by d.NombreDep;

#Listar el nombre de los departamentos que poseen 3 o más profesores . 
/*select d.NombreDep, Count(*) as 'Cantidad' from profesor as p
	inner join departamento as d
		on p.departamento_NombreDep=d.NombreDep
		group by d.NombreDep having Count(*) >=3;*/

# 1d) Listar el nombre de la ciudad y la cantidad de personas que nacieron en ella
select d.NombreDep, Count(*) as 'Cantidad' from profesor as p
	inner join departamento as d
		on p.departamento_NombreDep=d.NombreDep
		where d.NombreDep='Instituto de Ingeniería y Agronomía';

# 1e i) Listar todos los alumnos que cursan actualmente una materia puntual.
select ehm.estudiante_idLegajo as 'idLegajo', m.id_materia, m.NomMateria  from materia as m
	inner join estudiante_has_materia as ehm
		on ehm.materia_id_materia=m.id_materia
		where m.id_materia='2' and ehm.nota is null;
    
# 1e ii) Listar todos los alumnos que aprobaron una materia puntual.
select ehm.estudiante_idLegajo as 'idLegajo', m.id_materia, m.NomMateria, ehm.nota  from materia as m
	inner join estudiante_has_materia as ehm
		on ehm.materia_id_materia=m.id_materia
		where m.id_materia='2' and ehm.nota>=4;
        
# 1e iii) Listar todos los alumnos que residen en una ciudad puntual
select distinct e.idLegajo, c.idCiudadNac from estudiante as e
	inner join ciudad as c
		on e.persona_ciudad_idCiudadNac=c.idCiudadNac
        where c.idCiudadNac='Quilmes';
    
# 1f) Listar los datos del alumno con menor nota de materia.
select * from persona;
select * from estudiante;
select * from estudiante_has_materia;
    
/*select * from estudiante
	where idLegajo= (select ehm.estudiante_idLegajo 
					from estudiante_has_materia as ehm where nota is not null
					group by ehm.materia_id_materia order by min(ehm.nota) asc
                    limit 1);*/
SELECT estudiante_has_materia.estudiante_idLegajo, estudiante_has_materia.materia_id_materia, estudiante_has_materia.nota
FROM estudiante_has_materia
WHERE nota= (SELECT MIN(estudiante_has_materia.nota)  FROM estudiante_has_materia);


# 1g) Listar los datos del alumno con mayor nota de materia.
select * from estudiante
	where idLegajo= (select ehm.estudiante_idLegajo 
					from estudiante_has_materia as ehm where nota is not null
					group by ehm.materia_id_materia order by max(ehm.nota) asc
                    limit 1);

SELECT estudiante_has_materia.estudiante_idLegajo, estudiante_has_materia.materia_id_materia, estudiante_has_materia.nota
FROM estudiante_has_materia
WHERE nota= (SELECT MAX(estudiante_has_materia.nota)  FROM estudiante_has_materia);
                    
# 1h) Listar los datos de la materia y el promedio de las notas de sus alumnos.
select ehm.materia_id_materia, avg(ehm.nota) as promedio
					from estudiante_has_materia as ehm where nota is not null
					group by ehm.materia_id_materia order by avg(ehm.nota) asc;
					


# 1i) Listar los datos de todas las personas (profesores y estudiantes) en una misma consulta.
select * from persona;
/*----------------------------------------INSERTS, UPDATES Y DELETES------------------------------------------------------*/
UPDATE estudiante_has_materia
set nota='10' where estudiante_idLegajo='10003' and materia_id_materia=3;

#AGREGO VINCULO DE LOS ESTUDIANTES CON LAS MATERIAS FALTANTES
insert into estudiante_has_materia (estudiante_idLegajo,materia_id_materia,nota,año_en_curso)
values

    ('10004','3','3','2020'),
	('10005','3','9','2020'),
    ('10006','3','7','2020'),
    ('10007','2','5','2019'),
    ('10007','3','10','2020'),
    ('10008','2','8','2019'),
    ('10008','3','8','2020'),
    ('10009','2','4','2019'),
    ('10009','3','6','2020');
update ciudad
	set idCiudadNac='Almirante Brown' where idCiudadNac='Quilmes';
    
update contacto
	set Telefono='42100111' where persona_idDni='40000001';

select * from departamento;
update departamento
	set NombreDep='Instituto de Ingeniería' where idIniciales='IIyA';
    
select * from estudiante;
update estudiante
	set idLegajo='20001' where persona_idDni='41000001';
    
select * from estudiante_has_materia;
update estudiante_has_materia
	set nota='8' where estudiante_idLegajo='20001' and materia_id_materia='1';
    
select * from profesor_has_materia;
update profesor_has_materia
	set materia_id_materia='3' where profesor_idCuil='20400000011';
    
select * from materia;
update materia
	set id_materia='1' where NomMateria='Base de Datos 2';
    
select * from persona;
update persona
	set Nombre='Paula' where idDni='40000001';
    
select * from profesor;
update profesor
	set idCuil='20400000011' where persona_idDni='40000001';

select * from titulo;
update titulo
	set id_titulo='Ing. Industrial' where id_titulo='Analista en Sistemas';


/*---------*/
delete from ciudad where idCiudadNac='San Francisco Solano';

delete from contacto where Telefono='42100011';

delete from departamento where NombreDep='Instituto de Ingeniería';

delete from estudiante where idLegajo='20001';

delete from estudiante_has_materia where estudiante_idLegajo='20001';

delete from profesor_has_materia where materia_id_materia='3';

delete from materia where id_materia='1';

delete from persona where idDni='40000001';

delete from profesor where idCuil='20400000011';

delete from titulo where id_titulo='Ing. Industrial';

