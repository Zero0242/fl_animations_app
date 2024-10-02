# Flutter Animaciones

Prueba de animaciones con riverpod (No code generator) + go_router

## Dev

1. Clonar repositorio
2. Instalar dependencias `flutter pub get`
3. Activar code generator
   - `dart run build_runner build`: para generar y ejecutar
   - `dart run build_runner watch`: para escribir proveedores de riverpod
4. Ejecutar proyecto con F5

# Riverpod

Instalacion de riverpod con code generation segun la [documentacion](https://riverpod.dev/docs/introduction/getting_started)

- Instalaciones

```bash
flutter pub add flutter_riverpod
flutter pub add dev:custom_lint
flutter pub add dev:riverpod_lint
```

- Code Generator

```bash
dart run build_runner watch
```

## NOTAS

La evaluacion de `Platform.isAndroid` causa errores en web **NO OLVIDAR C:**
