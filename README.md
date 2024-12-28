<p align="center">
  <a href="https://flutter.dev/" target="blank">
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Google-flutter-logo.png/800px-Google-flutter-logo.png" width="200" alt="App Logo" /></a>
</p>

# Proyecto Animaciones

Port del curso de animaciones de Flutter, link de [Udemy](https://www.udemy.com/course/flutter-disenos-y-animaciones)

> Creado en Flutter

## DEV

1. Clonar repositorio con `git clone`
2. Instalar los paquetes de Flutter con `flutter pub get`
3. Ejecutar el proyecto con `flutter run` o con `F5`

## Requisitos

1. Tener instalado Flutter
2. Tener instalado Android Studio

## Scripts

Algunos scripts que pueden ser utilizados

| Comando                                        | Descripcion                                             |
| ---------------------------------------------- | ------------------------------------------------------- |
| `flutter pub get`                              | Instala las dependencias                                |
| `flutter  build apk --release`                 | Crea un apk de produccion                               |
| `flutter  build apk --release --split-per-abi` | Crea un apk, dividido por arquitectura de sistema       |
| `flutter  build appbundle`                     | Crea el bundle de tienda para Android                   |
| `flutter  build ipa`                           | Crea el bundle de tienda para IOS                       |
| `flutter  build web`                           | Crea los assets estaticos de Web                        |
| `dart fix --apply && dart format .`            | Formatea el codigo                                      |
| `flutter clean`                                | Limpia las dependencias                                 |
| `adb devices`                                  | ANDROID - Listado de dispositivos                       |
| `adb tcpip 5555`                               | ANDROID - Exponer Daemon de debug en port `5555`        |
| `adb connect <ip_android>:5555`                | ANDROID - Conectar el `ip_android` al puerto del Daemon |
| `adb kill-server`                              | ANDROID - Matar el demonio en caso de error de conexion |

#### Otros Scripts

Otros scripts que pueden usar para fines de desarrollo, (acciones de paquetes)

| Comando                                                    | Descripcion                     |
| ---------------------------------------------------------- | ------------------------------- |
| `dart run icons_launcher:create`                           | Actualizar los iconos de la app |
| `dart run package_rename`                                  | Actualizar el nombre de la app  |
| `dart run build_runner build --delete-conflicting-outputs` | Activa el build runner          |
| `dart run build_runner watch --delete-conflicting-outputs` | Activa el build runner          |

## Documentacion

Links de librerias utilizadas

- [Flutter]("https://flutter.dev/")

## PROD

Seguir la guia recomendada por [flutter](https://docs.flutter.dev/deployment/android) para un despliegue en tienda

- Generar un keystore para poder subir la app

```bash
# Generar key para subidas
keytool -genkey -v -keystore my-upload-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000
# Pasar el key a base64 (para ci cd)
base64 -i my-upload-key.keystore -o my-upload-key-base64.txt
base64 -i key.properties -o key-properties-base64.txt
```
