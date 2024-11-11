USE granjasanmatias;

INSERT INTO numLote (numLote, CantInicio, edadAve, estado, descripcion, create_at)
VALUES
(1, 3000, 90, 'I', 'Lote Finalizado', '2017-03-01'),
(2, 4000, 100, 'I', 'Lote Finalizado', '2018-06-15'),
(3, 4000, 101, 'I', 'Lote Finalizado', '2019-09-10'),
(4, 4500, 97, 'I', 'Lote Finalizado', '2020-12-25'),
(5, 6000, 100, 'I', 'Lote Finalizado', '2021-02-18'),
(6, 6000, 95, 'I', 'Lote Finalizado', '2022-05-11'),
(7, 7000, 91, 'I', 'Lote Finalizado', '2023-07-20'),
(8, 7120, 106, 'I', 'Lote Finalizado', '2023-11-04'),
(9, 7120, 93, 'A', 'Lote en Proceso', '2024-01-22'),
(10, 6120, 21, 'A', 'Lote en Proceso', '2024-06-30');

ALTER TABLE numLote MODIFY COLUMN create_at DATETIME NOT NULL DEFAULT NOW();
