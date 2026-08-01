CREATE TABLE Clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL ,
    telefono int NOT NULL
);

CREATE TABLE Especies (
    especies_id INT AUTO_INCREMENT PRIMARY KEY ,
    nombre VARCHAR(255) NOT NULL,
    floracion VARCHAR(255) NOT NULL,
    plantacion VARCHAR(255) NOT NULL,
    suelo VARCHAR(255) NOT NULL,
    exposicion VARCHAR(255) NOT NULL
);

CREATE TABLE Flores (
    flores_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    precio DECIMAL(10, 2),
    especie_id INT,
    FOREIGN KEY (especie_id) REFERENCES Especies(especies_id)
);

CREATE TABLE Pedidos (
    pedidos_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    flores_id INT,
    fecha DATE,
    cantidad INT,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (flores_id) REFERENCES Flores(flores_id)
);

INSERT INTO `Clientes` (`cliente_id`, `nombre`, `direccion`, `email`, `telefono`)
VALUES
(1, 'Juan Pérez', 'Calle A, Ciudad', 'juan@example.com', 123456789),
(2, 'María López', 'Avenida B, Pueblo', 'maria@example.com', 987654321),
(3, 'Pedro Ramírez', 'Calle C, Villa', 'pedro@example.com', 555555555),
(4, 'Ana García', 'Calle D, Pueblo', 'ana@example.com', 999999999),
(5, 'Luis Martínez', 'Avenida E, Ciudad', 'luis@example.com', 111111111),
(6, 'Laura Rodríguez', 'Calle F, Villa', 'laura@example.com', 777777777),
(7, 'Carlos Sánchez', 'Calle G, Ciudad', 'carlos@example.com', 444444444),
(8, 'Sofía Gómez', 'Avenida H, Pueblo', 'sofia@example.com', 222222222),
(9, 'Miguel Torres', 'Calle I, Villa', 'miguel@example.com', 888888888),
(10, 'Isabel Castro', 'Calle J, Ciudad', 'isabel@example.com', 666666666);

INSERT INTO `Especies` (`especies_id`, `nombre`, `floracion`, `plantacion`, `suelo`, `exposicion`)
VALUES
(1, 'Rosa', 'Primavera', 'Primavera', 'Suelo fértil', 'Sol'),
(2, 'Tulipán', 'Primavera', 'Otoño', 'Suelo bien drenado', 'Sol o sombra parcial'),
(3, 'Girasol', 'Verano', 'Primavera', 'Suelo bien drenado', 'Sol'),
(4, 'Orquídea', 'Variable', 'Variable', 'Sustrato especializado', 'Sombra o luz indirecta'),
(5, 'Lirio', 'Verano', 'Primavera', 'Suelo fértil', 'Sol o sombra parcial'),
(6, 'Margarita', 'Verano', 'Primavera', 'Suelo bien drenado', 'Sol o sombra parcial'),
(7, 'Dalia', 'Verano', 'Primavera', 'Suelo fértil', 'Sol o sombra parcial'),
(8, 'Clavel', 'Verano', 'Primavera', 'Suelo fértil', 'Sol o sombra parcial'),
(9, 'Amapola', 'Primavera', 'Primavera', 'Suelo bien drenado', 'Sol o sombra parcial'),
(10, 'Jazmín', 'Verano', 'Primavera', 'Suelo fértil', 'Sol o sombra parcial'),
(11, 'Menta', 'Verano', 'Primavera', 'Suelo húmedo', 'Sol o sombra parcial'),
(12, 'Lavanda', 'Verano', 'Primavera', 'Suelo bien drenado', 'Sol o sombra parcial'),
(13, 'Geranio', 'Verano', 'Primavera', 'Suelo bien drenado', 'Sol o sombra parcial'),
(14, 'Jacinto', 'Primavera', 'Otoño', 'Suelo bien drenado', 'Sol o sombra parcial'),
(15, 'Azalea', 'Primavera', 'Primavera', 'Suelo ácido', 'Sombra o luz filtrada');

