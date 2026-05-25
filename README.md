# 🛒 Base de Datos Relacional: EcomStore S.A.

Proyecto Final desarrollado para el módulo **Database Foundations** de la carrera de Ingeniería de Software con IA en SENATI. 

Este repositorio contiene la arquitectura y el código fuente para la migración de un sistema de gestión basado en Excel hacia un Sistema Gestor de Bases de Datos Relacionales (RDBMS) centralizado, solucionando problemas de integridad, duplicidad y pérdida de información.

## ⚙️ Tecnologías y Herramientas Utilizadas
* **Motor de Base de Datos:** MySQL Server
* **Entorno de Desarrollo (IDE):** MySQL Workbench
* **Modelado:** Reverse Engineer de MySQL Workbench

## 🏗️ Arquitectura del Proyecto
El sistema fue diseñado aplicando reglas de normalización (hasta la 3NF) para garantizar la integridad referencial. El esquema físico (`bd_ecomstore`) se compone de:

* **Tablas Maestras:** `tb_clientes`, `tb_productos`
* **Tablas Transaccionales:** `tb_pedidos`, `tb_detalle_pedido`

### 📊 Diagrama Relacional (Modelo Físico)
*(Añade aquí la imagen Modelo_Relacional_EcomStore.png arrastrándola desde tu computadora al editor de GitHub)*

## 🚀 Funcionalidades Implementadas (Script SQL)
El archivo principal `bd_ecomstore.sql` ejecuta de forma secuencial las siguientes operaciones:
1. **DDL (Data Definition Language):** Creación del esquema y tablas con sus respectivas restricciones (`PRIMARY KEY`, `FOREIGN KEY`, `AUTO_INCREMENT`).
2. **DML (Data Manipulation Language):** Inserción masiva de registros de prueba (clientes, inventario tecnológico y simulación de transacciones).
3. **Consultas Estratégicas:** Generación de reportes operativos utilizando uniones (`JOIN`) y filtros avanzados (`WHERE`, `ORDER BY`) para identificar cruces de información exactos, como el listado de pedidos pendientes de envío y el cálculo total a pagar por ticket.

---
*Desarrollado por: Luis Eloy Rojas Ramos*
