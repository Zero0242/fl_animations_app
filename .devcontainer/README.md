## Scripts

Algunos scripts que pueden ser utilizados

| Comando                                        | Descripcion                                       |
| ---------------------------------------------- | ------------------------------------------------- |
| `flutter pub get`                              | Instala las dependencias                          |
| `flutter  build apk --release`                 | Crea un apk de produccion                         |
| `flutter  build apk --release --split-per-abi` | Crea un apk, dividido por arquitectura de sistema |
| `flutter  build appbundle`                     | Crea el bundle de tienda para Android             |
| `flutter  build ipa`                           | Crea el bundle de tienda para IOS                 |
| `flutter  build web`                           | Crea los assets estaticos de Web                  |
| `dart fix --apply && dart format .`            | Formatea el codigo                                |
| `flutter clean`                                | Limpia las dependencias                           |

## Devcontainer

Algunos comandos para conectar su dispositivo fisico de forma inalambrica, usar este programa [scrcpy](https://github.com/Genymobile/scrcpy) para compartir pantalla del celular con el PC

| Comando                         | Descripcion                                             |
| ------------------------------- | ------------------------------------------------------- |
| `adb devices`                   | ANDROID - Listado de dispositivos                       |
| `adb tcpip 5555`                | ANDROID - Exponer Daemon de debug en port `5555`        |
| `adb connect <ip_android>:5555` | ANDROID - Conectar el `ip_android` al puerto del Daemon |
| `adb kill-server`               | ANDROID - Matar el demonio en caso de error de conexion |
