CREATE DATABASE autoRental;
use autoRental;

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

INSERT INTO Sucursales (id_sucursales, ciudad, direccion, telefono, correo) VALUES
(1, 'Bogotá', 'Calle 123 #45-67', '3214567890', 'bogota@sucursal.com'),
(2, 'Medellín', 'Carrera 50 #12-34', '3114567891', 'medellin@sucursal.com'),
(3, 'Cali', 'Avenida 5 #67-89', '3014567892', 'cali@sucursal.com'),
(4, 'Barranquilla', 'Calle 10 #20-30', '3214567893', 'barranquilla@sucursal.com'),
(5, 'Cartagena', 'Carrera 3 #4-5', '3114567894', 'cartagena@sucursal.com'),
(6, 'Bucaramanga', 'Calle 45 #6-7', '3014567895', 'bucaramanga@sucursal.com'),
(7, 'Pereira', 'Avenida 7 #8-9', '3214567896', 'pereira@sucursal.com'),
(8, 'Manizales', 'Carrera 10 #11-12', '3114567897', 'manizales@sucursal.com'),
(9, 'Armenia', 'Calle 13 #14-15', '3014567898', 'armenia@sucursal.com'),
(10, 'Cúcuta', 'Avenida 16 #17-18', '3214567899', 'cucuta@sucursal.com'),
(11, 'Ibagué', 'Carrera 19 #20-21', '3114567800', 'ibague@sucursal.com'),
(12, 'Santa Marta', 'Calle 22 #23-24', '3014567801', 'santamarta@sucursal.com'),
(13, 'Villavicencio', 'Avenida 25 #26-27', '3214567802', 'villavicencio@sucursal.com'),
(14, 'Pasto', 'Carrera 28 #29-30', '3114567803', 'pasto@sucursal.com'),
(15, 'Neiva', 'Calle 31 #32-33', '3014567804', 'neiva@sucursal.com');

INSERT INTO Clientes (cedula, nombres, apellidos, correo, celular, ciudad, direccion) VALUES
('1234567890', 'Juan', 'Pérez', 'juan.perez@mail.com', '3001234567', 'Bogotá', 'Calle 1 #2-3'),
('1234567891', 'Ana', 'Gómez', 'ana.gomez@mail.com', '3001234568', 'Medellín', 'Calle 4 #5-6'),
('1234567892', 'Carlos', 'López', 'carlos.lopez@mail.com', '3001234569', 'Cali', 'Calle 7 #8-9'),
('1234567893', 'María', 'Martínez', 'maria.martinez@mail.com', '3001234570', 'Barranquilla', 'Calle 10 #11-12'),
('1234567894', 'Luis', 'Hernández', 'luis.hernandez@mail.com', '3001234571', 'Cartagena', 'Calle 13 #14-15'),
('1234567895', 'Diana', 'Rodríguez', 'diana.rodriguez@mail.com', '3001234572', 'Bucaramanga', 'Calle 16 #17-18'),
('1234567896', 'Andrés', 'González', 'andres.gonzalez@mail.com', '3001234573', 'Pereira', 'Calle 19 #20-21'),
('1234567897', 'Laura', 'Fernández', 'laura.fernandez@mail.com', '3001234574', 'Manizales', 'Calle 22 #23-24'),
('1234567898', 'Jorge', 'Ramírez', 'jorge.ramirez@mail.com', '3001234575', 'Armenia', 'Calle 25 #26-27'),
('1234567899', 'Paula', 'Díaz', 'paula.diaz@mail.com', '3001234576', 'Cúcuta', 'Calle 28 #29-30'),
('1234567800', 'Miguel', 'Moreno', 'miguel.moreno@mail.com', '3001234577', 'Ibagué', 'Calle 31 #32-33'),
('1234567801', 'Mónica', 'Muñoz', 'monica.munoz@mail.com', '3001234578', 'Santa Marta', 'Calle 34 #35-36'),
('1234567802', 'Sergio', 'Romero', 'sergio.romero@mail.com', '3001234579', 'Villavicencio', 'Calle 37 #38-39'),
('1234567803', 'Adriana', 'Jiménez', 'adriana.jimenez@mail.com', '3001234580', 'Pasto', 'Calle 40 #41-42'),
('1234567804', 'Ricardo', 'Rojas', 'ricardo.rojas@mail.com', '3001234581', 'Neiva', 'Calle 43 #44-45');

