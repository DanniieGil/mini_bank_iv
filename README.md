# Mini Bank

Una aplicación web bancaria simple desarrollada con Ruby on Rails y diseñada con Tailwind CSS.

## Características

- Gestión de usuarios (Clientes y Empleados)
- Creación y gestión de cuentas bancarias
- Transacciones (depósitos y retiros)
- Cálculo de bonos para empleados
- Historial de transacciones
- Interfaz moderna y responsiva

## Requisitos

- Ruby 3.0.0 o superior
- Rails 7.0.0 o superior
- PostgreSQL
- Node.js y Yarn para assets

## Instalación

1. Clonar el repositorio
```bash
git clone https://github.com/TU_USUARIO/mini_bank.git
cd mini_bank
```

2. Instalar las dependencias
```bash
bundle install
yarn install
```

3. Configurar la base de datos
```bash
rails db:create
rails db:migrate
```

4. Iniciar el servidor
```bash
rails server
```

La aplicación estará disponible en `http://localhost:3000`

## Uso

1. Crear usuarios (clientes o empleados)
2. Para clientes:
   - Crear cuentas bancarias
   - Realizar depósitos y retiros
   - Ver historial de transacciones
3. Para empleados:
   - Calcular bonos basados en su salario

## Diseño

La aplicación utiliza:
- Tailwind CSS para el diseño
- Componentes modernos y responsivos
- Modales interactivos
- Validaciones en tiempo real
- Mensajes de error y éxito estilizados

## Contribuir

1. Fork el proyecto
2. Crear una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abrir un Pull Request

## Licencia

Distribuido bajo la Licencia MIT. Ver `LICENSE` para más información.
