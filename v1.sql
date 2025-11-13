-- -----------------------------------------------------------------
-- Esquema de PostgreSQL para el Gestor de Proyectos
--
-- Este script SQL se basa en el schema.dbml que definimos.
-- Está listo para ejecutarse en una base de datos PostgreSQL.
-- -----------------------------------------------------------------

-- NOTA: PostgreSQL utiliza 'SERIAL' como un tipo de dato
-- autoincrementable (en lugar de 'increment').

-- 1. Tabla Empresa
-- Almacena la información de la compañía.
CREATE TABLE Empresa (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    codigo VARCHAR(50) UNIQUE NOT NULL
);

-- 2. Tabla Usuario
-- Almacena los usuarios. Cada usuario pertenece a UNA empresa.
CREATE TABLE Usuario (
    id SERIAL PRIMARY KEY,
    id_empresa INT NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    nombre_completo VARCHAR(255),
    telefono VARCHAR(20),
    
    CONSTRAINT fk_empresa
        FOREIGN KEY(id_empresa) 
        REFERENCES Empresa(id)
        ON DELETE CASCADE
);

-- 3. Tabla Proyecto
-- Almacena los proyectos de una empresa.
CREATE TABLE Proyecto (
    id SERIAL PRIMARY KEY,
    id_empresa INT NOT NULL,
    id_responsable INT NOT NULL,
    
    codigo_proyecto VARCHAR(20) NOT NULL,
    
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin_estimada DATE,
    estado VARCHAR(50) DEFAULT 'pendiente',
    prioridad INT DEFAULT 0,

    CONSTRAINT fk_empresa
        FOREIGN KEY(id_empresa) 
        REFERENCES Empresa(id)
        ON DELETE CASCADE,
        
    CONSTRAINT fk_responsable
        FOREIGN KEY(id_responsable) 
        REFERENCES Usuario(id)
        ON DELETE RESTRICT,

    UNIQUE(id_empresa, codigo_proyecto)
);

-- 4. Tabla Tarea
-- Almacena las tareas, que pertenecen a un Proyecto y a un Usuario.
CREATE TABLE Tarea (
    id SERIAL PRIMARY KEY,
    id_proyecto INT NOT NULL,
    id_usuario_asignado INT NOT NULL,
    
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_vencimiento DATE,
    estado VARCHAR(50) DEFAULT 'pendiente',
    prioridad INT DEFAULT 0,
    
    fecha_creacion TIMESTAMP DEFAULT now(),

    CONSTRAINT fk_proyecto
        FOREIGN KEY(id_proyecto)
        REFERENCES Proyecto(id)
        ON DELETE CASCADE,
        
    CONSTRAINT fk_usuario_asignado
        FOREIGN KEY(id_usuario_asignado)
        REFERENCES Usuario(id)
        ON DELETE RESTRICT
);