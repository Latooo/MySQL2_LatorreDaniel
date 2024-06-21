create database TareaDia2;
use TareaDia2;

CREATE TABLE departamento (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DOUBLE UNSIGNED NOT NULL,
gastos DOUBLE UNSIGNED NOT NULL
); 


CREATE TABLE empleado (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nif VARCHAR(9) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
apellido1 VARCHAR(100) NOT NULL,
apellido2 VARCHAR(100),
id_departamento INT UNSIGNED,
FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);
INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero',
NULL);

-- Consultas Avanzadas (Función y procedimiento)

-- Lista el primer apellido de todos los empleados. (función)

DELIMITER //

CREATE PROCEDURE listar_apellido1_empleados()
BEGIN
    SELECT apellido1 FROM empleado;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL listar_apellido1_empleados();

-- Lista el primer apellido de los empleados eliminando los apellidos que estén
-- repetidos.

DELIMITER // 

CREATE PROCEDURE listar_apellido1_unique()
BEGIN 
	SELECT DISTINCT apellido1 FROM empleado;
END //

DELIMITER ; 

-- Llamado del procedimiento 

CALL listar_apellido1_unique();

-- Lista todas las columnas de la tabla empleado.

DELIMITER //

CREATE PROCEDURE listar_all_empleados()
BEGIN 
	SELECT * FROM empleado;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL listar_all_empleados();

-- Lista el nombre y los apellidos de todos los empleados.

DELIMITER //

CREATE PROCEDURE lista_names_apellidos_employed()
BEGIN 
	SELECT nombre, apellido1, apellido2 FROM empleado;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL lista_names_apellidos_employed(); 

-- Lista el identificador de los departamentos de los empleados que aparecen
-- en la tabla empleado.

DELIMITER //

CREATE PROCEDURE listar_departamentos_employeds()
BEGIN 
	SELECT DISTINCT id_departamento FROM empleado WHERE id_departamento IS NOT NULL;
END //

DELIMITER ; 

-- Llamado del procedimiento 
CALL listar_departamentos_employeds();

-- Lista el identificador de los departamentos de los empleados que aparecen
-- en la tabla empleado, eliminando los identificadores que aparecen repetidos.

DELIMITER //

CREATE PROCEDURE listar_departamentos_unicos()
BEGIN
	SELECT DISTINCT id_departamento FROM empleado WHERE id_departamento IS NOT NULL;
END //

DELIMITER ; 

-- Llamado del procedimiento 

CALL listar_departamentos_unicos();

-- Lista el nombre y apellidos de los empleados en una única columna. 

DELIMITER //

CREATE PROCEDURE listar_nombre_apellidos_onecolumn()
BEGIN 
	SELECT CONCAT(nombre, ' ', apellido1, ' ', IFNULL(apellido2, '')) AS full_name FROM empleado;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL listar_nombre_apellidos_onecolumn();

-- Lista el nombre y apellidos de los empleados en una única columna,
-- convirtiendo todos los caracteres en mayúscula.

DELIMITER //

CREATE PROCEDURE listar_nombre_apellidos_mayus()
BEGIN 
	SELECT UPPER(CONCAT(nombre, ' ', apellido1, ' ', IFNULL(apellido2, ''))) AS full_name_mayus FROM empleado;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL listar_nombre_apellidos_mayus();

-- Lista el nombre y apellidos de los empleados en una única columna,
-- convirtiendo todos los caracteres en minúscula.

DELIMITER //

CREATE PROCEDURE listar_nombre_apellidos_minus()
BEGIN 
	SELECT LOWER(CONCAT(nombre, ' ', apellido1, ' ', IFNULL(apellido2, ''))) AS full_name_minus FROM empleado;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL listar_nombre_apellidos_minus();

-- Lista el identificador de los empleados junto al nif, pero el nif deberá
-- aparecer en dos columnas, una mostrará únicamente los dígitos del nif y la
-- otra la letra.

DELIMITER //

CREATE PROCEDURE listar_id_nif_separado()
BEGIN 
	SELECT id,
			SUBSTRING(nif, 1, LENGTH(nif) - 1)AS nif_digit,
            RIGHT(nif, 1) AS nif_letter
	FROM empleado;
END // 

DELIMITER ;

-- Llamado del procedimiento 

CALL listar_id_nif_separado(); 

