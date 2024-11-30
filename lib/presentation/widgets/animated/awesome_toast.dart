import 'package:flutter/material.dart';

/// Tipos de alertas
enum ToastType { alert, warn, success, error }

/// Las mismas funciones pero basada en una clase
class AwesomeToast {
  AwesomeToast({
    required this.context,
    required this.content,
    this.type,
    this.duration = const Duration(seconds: 2),
  });

  /// Para mostrar un mensaje rapido
  factory AwesomeToast.message({
    required BuildContext context,
    required String text,
    ToastType? type,
    Duration duration = const Duration(seconds: 2),
    bool isLoading = false,
    TextStyle? textStyle =
        const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
  }) {
    return AwesomeToast(
      context: context,
      type: type,
      content: _CustomToastBody(
        duration: duration,
        isLoading: isLoading,
        text: text,
        textStyle: textStyle,
        type: type,
      ),
    );
  }

  final BuildContext context;
  final Widget content;
  final ToastType? type;
  final Duration duration;

  static final _palette = <String, Color>{
    'alert': Colors.orange,
    'success': Colors.green,
    'warn': Colors.orange.shade600,
    'error': Colors.red,
  };

  Color? _getColor() {
    return _palette[type?.name];
  }

  Future<void> show() {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: content,
        backgroundColor: _getColor(),
        showCloseIcon: false,
        behavior: SnackBarBehavior.floating,
        duration: duration,
        // * Esto es para mostrar el snackbar en la parte de arriba de la pantalla
        // margin: EdgeInsets.only(
        //   bottom: MediaQuery.of(context).size.longestSide - 130,
        //   left: 10,
        //   right: 10,
        // ),
        dismissDirection: DismissDirection.down,
        elevation: 12,
      ),
    );
    return Future.delayed(duration);
  }
}

/// Body personalizado del toast
class _CustomToastBody extends StatelessWidget {
  const _CustomToastBody({
    required this.text,
    required this.duration,
    required this.isLoading,
    this.type,
    this.textStyle,
  });
  final String text;
  final ToastType? type;
  final Duration duration;
  final bool isLoading;
  final TextStyle? textStyle;

  String? get iconAsset {
    switch (type) {
      case ToastType.success:
        return 'assets/icons/checkmark.png';
      case ToastType.error:
        return 'assets/icons/rejected-mark.png';
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(child: Text(text, style: textStyle)),
        if (isLoading) const CircularProgressIndicator(),
        (iconAsset != null)
            ? CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset(
                  iconAsset!,
                  fit: BoxFit.cover,
                  height: 30,
                  width: 30,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
