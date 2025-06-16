import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';

class LocalAuthPlugin {
  static final LocalAuthentication auth = LocalAuthentication();

  static void avaliableBiometrics() async {
    final List<BiometricType> biometricsList = await auth
        .getAvailableBiometrics();

    if (biometricsList.isNotEmpty) {
      // some things
    }

    if (biometricsList.contains(BiometricType.strong) ||
        biometricsList.contains(BiometricType.face)) {
      // stronger bios
    }
  }

  static Future<bool> canCheckBiometrics() async {
    return await auth.canCheckBiometrics;
  }

  static Future<(bool, String)> authenticate({
    bool bioMetricOnly = false,
  }) async {
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Para continuar, realice la autenticación',
        options: AuthenticationOptions(
          useErrorDialogs: true,
          sensitiveTransaction: true,
          // false si queremos usar el PIN
          biometricOnly: bioMetricOnly,
        ),
      );
      return (didAuthenticate, didAuthenticate ? 'Exito' : 'Cancelado');
    } on PlatformException catch (e) {
      debugPrint('Error $e');
      switch (e.code) {
        case auth_error.notEnrolled:
          return (false, 'Sin biometricos');
        case auth_error.lockedOut:
          return (false, 'Muchos intentos fallidos');
        case auth_error.notAvailable:
          return (false, 'No hay biometricos disponibles');
        case auth_error.passcodeNotSet:
          return (false, 'No hay PIN configurado');
        case auth_error.permanentlyLockedOut:
          return (false, 'Se requiere desbloquear el telefono');
        default:
          return (false, e.toString());
      }
    }
  }
}
