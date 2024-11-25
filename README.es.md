[![en](https://img.shields.io/badge/lang-en-blue.svg)](https://github.com/RomaruDaze/TDL/blob/main/README.md) [![jp](https://img.shields.io/badge/lang-jp-red.svg)](https://github.com/RomaruDaze/TDL/blob/main/README.jp.md) [![cn](https://img.shields.io/badge/lang-cn-green.svg)](https://github.com/RomaruDaze/TDL/blob/main/README.cn.md) [![es](https://img.shields.io/badge/lang-es-yellow.svg)](https://github.com/RomaruDaze/TDL/blob/main/README.es.md)

# TDL: Una Aplicación Simple de Lista de Tareas

Bienvenido a TDL, una aplicación de lista de tareas simple e intuitiva construida con Flutter. Esta aplicación permite a los usuarios gestionar sus tareas de manera eficiente, ayudándote a mantenerte organizado y productivo.

## Tabla de Contenidos

- [Descripción General](#descripción-general)
- [Características](#características)
- [Comenzando](#comenzando)
- [Clonar el Repositorio](#clonar-el-repositorio)
- [Editar la Aplicación](#editar-la-aplicación)
- [Cambiar el Icono de la Aplicación](#cambiar-el-icono-de-la-aplicación)
- [Ejecutar o Depurar la Aplicación](#ejecutar-o-depurar-la-aplicación)
- [Instalar Dependencias](#instalar-dependencias)
- [Instalar en Móvil](#instalar-en-móvil)
- [Licencia](#licencia)

## Descripción General

TDL está diseñado para proporcionar una interfaz fácil de usar para gestionar tareas. Puedes agregar, editar, eliminar y categorizar tus tareas, lo que facilita el seguimiento de tu lista de tareas.

## Características

- **Agregar Tareas**: Agrega rápidamente nuevas tareas a tu lista.
- **Editar Tareas**: Modifica tareas existentes con facilidad.
- **Eliminar Tareas**: Elimina tareas que ya no son necesarias.
- **Estado de Tareas**: Marca tareas como completadas o pendientes.
- **Filtrar y Ordenar**: Visualiza tareas según su estado y ordénalas por fecha.

## Comenzando

Para comenzar con TDL, sigue las instrucciones a continuación para configurar el proyecto en tu máquina local. Si eres nuevo en Flutter, consulta la [guía de instalación de Flutter](https://flutter.dev/docs/get-started/install) para obtener instrucciones detalladas de configuración.

### Clonar el Repositorio

Para clonar el repositorio, ejecuta el siguiente comando en tu terminal:

```bash
git clone https://github.com/yourusername/TDL.git
```

Reemplaza `yourusername` con tu nombre de usuario de GitHub.

### Editar la Aplicación

Puedes editar la aplicación abriendo el proyecto en tu IDE preferido (por ejemplo, Visual Studio Code, Android Studio). Navega a la carpeta `lib` para modificar los archivos Dart y personalizar la funcionalidad de la aplicación.

### Cambiar el Icono de la Aplicación

Para cambiar el icono de la aplicación, puedes seguir estos pasos:

1. **Cambio Manual de Iconos:**

   - Ve a [AppIcon.co](https://appicon.co/) y sube la imagen de icono que desees. Selecciona las opciones de iPhone y Android, luego haz clic en "Generar".
   - Descarga el archivo zip generado, que contiene los tamaños de icono necesarios para ambas plataformas.
   - Para Android, navega a `android/app/src/main/res`, elimina las carpetas `mipmap` existentes y reemplázalas con las nuevas carpetas `mipmap` del zip descargado.
   - Para iOS, navega a `ios/Runner/Assets.xcassets`, elimina la carpeta `Assets.xcassets` existente y reemplázala con la nueva carpeta `Assets.xcassets` del zip descargado.

2. **Usando el Paquete Flutter Launcher Icons:**
   - Abre el archivo `pubspec.yaml` y agrega la siguiente dependencia bajo `dev_dependencies`:
     ```yaml
     flutter_launcher_icons: "^0.13.0"
     ```
   - Crea una carpeta `assets`, luego crea una carpeta `icon` dentro de ella y agrega tu archivo `icon.png`.
   - Ejecuta los siguientes comandos en la terminal:
     ```bash
     flutter pub get
     flutter pub run flutter_launcher_icons
     ```

### Ejecutar o Depurar la Aplicación

Para ejecutar o depurar la aplicación, utiliza el siguiente comando en tu terminal:

```bash
flutter run
```

Asegúrate de tener un emulador en funcionamiento o un dispositivo físico conectado.

### Instalar Dependencias

Antes de ejecutar la aplicación, asegúrate de tener instaladas todas las dependencias necesarias. Ejecuta el siguiente comando en la terminal:

```bash
flutter pub get
```

Este comando obtendrá todos los paquetes requeridos que se enumeran en el archivo `pubspec.yaml`.

### Instalar en Móvil

Para instalar la aplicación en tu dispositivo móvil, sigue estos pasos:

#### Para Android:

1. Conecta tu dispositivo Android a tu computadora a través de USB.
2. Asegúrate de que la depuración USB esté habilitada en tu dispositivo.
3. Ejecuta el siguiente comando en tu terminal:
   ```bash
   flutter install
   ```
   Esto construirá la aplicación e instalará directamente en tu dispositivo conectado.

#### Para iOS:

1. Abre el proyecto en Xcode navegando a la carpeta `ios` y abriendo el archivo `Runner.xcworkspace`.
2. Conecta tu dispositivo iOS a tu computadora.
3. Selecciona tu dispositivo en Xcode y haz clic en el botón "Ejecutar" (o usa el atajo `Cmd + R`) para construir e instalar la aplicación en tu dispositivo.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT - consulta el archivo [LICENSE](LICENSE) para más detalles.
