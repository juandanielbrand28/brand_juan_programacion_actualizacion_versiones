-- ============ BASE DE DATOS ORIGINAL v1.0 ============

CREATE TABLE Gorras (
    id_gorra INTEGER PRIMARY KEY,
    modelo TEXT NOT NULL,
    tipo TEXT,
    precio REAL,
    stock INTEGER
);

CREATE TABLE Ventas (
    id_venta INTEGER PRIMARY KEY,
    id_gorra INTEGER,
    cantidad INTEGER,
    fecha TEXT,
    FOREIGN KEY (id_gorra) REFERENCES Gorras(id_gorra)
);

INSERT INTO Gorras (id_gorra, modelo, tipo, precio, stock) VALUES
(1, 'New Era 9FORTY', 'Snapback', 35.00, 10),
(2, 'New Era 59FIFTY', 'Fitted', 45.00, 8),
(3, 'New Era 9TWENTY', 'Strapback', 30.00, 15),
(4, 'Urban Wave', 'Snapback', 25.00, 20),
(5, 'Street King', 'Trucker', 22.00, 12);

INSERT INTO Ventas (id_venta, id_gorra, cantidad, fecha) VALUES
(101, 1, 2, '2026-09-18'),
(102, 3, 1, '2026-09-19'),
(103, 2, 1, '2026-09-19'),
(104, 4, 3, '2026-09-20'),
(105, 5, 2, '2026-09-20');

SELECT * FROM Gorras;
SELECT * FROM Ventas;

