# 📘 Diccionario de Datos – cursos
 **Tabla estudiantes**
| Campo           | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK          | Referencia a       | Descripción                         |
| --------------- | ------------ | ------ | -- | -- | ---- | ----- | ------------------------------ | ------------------ | ----------------------------------- |
| NumEstudiante   | INT          | -      | ✅  | ❌  | ❌    | ✅     | > 0                            | -                  | Identificador único del estudiante  |
| Matricula       | VARCHAR      | 15     | ❌  | ❌  | ❌    | ✅     | Letras y números, longitud ≥ 3 | -                  | Matrícula del estudiante            |
| Nombre          | VARCHAR      | 100    | ❌  | ❌  | ❌    | ❌     | Solo letras A-Z, longitud ≥ 3  | -                  | Nombre(s) del estudiante            |
| ApellidoPaterno | VARCHAR      | 100    | ❌  | ❌  | ❌    | ❌     | Solo letras A-Z, longitud ≥ 3  | -                  | Apellido paterno del estudiante     |
| ApellidoMaterno | VARCHAR      | 100    | ❌  | ❌  | ❌    | ❌     | Solo letras A-Z, longitud ≥ 3  | -                  | Apellido materno del estudiante     |
| IdCiudad        | INT          | -      | ❌  | ✅  | ❌    | ❌     | > 0                            | CIUDADES(IdCiudad) | Ciudad de residencia del estudiante |

 **Tabla inscripcion**
| Campo            | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK                | Referencia a               | Descripción                        |
| ---------------- | ------------ | ------ | -- | -- | ---- | ----- | ------------------------------------ | -------------------------- | ---------------------------------- |
| NumEstudiante    | INT          | -      | ✅  | ✅  | ❌    | ❌     | > 0                                  | ESTUDIANTES(NumEstudiante) | Identificador del estudiante       |
| NumCurso         | INT          | -      | ✅  | ✅  | ❌    | ❌     | > 0                                  | CURSO(NumCurso)            | Identificador del curso            |
| FechaInscripcion | DATE         | -      | ❌  | ❌  | ❌    | ❌     | Entre '2000-01-01' y la fecha actual | -                          | Fecha en que se inscribió al curso |

 **Tabla cursos**
| Campo    | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK          | Referencia a | Descripción                   |
| -------- | ------------ | ------ | -- | -- | ---- | ----- | ------------------------------ | ------------ | ----------------------------- |
| NumCurso | INT          | -      | ✅  | ❌  | ❌    | ✅     | > 0                            | -            | Identificador único del curso |
| Codigo   | VARCHAR      | 50     | ❌  | ❌  | ❌    | ✅     | Letras y números, longitud ≥ 3 | -            | Código interno del curso      |
| Nombre   | VARCHAR      | 100    | ❌  | ❌  | ❌    | ❌     | Solo letras A-Z, longitud ≥ 3  | -            | Nombre del curso              |
