SELECT id_producto, nombre, stock
FROM productos
WHERE stock < 5;

SELECT SUM(total) AS ventas_totales
FROM ventas
WHERE EXTRACT(MONTH FROM fecha) = ;

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

SELECT id_venta, id_cliente, fecha, total, id_metodo_pago
FROM ventas
WHERE fecha >= CURRENT_DATE - INTERVAL '3 days' AND fecha <= CURRENT_DATE - INTERVAL '1 month';

SELECT c.id_cliente, c.nombre, c.email, c.telefono
FROM clientes c
LEFT JOIN ventas v ON c.id_cliente = v.id_cliente
WHERE v.fecha IS NULL OR v.fecha < NOW() - INTERVAL '6 months';