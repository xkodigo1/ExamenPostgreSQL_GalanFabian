INSERT INTO proveedores (nombre, contacto, telefono) VALUES 
('ProveedorUno', 'Alexis Silva', '3104568972'), 
('ProveedorDos', 'Juan Rodriguez', '3113415679'),
('ProveedorTres', 'Juan Cubides', '3027215932');

INSERT INTO metodos_pago (metodo) VALUES
('Efectivo'),
('Tarjeta de Crédito'),
('Tarjeta de Débito'),
('Paypal'),
('Transferencia Bancaria'),
('Mercadopago');

INSERT INTO clientes (nombre, email, telefono) VALUES
('Fabian Barragan', 'fabo2025@hotmail.com', '3224569854'),
('Kevin Bueno', 'ksbuenors@gmail.com', '3014214489'),
('Nicolas Suarez', 'nicolas.daniel06@outlok.com', '3506324009'),
('Sebastian Grimaldos', 'idksebazzz@gmail.com','3172593977');

INSERT INTO productos (nombre, descripcion, stock, precio, id_proveedor) VALUES
('Laptop', 'Descripción del producto uno', 10, 10.50, 1),
('SSD 16GB', 'Descripción del producto dos', 20, 20.00, 2),
('Mouse', 'Descripción del producto tres', 1, 15.75, 3),
('Monitor 170HZ', 'Descripción del producto cuatro', 5, 30.00, 1),
('Teclado', 'Descripción del producto cinco', 4, 25.00, 2),
('Auriculares', 'Descripción del producto seis', 30, 50.00, 3);

INSERT INTO pedidos_proveedor (id_proveedor, fecha, estado) VALUES
(1, '2023-10-01 10:00:00', 'Pendiente'),
(2, '2023-10-02 11:30:00', 'Completado'),
(3, '2023-10-03 14:45:00', 'Cancelado');

INSERT INTO detalle_pedido_proveedor (id_pedido, id_producto, cantidad, precio_compra) VALUES
(1, 1, 10, 9.50),
(1, 2, 5, 18.00),
(2, 3, 20, 14.50),
(3, 4, 15, 28.00);

INSERT INTO ventas (id_cliente, fecha, total, id_metodo_pago) VALUES
(1, '2023-10-05 09:00:00', 100.00, 1),
(2, '2023-10-06 12:30:00', 200.00, 2),
(3, '2023-10-07 15:45:00', 150.00, 3);

INSERT INTO detalles_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 2, 10.50),
(1, 2, 1, 20.00),
(2, 3, 3, 15.75),
(3, 4, 5, 30.00);

INSERT INTO movimientos_stock (id_producto, fecha, cantidad, tipo) VALUES
(1, '2023-10-01 10:00:00', 10, 'Entrada'),
(2, '2023-10-02 11:30:00', -5, 'Salida'),
(3, '2023-10-03 14:45:00', 20, 'Entrada'),
(4, '2023-10-04 16:00:00', -15, 'Salida');

INSERT INTO movimientos_stock (id_producto, fecha, tipo, cantidad, descripcion) VALUES
(1, '2023-10-01 10:00:00', 'entrada', 10, 'Descripción del movimiento uno'),
(2, '2023-10-02 11:30:00', 'salida', 5, 'Descripción del movimiento dos'),
(3, '2023-10-03 14:45:00', 'entrada', 20, 'Descripción del movimiento tres'),
(4, '2023-10-04 16:00:00', 'salida', 15, 'Descripción del movimiento cuatro');