INSERT INTO Empleados (cedula, nombre, apellido, correo, celular, ciudad, direccion) VALUES
('2345678901', 'Pedro', 'Castro', 'pedro.castro@mail.com', '3101234567', 'Bogotá', 'Carrera 1 #2-3'),
('2345678902', 'Lucía', 'Mendoza', 'lucia.mendoza@mail.com', '3101234568', 'Medellín', 'Carrera 4 #5-6'),
('2345678903', 'Felipe', 'Guerrero', 'felipe.guerrero@mail.com', '3101234569', 'Cali', 'Carrera 7 #8-9'),
('2345678904', 'Claudia', 'Reyes', 'claudia.reyes@mail.com', '3101234570', 'Barranquilla', 'Carrera 10 #11-12'),
('2345678905', 'Javier', 'Torres', 'javier.torres@mail.com', '3101234571', 'Cartagena', 'Carrera 13 #14-15'),
('2345678906', 'Sofía', 'Ortiz', 'sofia.ortiz@mail.com', '3101234572', 'Bucaramanga', 'Carrera 16 #17-18'),
('2345678907', 'Hernán', 'Vargas', 'hernan.vargas@mail.com', '3101234573', 'Pereira', 'Carrera 19 #20-21'),
('2345678908', 'Marta', 'Silva', 'marta.silva@mail.com', '3101234574', 'Manizales', 'Carrera 22 #23-24'),
('2345678909', 'Alejandro', 'Patiño', 'alejandro.patino@mail.com', '3101234575', 'Armenia', 'Carrera 25 #26-27'),
('2345678910', 'Natalia', 'Acosta', 'natalia.acosta@mail.com', '3101234576', 'Cúcuta', 'Carrera 28 #29-30'),
('2345678911', 'Fernando', 'Cardenas', 'fernando.cardenas@mail.com', '3101234577', 'Ibagué', 'Carrera 31 #32-33'),
('2345678912', 'Elena', 'Barrios', 'elena.barrios@mail.com', '3101234578', 'Santa Marta', 'Carrera 34 #35-36'),
('2345678913', 'Oscar', 'Valencia', 'oscar.valencia@mail.com', '3101234579', 'Villavicencio', 'Carrera 37 #38-39'),
('2345678914', 'Verónica', 'Cruz', 'veronica.cruz@mail.com', '3101234580', 'Pasto', 'Carrera 40 #41-42'),
('2345678915', 'Ramón', 'Salazar', 'ramon.salazar@mail.com', '3101234581', 'Neiva', 'Carrera 43 #44-45');

INSERT INTO Vehiculos (placa, tipo, color, motor, modelo, referencia, capacidad, puertas, sunroof) VALUES
('ABC123', 'Sedan', 'Rojo', '1600cc', '2020', 'Toyota Corolla', 5, 4, FALSE),
('DEF456', 'SUV', 'Negro', '2000cc', '2021', 'Honda CR-V', 7, 4, TRUE),
('GHI789', 'Coupe', 'Blanco', '1500cc', '2019', 'Mazda MX-5', 2, 2, FALSE),
('JKL012', 'Hatchback', 'Azul', '1400cc', '2018', 'Ford Fiesta', 5, 4, FALSE),
('MNO345', 'Pickup', 'Gris', '2500cc', '2022', 'Chevrolet Colorado', 5, 4, TRUE),
('PQR678', 'Convertible', 'Rojo', '2000cc', '2020', 'BMW Z4', 2, 2, TRUE),
('STU901', 'Minivan', 'Negro', '2400cc', '2017', 'Kia Carnival', 8, 4, FALSE),
('VWX234', 'Sedan', 'Blanco', '1800cc', '2016', 'Hyundai Elantra', 5, 4, FALSE),
('YZA567', 'SUV', 'Verde', '2200cc', '2021', 'Jeep Cherokee', 7, 4, TRUE),
('BCD890', 'Sedan', 'Gris', '2000cc', '2019', 'Nissan Altima', 5, 4, FALSE),
('EFG123', 'Coupe', 'Azul', '1500cc', '2018', 'Audi TT', 2, 2, TRUE),
('HIJ456', 'Hatchback', 'Rojo', '1400cc', '2020', 'Volkswagen Golf', 5, 4, FALSE),
('KLM789', 'Convertible', 'Blanco', '2000cc', '2017', 'Mercedes-Benz SLK', 2, 2, TRUE),
('NOP012', 'Minivan', 'Gris', '2400cc', '2022', 'Chrysler Pacifica', 8, 4, FALSE),
('QRS345', 'SUV', 'Negro', '2200cc', '2019', 'Toyota RAV4', 7, 4, TRUE);

