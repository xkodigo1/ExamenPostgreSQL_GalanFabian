CREATE OR REPLACE FUNCTION registrar_venta(
    p_id_cliente INT,
    p_id_producto INT,
    p_cantidad INT,
    p_precio_unitario NUMERIC,
    p_id_metodo_pago INT
) RETURNS VOID AS $$
DECLARE
    v_stock_actual INT;
    v_total NUMERIC;
    v_id_venta INT;
BEGIN
    -- Validar si el cliente existe
    IF NOT EXISTS (SELECT 1 FROM clientes WHERE id_cliente = p_id_cliente) THEN
        RAISE EXCEPTION 'El cliente con ID % no existe', p_id_cliente;
    END IF;
    
    -- Verificar el stock del producto
    SELECT stock INTO v_stock_actual FROM productos WHERE id_producto = p_id_producto;
    
    IF v_stock_actual IS NULL THEN
        RAISE EXCEPTION 'El producto con ID % no existe', p_id_producto;
    ELSIF v_stock_actual < p_cantidad THEN
        RAISE EXCEPTION 'Stock insuficiente para el producto con ID %', p_id_producto;
    END IF;
    
    -- Calcular el total de la venta
    v_total := p_cantidad * p_precio_unitario;
    
    -- Registrar la venta
    INSERT INTO ventas (id_cliente, fecha, total, id_metodo_pago)
    VALUES (p_id_cliente, CURRENT_DATE, v_total, p_id_metodo_pago)
    RETURNING id_venta INTO v_id_venta;
    
    -- Registrar el detalle de la venta
    INSERT INTO detalles_venta (id_venta, id_producto, cantidad, precio_unitario)
    VALUES (v_id_venta, p_id_producto, p_cantidad, p_precio_unitario);
    
    -- Actualizar el stock del producto
    UPDATE productos
    SET stock = stock - p_cantidad
    WHERE id_producto = p_id_producto;
    
    -- Registrar movimiento de stock
    INSERT INTO movimientos_stock (id_producto, fecha, tipo, cantidad, descripcion)
    VALUES (p_id_producto, CURRENT_DATE, 'salida', p_cantidad, 'Venta registrada');
    
    RAISE NOTICE 'Venta registrada correctamente con ID %', v_id_venta;
END;
$$ LANGUAGE plpgsql;

-- Para probar el procedimiento: 
SELECT registrar_venta(1, 2, 3, 500.00, 1);

-- Para verificar que se registró la venta:
SELECT * FROM ventas ORDER BY id_venta DESC; -- Última venta registrada  
SELECT * FROM detalles_venta ORDER BY id_venta DESC; -- Detalles de la venta  
SELECT * FROM productos WHERE id_producto = 2; -- Validar que el stock se haya reducido  
SELECT * FROM movimientos_stock ORDER BY fecha DESC; -- Movimiento de salida de stock  