-- Lista el nombre de cada departamento y el valor del presupuesto actual del
-- que dispone. Para calcular este dato tendrá que restar al valor del
-- presupuesto inicial (columna presupuesto) los gastos que se han generado
-- (columna gastos). Tenga en cuenta que en algunos casos pueden existir
-- valores negativos. Utilice un alias apropiado para la nueva columna columna
-- que está calculando.

DELIMITER //
CREATE FUNCTION calcular_presupuesto_actual(presupuesto DOUBLE, gastos DOUBLE)
RETURNS DOUBLE
DETERMINISTIC 
BEGIN 
	RETURN presupuesto - gastos;
END // 

DELIMITER ; 

-- Llamado de la función 

SELECT nombre, 
		calcular_presupuesto_actual(presupuesto, gastos) AS presupuesto_actual
FROM departamento;


-- Lista el nombre de los departamentos y el valor del presupuesto actual
-- ordenado de forma ascendente.

-- Llamado del procedimiento 

SELECT nombre, 
		calcular_presupuesto_actual(presupuesto, gastos) AS presupuesto_actual
FROM departamento
ORDER BY presupuesto_actual ASC;

-- Lista el nombre de todos los departamentos ordenados de forma
-- ascendente.

DELIMITER //

CREATE PROCEDURE listar_departamentos_asc()
BEGIN 
	SELECT nombre
    FROM departamento
	ORDER BY nombre ASC;
END //

DELIMITER ;

-- Llamado del procedimiento 

CALL listar_departamentos_asc();

-- Lista el nombre de todos los departamentos ordenados de forma
-- descendente.

DELIMITER //

CREATE PROCEDURE listar_departamentos_desc()
BEGIN 
	SELECT nombre 
	FROM departamento 
	ORDER BY nombre DESC;
END //

DELIMITER ;

-- Llamao del procedimiento 

CALL listar_departamentos_desc();

---------------------------------------------------------------------------------------------------

-- 6. Devuelve el nombre del departamento donde trabaja el empleado 
-- Pepe Ruiz Santana.
DELIMITER //

CREATE FUNCTION obtener_departamento_pepe_ruiz_santana()
RETURNS VARCHAR(100)
BEGIN
    DECLARE depto_nombre VARCHAR(100);
    SELECT d.nombre INTO depto_nombre
    FROM empleado e
    JOIN departamento d ON e.id_departamento = d.id
    WHERE e.nombre = 'Pepe' AND e.apellido1 = 'Ruiz' AND e.apellido2 = 'Santana';
    RETURN depto_nombre;
END //

DELIMITER ;

-- Llamado a la función obtener_departamento_pepe_ruiz_santana
SELECT obtener_departamento_pepe_ruiz_santana() AS departamento_pepe_ruiz_santana;

-- 7. Devuelve un listado con los datos de los empleados que trabajan en el
-- departamento de I+D. Ordena el resultado alfabéticamente.
DELIMITER //

CREATE PROCEDURE listar_empleados_id()
BEGIN
    SELECT e.*
    FROM empleado e
    JOIN departamento d ON e.id_departamento = d.id
    WHERE d.nombre = 'I+D'
    ORDER BY e.nombre, e.apellido1, e.apellido2;
END //

DELIMITER ;

-- Llamado al procedimiento listar_empleados_id
CALL listar_empleados_id();

-- 8. Devuelve un listado con los datos de los empleados que trabajan en el
-- departamento de Sistemas, Contabilidad o I+D. Ordena el resultado
-- alfabéticamente.
DELIMITER //

CREATE PROCEDURE listar_empleados_departamentos_especificos()
BEGIN
    SELECT e.*
    FROM empleado e
    JOIN departamento d ON e.id_departamento = d.id
    WHERE d.nombre IN ('Sistemas', 'Contabilidad', 'I+D')
    ORDER BY e.nombre, e.apellido1, e.apellido2;
END //

DELIMITER ;

-- Llamado al procedimiento listar_empleados_departamentos_especificos
CALL listar_empleados_departamentos_especificos();

-- 9. Devuelve una lista con el nombre de los empleados que tienen los
-- departamentos que no tienen un presupuesto entre 100000 y 200000 euros.
DELIMITER //

CREATE PROCEDURE listar_empleados_departamentos_presupuesto_no_rango()
BEGIN
    SELECT e.nombre, e.apellido1, e.apellido2
    FROM empleado e
    JOIN departamento d ON e.id_departamento = d.id
    WHERE d.presupuesto NOT BETWEEN 100000 AND 200000;
END //

DELIMITER ;

