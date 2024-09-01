create database attenEase
go
use attenEase
go
CREATE TABLE Usuarios (
    Usuario NVARCHAR(50) PRIMARY KEY,
    Correo NVARCHAR(100) NOT NULL UNIQUE,
    Contraseña NVARCHAR(255) NOT NULL,
    Nombre NVARCHAR(50) NOT NULL,
    ApellidoPaterno NVARCHAR(50) NOT NULL,
    ApellidoMaterno NVARCHAR(50) NOT NULL
);
go
CREATE TABLE Asistencias (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Usuario NVARCHAR(50) NOT NULL,
    HoraEntrada DATETIME NOT NULL DEFAULT GETDATE(),
    HoraSalida DATETIME,
    FOREIGN KEY (Usuario) REFERENCES Usuarios(Usuario)
);


INSERT INTO Usuarios (Usuario, Correo, Contraseña, Nombre, ApellidoPaterno, ApellidoMaterno)
VALUES ('jesusgnz023', 'gonzalezgutierrezjesus55@gmail.com', 'JGG3390J', 'Jesus', 'Gonzalez', 'Gutierrez');

INSERT INTO Asistencias (Usuario)
VALUES ('jesusgnz023');

UPDATE Asistencias
SET HoraSalida = GETDATE()
WHERE Id = 1;  -- Reemplaza 1 por el ID correspondiente del registro de asistencia