INSERT INTO `Flores` (`flores_id`, `nombre`, `precio`, `especie_id`)
VALUES
(1, 'Rosa Roja', 10, 1),
(2, 'Rosa Blanca', 8, 1),
(3, 'Tulipán Rojo', 5, 2),
(4, 'Tulipán Amarillo', 4, 2),
(5, 'Girasol', 6, 3),
(6, 'Orquídea Blanca', 15, 4),
(7, 'Lirio Rosa', 7, 5),
(8, 'Margarita Blanca', 3, 6),
(9, 'Dalia Roja', 9, 7),
(10, 'Clavel Rosa', 4, 8),
(11, 'Amapola Roja', 3, 9),
(12, 'Jazmín Blanco', 5, 10),
(13, 'Menta', 2, 11),
(14, 'Lavanda', 6, 12),
(15, 'Geranio Rojo', 4, 13),
(16, 'Jacinto Azul', 7, 14),
(17, 'Azalea Rosa', 8, 15);

INSERT INTO `Pedidos` (`pedidos_id`, `cliente_id`, `flores_id`, `fecha`, `cantidad`)
VALUES
(1, 1, 1, '2023-11-01', 5),
(2, 1, 3, '2023-12-03', 10),
(3, 2, 2, '2023-01-02', 3),
(4, 3, 4, '2023-05-05', 2),
(5, 3, 6, '2023-06-07', 7),
(6, 4, 7, '2023-08-06', 4),
(7, 5, 9, '2023-09-04', 6),
(8, 6, 12, '2023-07-08', 1),
(9, 7, 14, '2023-04-09', 3),
(10, 8, 16, '2023-05-10', 2),
(11, 9, 10, '2023-03-02', 5),
(12, 10, 11, '2023-06-03', 8),
(13, 10, 15, '2023-06-06', 3),
(14, 10, 17, '2023-07-08', 4),
(15, 1, 2, '2023-01-05', 6),
(16, 2, 4, '2023-02-07', 1),
(17, 3, 5, '2023-03-01', 9),
(18, 4, 7, '2023-06-03', 3),
(19, 5, 9, '2023-01-04', 5),
(20, 6, 11, '2023-06-06', 2),
(21, 7, 13, '2023-01-09', 7),
(22, 8, 15, '2023-02-02', 4),
(23, 9, 17, '2023-06-05', 3),
(24, 10, 1, '2023-01-07', 8),
(25, 1, 3, '2023-06-09', 2),
(26, 2, 5, '2023-06-10', 4),
(27, 3, 6, '2023-04-03', 6),
(28, 4, 8, '2023-01-04', 3),
(29, 5, 10, '2023-12-07', 7),
(30, 6, 12, '2023-12-08', 2),
(31, 7, 14, '2023-11-09', 5),
(32, 8, 16, '2023-02-05', 3),
(33, 9, 17, '2023-03-02', 1),
(34, 10, 2, '2023-09-04', 4),
(35, 1, 4, '2023-10-06', 6),
(36, 2, 7, '2023-11-09', 3),
(37, 3, 9, '2023-12-03', 5),
(38, 4, 11, '2023-11-05', 2),
(39, 5, 13, '2023-12-07', 7),
(40, 6, 15, '2023-12-08', 4);


-- 1: Obtener la cantidad de pedidos realizados.
SELECT COUNT(pedidos_id) AS CANTIDAD_PEDIDOS
FROM pedidos;

-- 2: Obtener el nombre y correo electrónico de todos los clientes.
SELECT nombre, email
FROM clientes;

-- 3: Obtener el nombre de las flores y sus precios concatenados con el texto " cuesta X €".
SELECT CONCAT (nombre, " Cuesta ", precio, "€") 
FROM flores;

