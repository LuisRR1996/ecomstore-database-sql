-- ==========================================
-- PROYECTO FINAL: ECOMSTORE S.A.
-- ==========================================

-- 1. Eliminar la base de datos si ya existe (para evitar errores)
DROP DATABASE IF EXISTS bd_ecomstore;

-- 2. Crear la nueva base de datos
CREATE DATABASE bd_ecomstore;

-- 3. Indicarle a MySQL que usaremos esta base de datos
USE bd_ecomstore;

-- ==========================================
-- CREACIÓN DE TABLAS MAESTRAS
-- ==========================================

CREATE TABLE IF NOT EXISTS tb_clientes (
    id_cliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    telefono VARCHAR(20) NULL,
    fecha_registro DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS tb_productos (
    id_producto INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    categoria VARCHAR(50) NOT NULL,
    nombre_producto VARCHAR(150) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);

-- ==========================================
-- CREACIÓN DE TABLAS TRANSACCIONALES
-- ==========================================

CREATE TABLE IF NOT EXISTS tb_pedidos (
    id_pedido INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    fecha_pedido DATE NOT NULL,
    estado VARCHAR(50) DEFAULT 'Pendiente',
    FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
);

CREATE TABLE IF NOT EXISTS tb_detalle_pedido (
    id_detalle INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES tb_pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES tb_productos(id_producto)
);

-- ==========================================
-- INSERCIÓN DE DATOS DE PRUEBA (DML)
-- ==========================================

-- 1. Insertar Clientes
INSERT INTO tb_clientes (nombre, apellido, email, telefono, fecha_registro) VALUES
('Carlos', 'Mendoza', 'carlos.m@mail.com', '987654321', '2026-05-10'),
('Ana', 'Torres', 'ana.t@mail.com', '912345678', '2026-05-12'),
('Luis', 'Perez', 'luis.p@mail.com', '945612378', '2026-05-15');

-- 2. Insertar Productos (Tecnología)
INSERT INTO tb_productos (categoria, nombre_producto, precio, stock) VALUES
('Laptops', 'Laptop Gamer Pro 15', 3500.00, 10),
('Smartphones', 'Smartphone X 128GB', 1200.50, 25),
('Accesorios', 'Auriculares Inalámbricos Z', 150.00, 50);

-- 3. Insertar Pedidos
-- Carlos (id 1) hace un pedido hoy
INSERT INTO tb_pedidos (id_cliente, fecha_pedido, estado) VALUES
(1, '2026-05-25', 'Enviado'),
-- Ana (id 2) hace un pedido pendiente
(2, '2026-05-25', 'Pendiente');

-- 4. Insertar Detalle de Pedidos
-- El pedido 1 (de Carlos) incluye 1 Laptop y 2 Auriculares
INSERT INTO tb_detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 1, 3500.00), -- 1 Laptop
(1, 3, 2, 150.00);  -- 2 Auriculares

-- El pedido 2 (de Ana) incluye 1 Smartphone
INSERT INTO tb_detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES
(2, 2, 1, 1200.50); -- 1 Smartphone

-- ==========================================
-- 5. CONSULTAS DE COMPROBACIÓN (REPORTES)
-- ==========================================

-- Reporte 1: Ver todos los pedidos unidos con el nombre del cliente (Uso de JOIN)
SELECT p.id_pedido, c.nombre, c.apellido, p.fecha_pedido, p.estado
FROM tb_pedidos p
JOIN tb_clientes c ON p.id_cliente = c.id_cliente;

-- Reporte 2: Ver exactamente qué productos compró el cliente en el pedido 1
SELECT dp.id_pedido, pr.nombre_producto, dp.cantidad, dp.precio_unitario, (dp.cantidad * dp.precio_unitario) AS total_pagar
FROM tb_detalle_pedido dp
JOIN tb_productos pr ON dp.id_producto = pr.id_producto
WHERE dp.id_pedido = 1;

-- Reporte 3: Filtrar únicamente los pedidos que faltan enviar (Requerido por el caso)
SELECT id_pedido, id_cliente, fecha_pedido, estado 
FROM tb_pedidos 
WHERE estado = 'Pendiente'
ORDER BY fecha_pedido ASC;