-- Llamado al procedimiento listar_empleados_departamentos_presupuesto_no_rango
CALL listar_empleados_departamentos_presupuesto_no_rango();

-- 10. Devuelve un listado con el nombre de los departamentos donde existe
-- algún empleado cuyo segundo apellido sea NULL. Tenga en cuenta que no
-- debe mostrar nombres de departamentos que estén repetidos.
DELIMITER //

CREATE PROCEDURE listar_departamentos_empleados_sin_apellido2()
BEGIN
    SELECT DISTINCT d.nombre
    FROM departamento d
    JOIN empleado e ON d.id = e.id_departamento
    WHERE e.apellido2 IS NULL;
END //

DELIMITER ;

-- Llamado al procedimiento listar_departamentos_empleados_sin_apellido2
CALL listar_departamentos_empleados_sin_apellido2();


-- Consultas multitabla (Composición externa)


-- 1. Devuelve un listado con todos los empleados junto con los datos de los
-- departamentos donde trabajan. Este listado también debe incluir los
-- empleados que no tienen ningún departamento asociado.
DELIMITER //

CREATE PROCEDURE listar_empleados_departamentos()
BEGIN
    SELECT e.*, d.nombre AS nombre_departamento, d.presupuesto, d.gastos
    FROM empleado e
    LEFT JOIN departamento d ON e.id_departamento = d.id;
END //

DELIMITER ;

-- Llamado al procedimiento listar_empleados_departamentos
CALL listar_empleados_departamentos();

-- 2. Devuelve un listado donde sólo aparezcan aquellos empleados que no
-- tienen ningún departamento asociado.
DELIMITER //

CREATE PROCEDURE listar_empleados_sin_departamento()
BEGIN
    SELECT e.*
    FROM empleado e
    LEFT JOIN departamento d ON e.id_departamento = d.id
    WHERE d.id IS NULL;
END //

DELIMITER ;

-- Llamado al procedimiento listar_empleados_sin_departamento
CALL listar_empleados_sin_departamento();

-- 3. Devuelve un listado donde sólo aparezcan aquellos departamentos que no
-- tienen ningún empleado asociado.
DELIMITER //

CREATE PROCEDURE listar_departamentos_sin_empleados()
BEGIN
    SELECT d.*
    FROM departamento d
    LEFT JOIN empleado e ON d.id = e.id_departamento
    WHERE e.id IS NULL;
END //

DELIMITER ;

-- Llamado al procedimiento listar_departamentos_sin_empleados
CALL listar_departamentos_sin_empleados();

-- 4. Devuelve un listado con todos los empleados junto con los datos de los
-- departamentos donde trabajan. El listado debe incluir los empleados que no
-- tienen ningún departamento asociado y los departamentos que no tienen
-- ningún empleado asociado. Ordene el listado alfabéticamente por el
-- nombre del departamento.
DELIMITER //

CREATE PROCEDURE listar_empleados_departamentos_completo()
BEGIN
    SELECT e.*, d.nombre AS nombre_departamento, d.presupuesto, d.gastos
    FROM empleado e
    LEFT JOIN departamento d ON e.id_departamento = d.id
    UNION
    SELECT e.*, d.nombre AS nombre_departamento, d.presupuesto, d.gastos
    FROM empleado e
    RIGHT JOIN departamento d ON e.id_departamento = d.id
    ORDER BY nombre_departamento;
END //

DELIMITER ;

-- Llamado al procedimiento listar_empleados_departamentos_completo
CALL listar_empleados_departamentos_completo();

-- 5. Devuelve un listado con los empleados que no tienen ningún departamento
-- asociado y los departamentos que no tienen ningún empleado asociado.
-- Ordene el listado alfabéticamente por el nombre del departamento.
DELIMITER //

CREATE PROCEDURE listar_empleados_departamentos_no_asociados()
BEGIN
    SELECT e.*, d.nombre AS nombre_departamento, d.presupuesto, d.gastos
    FROM empleado e
    LEFT JOIN departamento d ON e.id_departamento = d.id
    WHERE d.id IS NULL
    UNION
    SELECT e.*, d.nombre AS nombre_departamento, d.presupuesto, d.gastos
    FROM empleado e
    RIGHT JOIN departamento d ON e.id_departamento = d.id
    WHERE e.id IS NULL
    ORDER BY nombre_departamento;
END //

DELIMITER ;

-- Llamado al procedimiento listar_empleados_departamentos_no_asociados
CALL listar_empleados_departamentos_no_asociados();

