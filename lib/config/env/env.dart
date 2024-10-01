import 'dart:io' show Platform;

/// Diferentes entornos de la app
enum EnvMode { production, development, local }

/// Con esta clase gestionamos las variables de entorno
///
/// Posee configuracion para 3 ambientes de desarrollo
class Env {
  /// Ambiente actual de la aplicacion
  static const EnvMode _appEnv = EnvMode.local;
  static final String _apiUrl = switch (_appEnv) {
    EnvMode.production => "",
    EnvMode.development => "",
    EnvMode.local => Platform.isAndroid ? '127.0.0.1:3000' : 'localhost:3000',
  };

  /// Para saber si usa https o no
  static bool get useHttps => _appEnv != EnvMode.local;

  /// Genera el url, requiere del endpoint
  static Uri generateRoute({required String endpoint}) =>
      useHttps ? Uri.https(_apiUrl, endpoint) : Uri.http(_apiUrl, endpoint);
}
