########################
##### MySQL2 -Dia5 #####
########################

USE `MySQL2_dia5`;

-- Trigger para insertar o actualizar una ciudad en pais con la nueva poblacion
delimiter //
create trigger after_city_insert_update
after insert on city
for each row
begin
	update country 
    set Population = Population + NEW.Population
    where code = NEW.CountryCode;
end //
delimiter ;

-- Test
insert into city (Name,CountryCode,District,Population)
values ("Artemis","AFG","Piso 6",1250000);

-- Trigger para eliminar
delimiter //
create trigger after_city_delete
after delete on city
for each row
begin
	update country 
    set Population = Population - OLD.Population
    where code = OLD.CountryCode;
end //
delimiter ;

delete from city where ID=4080;

select * from country;
select * from city where name = "Artemis";

-- Crear una tabla para auditoria de ciudad

Create table if not exists  city_audit(
	audit_id int auto_increment primary key,
    city_id int,
    action Varchar(10),
    old_population int,
    new_population int,
    change_time timestamp default current_timestamp
);

-- Trigger para auditoria de ciudades
delimiter //
create trigger after_city_insert_audit
after insert on city
for each row
begin
	insert into city_audit(city_id,action,new_population)
    values (NEW.ID,'INSERT',NEW.Population);
end //
delimiter ;

-- Test
select * from city_audit;
insert into city (Name,CountryCode,District,Population)
values ("Artemis","AFG","Piso 6",1250000);

-- Trigger para auditoria de ciudades
delimiter //
create trigger after_city_update_audit
after update on city
for each row
begin
	insert into city_audit(city_id,action,old_population,new_population)
    values (OLD.ID,'UPDATE',OLD.Population,NEW.Population);
end //
delimiter ;

-- Test
update city
set Population = 1500000 where ID=4081;
select * from city_audit;

-- Eventos
-- Creacion de tabla para BK de ciudades
create table if not exists city_backup(
	ID int not null,
    Name char(35) not null,
    CountryCode char(3) not null,
    District char(20) not null,
    Population int not null,
    primary key (ID)
) ENGINE=InnoDB default charset=utf8mb4;

delimiter //
create event if not exists weekly_city_backup
on schedule every 1 week
Do
begin
	truncate table city_backup;
    insert into city_backup(ID,Name,CountryCode,District,Population)
    select ID,Name,CountryCode,District,Population from city;
end //
delimiter ;


