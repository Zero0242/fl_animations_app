import 'package:animations_app/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  PinterestButton({required this.icon, required this.onPressed});
  final Function() onPressed;
  final IconData icon;
}

class PinterestMenu extends StatelessWidget {
  const PinterestMenu({
    super.key,
    this.mostrar = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey,
    required this.items,
  });
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final bool mostrar;
  final List<PinterestButton> items;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _MenuModel(),
      child: AnimatedOpacity(
        opacity: (mostrar) ? 1 : 0,
        duration: const Duration(milliseconds: 200),
        child: Builder(builder: (context) {
          Provider.of<_MenuModel>(context).backgroundColor = backgroundColor;
          Provider.of<_MenuModel>(context).activeColor = activeColor;
          Provider.of<_MenuModel>(context).inactiveColor = inactiveColor;

          return _PinterestMenuBackground(
            child: _MenuItems(items),
          );
        }),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  const _PinterestMenuBackground({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: appTheme.scaffoldBackgroundColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.white38,
            offset: Offset(10, 10),
            blurRadius: 10,
            spreadRadius: -5,
          ),
        ],
      ),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  const _MenuItems(this.menuItems);

  final List<PinterestButton> menuItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        menuItems.length,
        (index) => _PintButton(index, menuItems[index]),
      ),
    );
  }
}

class _PintButton extends StatelessWidget {
  const _PintButton(this.index, this.item);
  final int index;
  final PinterestButton item;

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado =
        Provider.of<_MenuModel>(context).itemSeleccionado == index;

    final proveedor = Provider.of<_MenuModel>(context);
    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
            index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Icon(
        item.icon,
        size: itemSeleccionado ? 35 : 25,
        color:
            itemSeleccionado ? proveedor.activeColor : proveedor.inactiveColor,
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;
  int get itemSeleccionado => _itemSeleccionado;
  static Color _backgroundColor = Colors.white;
  static Color _activeColor = Colors.black;
  static Color _inactiveColor = Colors.blueGrey;

  set itemSeleccionado(int valor) {
    _itemSeleccionado = valor;
    notifyListeners();
  }

  Color get backgroundColor => _backgroundColor;
  set backgroundColor(Color color) => _backgroundColor = color;

  Color get activeColor => _activeColor;
  set activeColor(Color color) => _activeColor = color;

  Color get inactiveColor => _inactiveColor;
  set inactiveColor(Color color) => _inactiveColor = color;
}
