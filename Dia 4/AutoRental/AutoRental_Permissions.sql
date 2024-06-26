use autoRental;

-- Crear usuarios Empleados, Clientes y Jefe
CREATE USER 'Empleados'@'localhost' IDENTIFIED BY 'contraseña';
CREATE USER 'Clientes'@'localhost' IDENTIFIED BY 'contraseña';
CREATE USER 'Jefe'@'localhost' IDENTIFIED BY 'contraseña';

-- Asignar permisos a cada usuario según sus funciones
GRANT EXECUTE ON PROCEDURE crearVehiculo TO 'Empleados'@'localhost';
GRANT EXECUTE ON PROCEDURE actualizarVehiculo TO 'Empleados'@'localhost';
GRANT EXECUTE ON PROCEDURE eliminarVehiculo TO 'Empleados'@'localhost';

GRANT EXECUTE ON PROCEDURE consultarVehiculos TO 'Clientes'@'localhost';
GRANT EXECUTE ON PROCEDURE consultarHistorialAlquileres TO 'Clientes'@'localhost';

GRANT EXECUTE ON PROCEDURE consultarTodo TO 'Jefe'@'localhost';
