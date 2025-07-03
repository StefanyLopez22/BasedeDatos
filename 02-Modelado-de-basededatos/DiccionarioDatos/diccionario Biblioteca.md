# 📘 Diccionario de Datos – Biblioteca
 **Tabla lectores**
| Campo           | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK                                                            | Referencia a               | Descripción                            |
| --------------- | ------------ | ------ | -- | -- | ---- | ----- | -------------------------------------------------------------------------------- | -------------------------- | -------------------------------------- |
| Numlector     | INT          | -      | ✅  | ❌  | ❌    | ✅     | > 0                                                                              | -                          | Identificador único del lector         |
| Nombre         | NVARCHAR      | 100    | ❌  | ❌  | ❌    | ❌     | Solo letras A-Z, longitud mínima de 3 caracteres                                 | -                          | Nombre del lector                      |
| ApellidoPaterno | NVARCHAR      | 50     | ❌  | ❌  | ❌    | ❌     | Solo letras A-Z, longitud mínima de 3 caracteres                                 | -                          | Apellido paterno del lector            |
| ApellidoMaterno | NVARCHAR      | 50     | ❌  | ❌  | ✅    | ❌     | Solo letras A-Z, longitud mínima de 3 caracteres                                 | -                          | Apellido materno del lector (opcional) |
| NumMembresia  | INT          | -      | ❌  | ✅  | ❌    | ❌     | > 0                                                                              | Membresias(Num\_Membresia) | Número de membresía asignado al lector |


 **Tabla libro**
| Campo      | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK                           | Referencia a | Descripción                      |
| ---------- | ------------ | ------ | -- | -- | ---- | ----- | ----------------------------------------------- | ------------ | -------------------------------- |
| NumLibro | INT          | -      | ✅  | ❌  | ❌    | ✅     | > 0                                             | -            | Identificador único del libro    |
| NumISBN    | INT     | -    | ❌  | ❌  | ❌    | ✅     | Letras, números y guiones; longitud mínima de 3 | -            | Código ISBN del libro            |
| Titulo     | NVARCHAR      | 50    | ❌  | ❌  | ❌    | ✅     | Longitud mínima de 3 caracteres                 | -            | Título del libro                 |
| Autor      | NVARCHAR      | 50    | ❌  | ❌  | ❌    | ❌     | Solo letras A-Z                                 | -            | Nombre del autor del libro       |
| Cantidad   | INT          | -      | ❌  | ❌  | ❌    | ❌     | >= 0                                            | -            | Número de ejemplares disponibles |

 **Tabla lector**
| Campo             | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK                        | Referencia a          | Descripción                         |
| ----------------- | ------------ | ------ | -- | -- | ---- | ----- | -------------------------------------------- | --------------------- | ----------------------------------- |
| Num\_Lector       | INT          | -      | ✅  | ✅  | ❌    | ❌     | > 0                                          | Lectores(Num\_Lector) | Identificador del lector            |
| Num\_Libro        | INT          | -      | ✅  | ✅  | ❌    | ❌     | > 0                                          | Libros(Num\_Libro)    | Identificador del libro             |
