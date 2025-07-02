# 📘 Diccionario de Datos – doctor
 **Tabla doctores**
| Campo           | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK         | Referencia a | Descripción                    |
| --------------- | ------------ | ------ | -- | -- | ---- | ----- | ----------------------------- | ------------ | ------------------------------ |
| NumDoctor       | INT          | -      | ✅  | ❌  | ❌    | ✅     | > 0                           | -            | Identificador único del doctor |
| Nombre          | VARCHAR      | 100    | ❌  | ❌  | ❌    | ❌     | Solo letras A-Z, longitud ≥ 3 | -            | Nombre del doctor              |
| ApellidoPaterno | VARCHAR      | 60     | ❌  | ❌  | ❌    | ❌     | Solo letras A-Z, longitud ≥ 3 | -            | Apellido paterno del doctor    |
| ApellidoMaterno | VARCHAR      | 60     | ❌  | ❌  | ❌    | ❌     | Solo letras A-Z, longitud ≥ 3 | -            |                                |

 **Tabla pacientes**
| Campo           | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK         | Referencia a | Descripción                      |
| --------------- | ------------ | ------ | -- | -- | ---- | ----- | ----------------------------- | ------------ | -------------------------------- |
| NumPaciente     | INT          | -      | ✅  | ❌  | ❌    | ✅     | > 0                           | -            | Identificador único del paciente |
| Nombre          | VARCHAR      | 50     | ❌  | ❌  | ❌    | ❌     | Solo letras A-Z, longitud ≥ 3 | -            | Nombre del paciente              |
| ApellidoPaterno | VARCHAR      | 60     | ❌  | ❌  | ❌    | ❌     | Solo letras A-Z, longitud ≥ 3 | -            | Apellido paterno del paciente    |
| ApellidoMaterno | VARCHAR      | 60     | ❌  | ❌  | ❌    | ❌     | Solo letras A-Z, longitud ≥ 3 | -            | Apellido materno del paciente    |

 **Tabla atencion**
| Campo       | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK                | Referencia a           | Descripción                 |
| ----------- | ------------ | ------ | -- | -- | ---- | ----- | ------------------------------------ | ---------------------- | --------------------------- |
| NumDoctor   | INT          | -      | ✅  | ✅  | ❌    | ❌     | > 0                                  | DOCTORES(NumDoctor)    | ID del doctor que atiende   |
| NumPaciente | INT          | -      | ✅  | ✅  | ❌    | ❌     | > 0                                  | PACIENTES(NumPaciente) | ID del paciente atendido    |
| Fecha       | DATE         | -      | ❌  | ❌  | ❌    | ❌     | Entre '2000-01-01' y la fecha actual | -                      | Fecha de la atención médica |
