-- ============ ACTUALIZACIÓN A v2.0 ============

CREATE TABLE Categorias (
    id_categoria INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL UNIQUE
);

INSERT INTO Categorias (id_categoria, nombre) VALUES
(1, 'Snapback'),
(2, 'Fitted'),
(3, 'Strapback'),
(4, 'Trucker');

CREATE TABLE Clientes (
    id_cliente INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    telefono TEXT,
    correo TEXT
);

INSERT INTO Clientes (id_cliente, nombre, telefono, correo) VALUES
(1, 'Carlos Pérez', '3001112233', 'carlos@mail.com'),
(2, 'Ana Gómez', '3004445566', 'ana@mail.com'),
(3, 'Luis Torres', '3007778899', 'luis@mail.com');

CREATE TABLE Auditoria (
    id_auditoria INTEGER PRIMARY KEY AUTOINCREMENT,
    accion TEXT,
    tabla_afectada TEXT,
    fecha TEXT DEFAULT CURRENT_TIMESTAMP,
    detalle TEXT
);

ALTER TABLE Gorras ADD COLUMN id_categoria INTEGER REFERENCES Categorias(id_categoria);

UPDATE Gorras SET id_categoria = 1 WHERE tipo = 'Snapback';
UPDATE Gorras SET id_categoria = 2 WHERE tipo = 'Fitted';
UPDATE Gorras SET id_categoria = 3 WHERE tipo = 'Strapback';
UPDATE Gorras SET id_categoria = 4 WHERE tipo = 'Trucker';

CREATE INDEX idx_gorras_modelo ON Gorras(modelo);
CREATE INDEX idx_ventas_fecha ON Ventas(fecha);

ALTER TABLE Ventas ADD COLUMN id_cliente INTEGER REFERENCES Clientes(id_cliente);

UPDATE Ventas SET id_cliente = 1 WHERE id_venta IN (101, 102);
UPDATE Ventas SET id_cliente = 2 WHERE id_venta IN (103, 104);
UPDATE Ventas SET id_cliente = 3 WHERE id_venta = 105;

CREATE TRIGGER tr_descontar_stock
AFTER INSERT ON Ventas
FOR EACH ROW
BEGIN
    UPDATE Gorras
    SET stock = stock - NEW.cantidad
    WHERE id_gorra = NEW.id_gorra;
    
    INSERT INTO Auditoria (accion, tabla_afectada, detalle)
    VALUES ('INSERT', 'Ventas', 'Venta registrada: ' || NEW.id_venta);
END;

SELECT * FROM Categorias;
SELECT * FROM Clientes;
SELECT * FROM Auditoria;