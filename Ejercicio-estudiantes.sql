-- =========================
-- TABLA COURSES
-- =========================
USE `academia-ejercicio2`;
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    duration VARCHAR(50),
    schedule VARCHAR(50),
    difficulty VARCHAR(20),

    PRIMARY KEY (course_id)
);

-- =========================
-- TABLA STUDENTS
-- =========================
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dni VARCHAR(20) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100),
    date_of_birth DATE,

    PRIMARY KEY (student_id)
);

-- =========================
-- TABLA ENROLLMENTS
-- =========================
CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    year_enrolled INT,

    PRIMARY KEY (enrollment_id),

    FOREIGN KEY (student_id)
        REFERENCES Students(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ======================================================
-- INSERTS PARA COURSES (20 FILAS)
-- ======================================================
INSERT INTO Courses
(course_name, price, duration, schedule, difficulty)
VALUES
('Python Básico', 120.00, '3 meses', 'Mañana', 'Básico'),
('Python Avanzado', 250.00, '4 meses', 'Tarde', 'Avanzado'),
('Java Fundamentals', 180.00, '3 meses', 'Noche', 'Intermedio'),
('Desarrollo Web', 300.00, '5 meses', 'Mañana', 'Intermedio'),
('SQL desde Cero', 150.00, '2 meses', 'Tarde', 'Básico'),
('Data Science', 450.00, '6 meses', 'Noche', 'Avanzado'),
('Machine Learning', 500.00, '6 meses', 'Mañana', 'Avanzado'),
('C++ Básico', 170.00, '3 meses', 'Tarde', 'Básico'),
('JavaScript Moderno', 220.00, '4 meses', 'Noche', 'Intermedio'),
('React JS', 350.00, '5 meses', 'Mañana', 'Avanzado'),
('Node.js', 280.00, '4 meses', 'Tarde', 'Intermedio'),
('PHP y MySQL', 260.00, '4 meses', 'Noche', 'Intermedio'),
('Flutter Mobile', 400.00, '5 meses', 'Mañana', 'Avanzado'),
('Android Studio', 390.00, '5 meses', 'Tarde', 'Intermedio'),
('Ciberseguridad', 550.00, '6 meses', 'Noche', 'Avanzado'),
('Linux Essentials', 160.00, '2 meses', 'Mañana', 'Básico'),
('Redes Informáticas', 320.00, '4 meses', 'Tarde', 'Intermedio'),
('Power BI', 210.00, '3 meses', 'Noche', 'Intermedio'),
('Excel Profesional', 140.00, '2 meses', 'Mañana', 'Básico'),
('Inteligencia Artificial', 650.00, '7 meses', 'Noche', 'Avanzado');

-- ======================================================
-- INSERTS PARA STUDENTS (20 FILAS)
-- ======================================================
INSERT INTO Students
(first_name, last_name, dni, phone, email, date_of_birth)
VALUES
('Juan', 'Pérez', '12345678', '600111111', 'juan.perez@mail.com', '1998-03-15'),
('María', 'Gómez', '22345678', '600222222', 'maria.gomez@mail.com', '1999-06-10'),
('Carlos', 'Ruiz', '32345678', '600333333', 'carlos.ruiz@mail.com', '1997-09-21'),
('Ana', 'Martínez', '42345678', '600444444', 'ana.martinez@mail.com', '2000-01-11'),
('Luis', 'Fernández', '52345678', '600555555', 'luis.fernandez@mail.com', '1995-12-05'),
('Sofía', 'López', '62345678', '600666666', 'sofia.lopez@mail.com', '2001-04-19'),
('Miguel', 'Torres', '72345678', '600777777', 'miguel.torres@mail.com', '1996-07-30'),
('Lucía', 'Ramírez', '82345678', '600888888', 'lucia.ramirez@mail.com', '1998-08-14'),
('Diego', 'Navarro', '92345678', '600999999', 'diego.navarro@mail.com', '1994-11-22'),
('Elena', 'Castro', '10345678', '601111111', 'elena.castro@mail.com', '1999-05-18'),
('Pedro', 'Ortega', '11345678', '601222222', 'pedro.ortega@mail.com', '1993-10-07'),
('Laura', 'Morales', '12345679', '601333333', 'laura.morales@mail.com', '2002-02-13'),
('Javier', 'Herrera', '13345678', '601444444', 'javier.herrera@mail.com', '1997-06-28'),
('Paula', 'Vega', '14345678', '601555555', 'paula.vega@mail.com', '1998-12-09'),
('Fernando', 'Silva', '15345678', '601666666', 'fernando.silva@mail.com', '1995-03-01'),
('Natalia', 'Reyes', '16345678', '601777777', 'natalia.reyes@mail.com', '2001-09-17'),
('Ricardo', 'Mendoza', '17345678', '601888888', 'ricardo.mendoza@mail.com', '1996-01-25'),
('Patricia', 'Campos', '18345678', '601999999', 'patricia.campos@mail.com', '1997-07-12'),
('Andrés', 'Guerrero', '19345678', '602111111', 'andres.guerrero@mail.com', '2000-10-30'),
('Valeria', 'Ríos', '20345678', '602222222', 'valeria.rios@mail.com', '1999-08-08');

-- ======================================================
-- INSERTS PARA ENROLLMENTS (20 FILAS)
-- ======================================================
INSERT INTO Enrollments
(student_id, course_id, year_enrolled)
VALUES
(1, 1, 2024),
(2, 5, 2024),
(3, 3, 2023),
(4, 4, 2025),
(5, 2, 2024),
(6, 6, 2025),
(7, 7, 2025),
(8, 8, 2023),
(9, 9, 2024),
(10, 10, 2025),
(11, 11, 2023),
(12, 12, 2024),
(13, 13, 2025),
(14, 14, 2024),
(15, 15, 2025),
(16, 16, 2023),
(17, 17, 2024),
(18, 18, 2025),
(19, 19, 2024),
(20, 20, 2025);

-- PRACTICA AQUIII!!
-- 1 Mostrar todos los estudiantes
SELECT *
FROM students;

-- 2. Mostrar solo nombre y email
SELECT first_name, email
FROM students;

-- 3. Buscar estudiantes nacidos después del año 2000
SELECT first_name, last_name 
FROM students
WHERE date_of_birth>2000;

-- 4. Buscar cursos con precio mayor a 300
SELECT course_name, price
FROM courses
WHERE price >300;

-- 5. Buscar cursos de nivel Avanzado
SELECT course_name, difficulty
FROM courses
WHERE difficulty = 'Avanzado';

-- 6. Buscar estudiantes cuyo nombre empiece con "M"
SELECT first_name, last_name
From students
WHERE first_name LIKE "M%";

-- 7. Buscar estudiantes cuyo apellido termine en "z"
SELECT first_name, last_name
FROM students
WHERE last_name LIKE "%Z";

-- 8. Buscar cursos que contengan la palabra "Python"
SELECT course_name
FROM courses
WHERE course_name LIKE "%Python%";

-- 9. Contar cuántos estudiantes hay
SELECT count(*)
FROM students;

-- 10. Contar cuántos cursos son Avanzados
SELECT COUNT(*)
FROM courses
WHERE difficulty = 'Avanzado';