INSERT INTO Alquileres (id_alquiler, vehiculo, cliente, empleado, sucursal, fecha_salida, fecha_llegada, valor_dia, valor_semana, descuento, cotizado, pagado) VALUES
(1, 'ABC123', '1234567890', '2345678901', 1, '2023-01-01', '2023-01-05', 50000, 300000, 0, TRUE, TRUE),
(2, 'DEF456', '1234567891', '2345678902', 2, '2023-02-01', '2023-02-05', 60000, 360000, 5000, TRUE, FALSE),
(3, 'GHI789', '1234567892', '2345678903', 3, '2023-03-01', '2023-03-05', 70000, 420000, 10000, TRUE, TRUE),
(4, 'JKL012', '1234567893', '2345678904', 4, '2023-04-01', '2023-04-05', 80000, 480000, 15000, FALSE, FALSE),
(5, 'MNO345', '1234567894', '2345678905', 5, '2023-05-01', '2023-05-05', 90000, 540000, 20000, TRUE, TRUE),
(6, 'PQR678', '1234567895', '2345678906', 6, '2023-06-01', '2023-06-05', 100000, 600000, 25000, FALSE, FALSE),
(7, 'STU901', '1234567896', '2345678907', 7, '2023-07-01', '2023-07-05', 110000, 660000, 30000, TRUE, TRUE),
(8, 'VWX234', '1234567897', '2345678908', 8, '2023-08-01', '2023-08-05', 120000, 720000, 35000, FALSE, FALSE),
(9, 'YZA567', '1234567898', '2345678909', 9, '2023-09-01', '2023-09-05', 130000, 780000, 40000, TRUE, TRUE),
(10, 'BCD890', '1234567899', '2345678910', 10, '2023-10-01', '2023-10-05', 140000, 840000, 45000, FALSE, FALSE),
(11, 'EFG123', '1234567800', '2345678911', 11, '2023-11-01', '2023-11-05', 150000, 900000, 50000, TRUE, TRUE),
(12, 'HIJ456', '1234567801', '2345678912', 12, '2023-12-01', '2023-12-05', 160000, 960000, 55000, FALSE, FALSE),
(13, 'KLM789', '1234567802', '2345678913', 13, '2024-01-01', '2024-01-05', 170000, 1020000, 60000, TRUE, TRUE),
(14, 'NOP012', '1234567803', '2345678914', 14, '2024-02-01', '2024-02-05', 180000, 1080000, 65000, FALSE, FALSE),
(15, 'QRS345', '1234567804', '2345678915', 15, '2024-03-01', '2024-03-05', 190000, 1140000, 70000, TRUE, TRUE);

SELECT v.placa, v.tipo, v.color, v.modelo, v.referencia, a.valor_dia
FROM Vehiculos v
LEFT JOIN (
    SELECT vehiculo, valor_dia
    FROM Alquileres
    WHERE ('2024-01-01' BETWEEN fecha_salida AND fecha_llegada)
       OR ('2023-12-31' BETWEEN fecha_salida AND fecha_llegada)
       OR (fecha_salida BETWEEN '2023-12-31' AND '2024-01-01')
       OR (fecha_llegada BETWEEN '2023-12-31' AND '2024-01-01')
) a ON v.placa = a.vehiculo
WHERE v.tipo = 'SUV' 
  AND (a.vehiculo IS NULL OR a.valor_dia BETWEEN 50000 AND 100000) 
ORDER BY v.placa;


SELECT a.id_alquiler, c.nombres, c.apellidos, v.placa, v.modelo, a.fecha_salida, a.fecha_llegada, a.valor_dia, a.valor_semana, a.pagado
FROM Alquileres a
JOIN Clientes c ON a.cliente = c.cedula
JOIN Vehiculos v ON a.vehiculo = v.placa
ORDER BY a.fecha_salida DESC;


