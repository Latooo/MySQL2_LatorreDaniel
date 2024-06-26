use autoRental;

-- Empleados

-- Procedimiento para crear un nuevo vehículo
DELIMITER //
CREATE PROCEDURE crearVehiculo (
    IN p_placa VARCHAR(20),
    IN p_tipo VARCHAR(20),
    IN p_color VARCHAR(20),
    IN p_motor VARCHAR(20),
    IN p_modelo VARCHAR(20),
    IN p_referencia VARCHAR(20),
    IN p_capacidad INT,
    IN p_puertas INT,
    IN p_sunroof BOOLEAN
)
BEGIN
    INSERT INTO Vehiculos (placa, tipo, color, motor, modelo, referencia, capacidad, puertas, sunroof)
    VALUES (p_placa, p_tipo, p_color, p_motor, p_modelo, p_referencia, p_capacidad, p_puertas, p_sunroof);
END //
DELIMITER ;

-- Procedimiento para actualizar un vehículo existente
DELIMITER //
CREATE PROCEDURE actualizarVehiculo (
    IN p_placa VARCHAR(20),
    IN p_tipo VARCHAR(20),
    IN p_color VARCHAR(20),
    IN p_motor VARCHAR(20),
    IN p_modelo VARCHAR(20),
    IN p_referencia VARCHAR(20),
    IN p_capacidad INT,
    IN p_puertas INT,
    IN p_sunroof BOOLEAN
)
BEGIN
    UPDATE Vehiculos
    SET tipo = p_tipo,
        color = p_color,
        motor = p_motor,
        modelo = p_modelo,
        referencia = p_referencia,
        capacidad = p_capacidad,
        puertas = p_puertas,
        sunroof = p_sunroof
    WHERE placa = p_placa;
END //
DELIMITER ;

-- Procedimiento para eliminar un vehículo
DELIMITER //
CREATE PROCEDURE eliminarVehiculo (
    IN p_placa VARCHAR(20)
)
BEGIN
    DELETE FROM Vehiculos
    WHERE placa = p_placa;
END //
DELIMITER ;

-- Clientes

-- Procedimiento para consultar todos los vehículos disponibles
DELIMITER //
CREATE PROCEDURE consultarVehiculos ()
BEGIN
    SELECT * FROM Vehiculos;
END //
DELIMITER ;

-- Procedimiento para consultar el historial de alquileres de un cliente específico
DELIMITER //
CREATE PROCEDURE consultarHistorialAlquileres (
    IN p_cedula_cliente VARCHAR(20)
)
BEGIN
    SELECT *
    FROM Alquileres
    WHERE cliente = p_cedula_cliente;
END //
DELIMITER ;

-- Jefe

-- Procedimiento para consultar todos los datos de las tablas
DELIMITER //
CREATE PROCEDURE consultarTodo ()
BEGIN
    SELECT * FROM Vehiculos;
    SELECT * FROM Clientes;
    SELECT * FROM Empleados;
    SELECT * FROM Sucursales;
    SELECT * FROM Alquileres;
END //
DELIMITER ;


