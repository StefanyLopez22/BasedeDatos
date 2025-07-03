# 📘 Diccionario de Datos – vehiculos



 **Tabla CLIENTES**

| Campo            | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK           | Referencia a        | Descripción                        |
|------------------|--------------|--------|-----|-----|------|--------|---------------------------------|---------------------|------------------------------------|
| NumCliente       | INT          | -      | ✅   | ❌   | ❌   | ✅     | > 0                             | -                   | Identificador único del cliente    |
| Nombre           | NVARCHAR      | 50   | ❌   | ❌   | ❌   | ❌     | Solo letras A-Z, longitud >= 3  | -                   | Nombre del cliente                 |
| ApellidoPaterno  | NVARCHAR     | 50     | ❌   | ❌   | ❌   | ❌     | Solo letras A-Z, longitud >= 3  | -                   | Apellido paterno del cliente       |
| ApellidoMaterno  | NVARCHAR      | 40    | ❌   | ❌   | ❌   | ❌     | Solo letras A-Z, longitud >= 3  | -                   | Apellido materno del cliente       |
| CURP             | NCHAR        | 18     | ❌   | ❌   | ❌   | ✅     | Formato válido CURP             | -                   | CURP del cliente                   |
| Telefono         | NARCHAR      | 40     | ❌   | ❌   | ❌   | ❌     | Solo dígitos, longitud >= 7     | -                   | Teléfono del cliente               |
| Calle            | NVARCHAR      | 50     | ❌   | ❌   | ❌   | ❌     | -                               | -                   | Calle de domicilio del cliente     |
| Num              | NVARCHAR      | 20     | ❌   | ❌   | ❌   | ❌     | Solo dígitos o letras           | -                   | Número exterior/interior domicilio |
| Ciudad           | NVARCHAR      | 50     | ❌   | ❌   | ❌   | ❌     | Solo letras A-Z, longitud >= 3  | -                   | Ciudad de residencia               |



 **Tabla VEHICULO**

| Campo            | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK           | Referencia a        | Descripción                        |
|------------------|--------------|--------|-----|-----|------|--------|---------------------------------|---------------------|------------------------------------|
| NumVehiculo      | INT          | -      | ✅   | ❌   | ❌   | ✅     | > 0                             | -                   | Identificador único del vehículo  |
| Marca            | NVARCHAR      | 40   | ❌   | ❌   | ❌   | ❌     | Solo letras A-Z, longitud >= 3  | -                   | Marca del vehículo                |
| Ano              | DATE          | -      | ❌   | ❌   | ❌   | ❌     | BETWEEN 1900 AND YEAR(GETDATE())| -                   | Año de fabricación del vehículo   |
| Modelo           | NVARCHAR      | 40    | ❌   | ❌   | ❌   | ❌     | Solo letras y números, longitud >= 2 | -            | Modelo del vehículo               |
| Placa            | NVARCHAR      | 7     | ❌   | ❌   | ❌   | ✅     | Formato válido de placas        | -                   | Placas del vehículo               |
| NumSucursal      | INT          | -      | ❌   | ✅   | ❌   | ❌     | > 0                             | SUCURSAL(NumSucursal)| Sucursal a la que pertenece       |



 **Tabla SUCURSAL**

| Campo            | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK           | Referencia a        | Descripción                        |
|------------------|--------------|--------|-----|-----|------|--------|---------------------------------|---------------------|------------------------------------|
| NumSucursal      | INT          | -      | ✅   | ❌   | ❌   | ✅     | > 0                             | -                   | Identificador único de la sucursal |
| NombreSucursal           | NARCHAR      | 50    | ❌   | ❌   | ❌   | ❌     | Solo letras A-Z, longitud >= 3  | -                   | Nombre de la sucursal             |
| Ubicacion        | NVARCHAR      | 50    | ❌   | ❌   | ❌   | ❌     | Solo letras y números, longitud >= 5 | -              | Ubicación de la sucursal          |



 **Tabla RENTA**

| Campo              | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK               | Referencia a        | Descripción                        |
|--------------------|--------------|--------|-----|-----|------|--------|-------------------------------------|---------------------|------------------------------------|
| NumCliente         | INT          | -      | ✅   | ✅   | ❌   | ❌     | > 0                                 | CLIENTES(NumCliente) | Cliente que realiza la renta       |
| NumVehiculo        | INT          | -      | ✅   | ✅   | ❌   | ❌     | > 0                                 | VEHICULO(NumVehiculo)| Vehículo rentado                   |
| NumDiasPrestados   | INT          | -      | ❌   | ❌   | ❌   | ❌     | >= 1 AND <= 365                     | -                   | Número de días de la renta         |
| FechaInicio        | DATE         | -      | ❌   | ❌   | ❌   | ❌     | >= '2000-01-01' AND <= CURRENT_DATE | -                   | Fecha de inicio de la renta        |
| FechaTermino       | DATE         | -      | ❌   | ❌   | ❌   | ❌     | >= FechaInicio                      | -                   | Fecha de término de la renta       |

