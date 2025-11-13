-- -----------------------------------------------------------------
-- Script de "Seeding" (Datos Iniciales)
--
-- Ejecutar ESTE script DESPUÉS de 'schema.sql'.
-- -----------------------------------------------------------------

-- 1. Crear una Empresa
-- (Asumiremos que su ID será '1' al ser la primera)
INSERT INTO Empresa (nombre, codigo) 
VALUES ('Empresa de Prueba', 'PRUEBA');


-- 2. Crear un Usuario (¡El 'id_empresa' debe ser '1'!)
-- (Asumiremos que su ID será '1' al ser el primero)
-- NOTA: ¡'password_hash' debe ser un hash real (ej: Bcrypt)!
-- Por ahora, usamos un texto de relleno.
INSERT INTO Usuario (id_empresa, email, password_hash, nombre_completo, telefono)
VALUES (
    1, 
    'admin@prueba.com', 
    '$2a$10$8s5/F1.N.W5C.Jd.U.I.H.U.O.w.w.i.S.t.P.q.v.w.S.C.u', 
    'Admin Actualizado', 
    '999888777'
);


-- 3. Crear el "Proyecto 0" (¡Usando los IDs anteriores!)
INSERT INTO Proyecto (
    id_empresa,      -- ID de la Empresa
    id_responsable,  -- ID del Usuario
    codigo_proyecto, 
    nombre, 
    descripcion,
    estado
) VALUES (
    1, -- ID de 'Empresa de Prueba'
    1, -- ID de 'Administrador General'
    'PROY-0', 
    'Proyecto Interno (Admin)', 
    'Proyecto para tareas de configuración y administración interna.',
    'activo'
);

-- (Opcional) 4. Crear una Tarea de ejemplo para el Proyecto 0
INSERT INTO Tarea (
    id_proyecto,          -- ID del Proyecto
    id_usuario_asignado,  -- ID del Usuario
    nombre,
    descripcion,
    fecha_vencimiento,
    prioridad
) VALUES (
    1, -- ID del 'Proyecto Interno (Admin)'
    1, -- ID de 'Administrador General'
    'Configurar API',
    'Terminar de configurar todos los endpoints de la API.',
    '2025-12-31',
    3
);