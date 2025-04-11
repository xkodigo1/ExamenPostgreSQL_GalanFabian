CREATE DATABASE techzone;
\c techzone;

CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    stock INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
)