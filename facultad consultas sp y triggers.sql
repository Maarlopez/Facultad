show databases;
use facultad;

insert into ciudad 
values 
    ('Ezpeleta','Quilmes',null,null);
    
insert into persona (Nombre,Apellido,idDni,ciudad_idCiudadNac,ciudad_idCiudadRes)
values
	('Casandra','Valencia','41000010','Ezpeleta','Quilmes');