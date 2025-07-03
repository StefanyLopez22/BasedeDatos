# 📘 Diccionario de Datos – compañia
 **Tabla employeed**
| Campo        | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK         | Referencia a             | Descripción                      |
| ------------ | ------------ | ------ | -- | -- | ---- | ----- | ----------------------------- | ------------------------ | -------------------------------- |
| EmployeeId   | INT          | -      | ✅  | ❌  | ❌    | ✅     | > 0                           | -                        | Identificador único del empleado |
| SSN          | VARCHAR      | 15     | ❌  | ❌  | ❌    | ✅     | Solo dígitos, longitud = 9    | -                        | Número de seguro social          |
| Name         | VARCHAR      | 40     | ❌  | ❌  | ❌    | ❌     | Solo letras A-Z, longitud ≥ 3 | -                        | Segundo nombre del empleado      |
| Firstname    | VARCHAR      | 50     | ❌  | ❌  | ❌    | ❌     | Solo letras A-Z, longitud ≥ 3 | -                        | Primer nombre del empleado       |
| Lastname     | VARCHAR      | 50     | ❌  | ❌  | ❌    | ❌     | Solo letras A-Z, longitud ≥ 3 | -                        | Apellido del empleado            |
| Salary       | NVARCHAR      | -   | ❌  | ❌  | ❌    | ❌     | >= 0                          | -                        | Sueldo mensual                   |
| Birthday     | DATE         | -      | ❌  | ❌  | ❌    | ❌     | Fecha entre 1900 y actual     | -                        | Fecha de nacimiento              |
| Address      | VARCHAR      | 100    | ❌  | ❌  | ❌    | ❌     |                               | -                        | Dirección de residencia          |
| Sex          | NVARCHAR         | 1      | ❌  | ❌  | ❌    | ❌     | Valores permitidos: 'M', 'F'  | -                        | Sexo del empleado                |
| DepartmentId | INT          | -      | ❌  | ✅  | ❌    | ❌     | > 0                           | DEPARTMENT(IdDepartment) | Departamento asignado            |
| Jefe    | NVARCHAR          | 20    | ❌  | ✅  | ✅    | ❌     | > 0                           | EMPLOYEE(EmployeeId)     | Jefe directo (opcional)          |

 **Tabla department**

| Campo          | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK             | Referencia a         | Descripción                          |
| -------------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------------------- | -------------------- | ------------------------------------ |
| IdDepartment   | INT          | -      | ✅  | ❌  | ❌    | ✅     | > 0                               | -                    | Identificador único del departamento |
| NumberDepto  | INT      | 50     | ❌  | ❌  | ❌    | ✅     | Solo letras A-Z, longitud ≥ 3     | -                    | Código interno del departamento      |
| NameDepto | NVARCHAR      | 20   | ❌  | ❌  | ❌    | ✅     | Solo letras A-Z, longitud ≥ 3     | -                    | Nombre del departamento              |
| Manager     | NVARCHAR          | 20      | ❌  | ✅  | ✅    | ❌     | > 0                               | EMPLOYEE(EmployeeId) | Jefe del departamento (opcional)     |
| StartDate      | DATE         | -      | ❌  | ❌  | ✅    | ❌     | >= '1900-01-01' y <= fecha actual | -                    | Fecha de inicio del departamento     |

 **Tabla dependent**
| Campo        | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK         | Referencia a         | Descripción                         |
| ------------ | ------------ | ------ | -- | -- | ---- | ----- | ----------------------------- | -------------------- | ----------------------------------- |
| EmployeeId   | INT          | -      | ✅  | ✅  | ❌    | ❌     | > 0                           | EMPLOYEE(EmployeeId) | ID del empleado asociado            |
| Name         | NVARCHAR      | 50     | ✅  | ❌  | ❌    | ❌     | Solo letras A-Z, longitud ≥ 3 | -                    | Nombre del dependiente              |
| Sex          | NVARCHAR         |   20    | ❌  | ❌  | ❌    | ❌     | Valores permitidos: 'M', 'F'  | -                    | Sexo del dependiente                |
| Birthday     | DATE         | -      | ❌  | ❌  | ❌    | ❌     | Fecha entre 1900 y actual     | -                    | Fecha de nacimiento del dependiente |
| Relationship | VARCHAR      | 50     | ❌  | ❌  | ❌    | ❌     | Solo letras A-Z, longitud ≥ 3 | -                    | Parentesco con el empleado          |

 **Tabla works on**
| Campo      | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a         | Descripción                     |
| ---------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | -------------------- | ------------------------------- |
| EmployeeId | INT          | -      | ✅  | ✅  | ❌    | ❌     | > 0                   | EMPLOYEE(EmployeeId) | ID del empleado                 |
| ProjectId  | INT          | -      | ✅  | ✅  | ❌    | ❌     | > 0                   | PROJECT(ProjectId)   | ID del proyecto                 |
| Hours      | INT      | 5,2    | ❌  | ❌  | ❌    | ❌     | >= 0                  | -                    | Horas trabajadas en el proyecto |

 **Tabla locations**
| Campo        | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK         | Referencia a             | Descripción            |
| ------------ | ------------ | ------ | -- | -- | ---- | ----- | ----------------------------- | ------------------------ | ---------------------- |
| Location     | VARCHAR      | 100    | ✅  | ❌  | ❌    | ✅     | Solo letras A-Z, longitud ≥ 3 | -                        | Nombre de la ubicación |
| IdDepartment | INT          | -      | ✅  | ✅  | ❌    | ❌     | > 0                           | DEPARTMENT(IdDepartment) | ID del departamento    |
| EmployeeId   | INT          | -      | ✅  | ✅  | ❌    | ❌     | > 0                           | EMPLOYEE(EmployeeId)     | ID del empleado        |

 **Tabla project**
| Campo         | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK         | Referencia a             | Descripción                           |
| ------------- | ------------ | ------ | -- | -- | ---- | ----- | ----------------------------- | ------------------------ | ------------------------------------- |
| ProjectId     | INT          | -      | ✅  | ❌  | ❌    | ✅     | > 0                           | -                        | ID único del proyecto                 |
| NombreProject | NVARCHAR      | 30     | ❌  | ❌  | ❌    | ✅     | Solo letras A-Z, longitud ≥ 3 | -                        | Nombre del proyecto                   |
| NumProject    | INT          | -      | ❌  | ❌  | ❌    | ❌     | >= 0                          | -                        | Código interno del proyecto           |
| Location      | NVARCHAR      | 100    | ❌  | ❌  | ❌    | ❌     | Solo letras A-Z, longitud ≥ 3 | -                        | Ubicación principal del proyecto      |
| DepartmentId  | INT          | -      | ❌  | ✅  | ❌    | ❌     | > 0                           | DEPARTMENT(IdDepartment) | Departamento responsable del proyecto |