-- 4: Obtener todas las especies cuya estación de plantación es "Verano" o "Otoño".
SELECT nombre
FROM especies 
WHERE plantacion = "verano" or plantacion = "otoño";

-- 5: Obtener nombre y dirección de todos los clientes cuyo apellido termine en “ez”.
SELECT nombre, direccion
FROM clientes
WHERE nombre LIKE "%ez";

-- 6: Obtener todos los clientes cuya dirección contiene la palabra "Villa".
SELECT nombre, direccion
FROM clientes 
WHERE direccion LIKE "%Villa%";

-- 7: Obtener los clientes que han realizado pedidos de flores en junio de 2023, ordenados alfabéticamente por su nombre.
SELECT c.nombre, p.flores_id
FROM clientes c
INNER JOIN pedidos p ON c.cliente_id = p.cliente_id
WHERE p.fecha BETWEEN "2023-06-01" AND "2023-06-30"
ORDER BY c.nombre;

-- 8: Obtener el nombre de las especies que se plantan en Primavera y tienen exposición al Sol.
SELECT nombre
FROM especies
WHERE plantacion = "Primavera" AND exposicion = "Sol";

-- 9: Obtén el nombre, precio y especie de todas las flores cuyo precio sea mayor que 2 y menor que 5.
SELECT f.nombre AS nombre_flor, f.precio, e.nombre AS nombre_especie
FROM flores f
INNER JOIN especies e ON f.especie_id = e.especies_id
WHERE f.precio >2 AND f.precio <5;

-- 10: Obtener el total gastado por cada cliente.
SELECT c.nombre, SUM(f.precio * p.cantidad) 
FROM clientes c
INNER JOIN pedidos p ON c.cliente_id = p.cliente_id
INNER JOIN flores f ON p.flores_id = f.flores_id
GROUP BY c.nombre;

-- 11: ¿Cuántas flores tienen 'Suelo bien drenado' y en 'Primavera'?
SELECT COUNT(*)
FROM flores f
INNER JOIN especies e ON f.especie_id = e.especies_id
WHERE e.suelo = "Suelo bien drenado" AND e.plantacion = "Primavera";

-- 12: Obtener la cantidad de flores que ha comprado 'Juan Pérez'.
SELECT SUM(p.cantidad) AS total_flores
FROM pedidos p
INNER JOIN clientes c ON p.cliente_id = c.cliente_id
WHERE c.nombre = 'Juan Pérez';

-- 13: Crear una función que devuelva la concatenación de dos Strings.
DELIMITER //
create function palabra(str1 VARCHAR (10), str2 VARCHAR (10))
RETURNS VARCHAR(20)
DETERMINISTIC 
NO SQL
BEGIN 
RETURN CONCAT(str1,str2);
END //
DELIMITER ;

SELECT palabra ('carlos', 'castro');

-- 14: Crear una vista que muestre el nombre del cliente, el nombre de la flor, la cantidad pedida y la fecha del pedido.
CREATE VIEW VistaPedidos AS
SELECT c.nombre AS cliente, f.nombre, p.cantidad, p.fecha
FROM pedidos p
INNER JOIN flores f ON p.flores_id = f.flores_id
INNER JOIN clientes c ON p.cliente_id = c.cliente_id;

-- 15: Crear una vista que calcule cuánto se ha ganado en total desde que se abrió la tienda.
CREATE VIEW TotalGanado AS
SELECT SUM(p.cantidad * f.precio)
FROM pedidos p
RIGHT JOIN flores f ON p.flores_id = f.flores_id;
SELECT * FROM TotalGanado;

-- EXTRA -> Obtener el nombre y el precio de venta de las flores solicitadas en al menos 2 pedidos
SELECT f.nombre, f.precio, count(p.pedidos_id) as cantidad_pedidos
FROM flores f
INNER JOIN pedidos p ON f.flores_id = p.flores_id
GROUP BY f.nombre,f.precio having count(p.pedidos_id) >=2;





