CREATE TABLE Sucursales (
    id_sucursales INT PRIMARY KEY,
    ciudad VARCHAR(50),
    direccion VARCHAR(100),
    telefono VARCHAR(20),
    correo VARCHAR(50)
);

CREATE TABLE Clientes (
    cedula VARCHAR(20) PRIMARY KEY,
    nombres VARCHAR(50),
    apellidos VARCHAR(50),
    correo VARCHAR(50),
    celular VARCHAR(20),
    ciudad VARCHAR(50),
    direccion VARCHAR(100)
);

CREATE TABLE Empleados (
    cedula VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    correo VARCHAR(50),
    celular VARCHAR(20),
    ciudad VARCHAR(50),
    direccion VARCHAR(100)
);

CREATE TABLE Vehiculos (
    placa VARCHAR(20) PRIMARY KEY,
    tipo VARCHAR(20),
    color VARCHAR(20),
    motor VARCHAR(20),
    modelo VARCHAR(20),
    referencia VARCHAR(20),
    capacidad INT,
    puertas INT,
    sunroof BOOLEAN
);

CREATE TABLE Alquileres (
    id_alquiler INT PRIMARY KEY,
    vehiculo VARCHAR(20),
    cliente VARCHAR(20),
    empleado VARCHAR(20),
    sucursal INT,
    fecha_salida DATE,
    fecha_llegada DATE,
    valor_dia DECIMAL(10, 2),
    valor_semana DECIMAL(10, 2),
    descuento DECIMAL(10, 2),
    cotizado BOOLEAN,
    pagado BOOLEAN,
    FOREIGN KEY (vehiculo) REFERENCES Vehiculos(placa),
    FOREIGN KEY (cliente) REFERENCES Clientes(cedula),
    FOREIGN KEY (empleado) REFERENCES Empleados(cedula),
    FOREIGN KEY (sucursal) REFERENCES Sucursales(id_sucursales)
);
