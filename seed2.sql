-- Primero, creamos un proyecto de ejemplo al que asignar las tareas.
-- Asumimos que id_empresa=1 (PRUEBA) y id_responsable=1 (admin@prueba.com)
INSERT INTO Proyecto (id_empresa, id_responsable, codigo_proyecto, nombre, estado, prioridad)
VALUES (1, 1, 'P-001', 'Proyecto Dashboard Inicial', 'en_progreso', 1);

-- Ahora, insertamos 4 tareas de ejemplo
-- Asumimos que el proyecto que acabamos de crear tiene el 'id=1'
-- Asumimos que el usuario 'admin@prueba.com' tiene el 'id=1'

-- Tarea 1: Prioridad Alta (2)
INSERT INTO Tarea (id_proyecto, id_usuario_asignado, nombre, fecha_vencimiento, estado, prioridad)
VALUES (1, 1, 'Diseñar el mockup del login', '2025-11-20', 'pendiente', 2);

-- Tarea 2: Prioridad Media (1), Vencida
INSERT INTO Tarea (id_proyecto, id_usuario_asignado, nombre, fecha_vencimiento, estado, prioridad)
VALUES (1, 1, 'Revisar la API de registro', '2025-11-10', 'en_progreso', 1);

-- Tarea 3: Prioridad Baja (0)
INSERT INTO Tarea (id_proyecto, id_usuario_asignado, nombre, fecha_vencimiento, estado, prioridad)
VALUES (1, 1, 'Preparar la reunión de equipo', '2025-11-25', 'pendiente', 0);

-- Tarea 4: Prioridad Alta (2)
INSERT INTO Tarea (id_proyecto, id_usuario_asignado, nombre, fecha_vencimiento, estado, prioridad)
VALUES (1, 1, 'Implementar securización Bcrypt', '2025-11-18', 'pendiente', 2);