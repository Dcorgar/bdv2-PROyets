-- 1. CREAR UN NUEVO USUARIO DE PRUEBA (Usuario B)
-- Asumimos id_empresa=1 (PRUEBA)
-- La contraseña es 'user123', encriptada con Bcrypt.
INSERT INTO Usuario (id_empresa, email, password_hash, nombre_completo, telefono)
VALUES (
    1, 
    'user2@prueba.com', 
    '$2a$10$S9G/S.w.g.T.J.j.C.K.R.e.P.W.U.E.f.J.W.g.U.S.R.z.O', -- Hash para 'user123'
    'Usuario B de Pruebas', 
    '222333444'
);

-- 2. CREAR TAREAS PARA EL NUEVO USUARIO
-- Asumimos que el proyecto 'P-001' tiene id=1
-- Asumimos que el 'Usuario B' que acabamos de crear tiene id=6
-- (¡¡Verifica este ID '22' en tu BDD!!)

INSERT INTO Tarea (id_proyecto, id_usuario_asignado, nombre, fecha_vencimiento, estado, prioridad)
VALUES (1, 22, 'Definir paleta de colores (Usuario B)', '2025-11-20', 'pendiente', 1);

INSERT INTO Tarea (id_proyecto, id_usuario_asignado, nombre, fecha_vencimiento, estado, prioridad)
VALUES (1, 22, 'Comprar dominio .com (Usuario B)', '2025-11-22', 'pendiente', 2);

INSERT INTO Tarea (id_proyecto, id_usuario_asignado, nombre, fecha_vencimiento, estado, prioridad)
VALUES (1, 22, 'Optimizar imágenes del home (Usuario B)', '2025-11-25', 'en_progreso', 1);

INSERT INTO Tarea (id_proyecto, id_usuario_asignado, nombre, fecha_vencimiento, estado, prioridad)
VALUES (1, 22, 'Testear formulario de contacto (Usuario B)', '2025-11-30', 'pendiente', 0);

INSERT INTO Tarea (id_proyecto, id_usuario_asignado, nombre, fecha_vencimiento, estado, prioridad)
VALUES (1, 22, 'Reunión de seguimiento (Usuario B)', '2025-12-01', 'pendiente', 0);