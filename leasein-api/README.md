# API REST Laravel - Gestión de Equipos

Este proyecto es una API REST construida con Laravel para gestionar una tabla `equipos` y validar códigos enviados desde el frontend.

## 🚀 Requisitos
- PHP >= 8.1
- Composer
- PostgreSQL
- Node.js y npm (opcional para desarrollo conjunto con el frontend)

## 📦 Instalación
```bash
# Clonar repositorio
git clone <URL_REPOSITORIO_BACKEND>
cd leasein-api

# Instalar dependencias
composer install

# Copiar archivo de entorno
cp .env.example .env

# Generar clave
php artisan key:generate

# Configuración de base de datos (PostgreSQL)
DB_CONNECTION=pgsql
DB_HOST=127.0.0.1
DB_PORT=5432
DB_DATABASE=leasein
DB_USERNAME=postgresql
DB_PASSWORD=tu_password

# Migrar base de datos
php artisan migrate
```

## 🚀 Ejecución
```bash
# Ejecutar aplicación
php artisan serve
```
# Por defecto 
http://127.0.0.1:8000


# Endpoints
## GET /api/equipos
[
  {
    "id": 1,
    "codigo": "EQ001",
    "tipo": "Laptop",
    "cliente": "Cliente 1",
    "estado": "Disponible",
    "fecha_entrega": "2025-08-13"
  }
]

## POST /api/validar-equipos
# Datos enviados
{
  "codigos": ["EQ001", "EQ999"]
}
# Datos devueltos
{
  "encontrados": ["EQ001"],
  "no_encontrados": ["EQ999"]
}

# Estructura tabla
id | codigo | tipo | cliente | estado | fecha_entrega
1 | EQ001 | Laptop | Cliente 1 | Disponible | 2025-08-13
2 | EQ002 | Laptop | Cliente 2 | Disponible | 2025-08-13
