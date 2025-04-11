SELECT id_producto, nombre, stock
FROM productos
WHERE stock < 5;

SELECT SUM(total) AS total_ventas
FROM ventas
WHERE EXTRACT(MONTH FROM fecha) = 10 AND
EXTRACT(YEAR FROM fecha) = 2023;
SELECT id_cliente, COUNT(*) AS total_compras
FROM ventas
GROUP BY id_cliente
ORDER BY total_compras DESC
LIMIT 1;

SELECT p.nombre, SUM(dv.cantidad) AS total_vendido
FROM productos p
JOIN detalles_venta dv ON p.id_producto = dv.id_producto
GROUP BY p.nombre
ORDER BY total_vendido DESC
LIMIT 5;

-- Rango de tres dìas
SELECT dv.id_venta, dv.id_producto, dv.cantidad, dv.precio_unitario
FROM detalles_venta dv
JOIN ventas v ON dv.id_venta = v.id_venta
WHERE v.fecha BETWEEN '2023-10-06' AND '2023-10-09';

-- Rango de un mes
SELECT dv.id_venta, dv.id_producto, dv.cantidad, dv.precio_unitario
FROM detalles_venta dv
JOIN ventas v ON dv.id_venta = v.id_venta
WHERE v.fecha BETWEEN '2023-10-01' AND '2023-11-01';

SELECT c.id_cliente, c.nombre, c.email, c.telefono
FROM clientes c
LEFT JOIN ventas v ON c.id_cliente = v.id_cliente
WHERE v.fecha IS NULL OR v.fecha < NOW() - INTERVAL '6 months';