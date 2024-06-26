CREATE DATABASE autoRental;
use autoRental;

-- Tabla Sucursales
CREATE TABLE Sucursales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ciudad VARCHAR(50),
    direccion VARCHAR(100),
    telefono VARCHAR(20),
    correo VARCHAR(50)
);

-- Tabla Clientes
CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cedula VARCHAR(20),
    nombres VARCHAR(50),
    apellidos VARCHAR(50),
    correo VARCHAR(50),
    celular VARCHAR(20),
    ciudad VARCHAR(50),
    direccion VARCHAR(100)
);

-- Tabla Empleados
CREATE TABLE Empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cedula VARCHAR(20),
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    correo VARCHAR(50),
    celular VARCHAR(20),
    ciudad VARCHAR(50),
    direccion VARCHAR(100)
);

-- Tabla Vehiculos
CREATE TABLE Vehiculos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(20),
    tipo VARCHAR(20),
    color VARCHAR(20),
    motor VARCHAR(20),
    modelo VARCHAR(20),
    referencia VARCHAR(20),
    capacidad INT,
    puertas INT,
    sunroof BOOLEAN
);

-- Tabla Alquileres
CREATE TABLE Alquileres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vehiculo_id INT,
    cliente_id INT,
    empleado_id INT,
    sucursal_id INT,
    fecha_salida DATE,
    fecha_llegada DATE,
    valor_dia DECIMAL(10, 2),
    valor_semana DECIMAL(10, 2),
    descuento DECIMAL(10, 2),
    cotizado BOOLEAN,
    pagado BOOLEAN,
    FOREIGN KEY (vehiculo_id) REFERENCES Vehiculos(id),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id),
    FOREIGN KEY (empleado_id) REFERENCES Empleados(id),
    FOREIGN KEY (sucursal_id) REFERENCES Sucursales(id)
);








