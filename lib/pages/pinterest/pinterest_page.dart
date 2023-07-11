import 'package:animations_app/widgets/pinterest/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => _MenuModel(),
        child: Stack(
          children: [
            const PinterestGrid(),
            _PositionedButton(),
          ],
        ),
      ),
    );
  }
}

class _PositionedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final proveedor = Provider.of<_MenuModel>(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: PinterestMenu(
          mostrar: proveedor.mostrar,
          activeColor: Colors.green,
          inactiveColor: Colors.blue,
          items: [
            PinterestButton(icon: Icons.pie_chart, onPressed: () {}),
            PinterestButton(icon: Icons.search, onPressed: () {}),
            PinterestButton(icon: Icons.notifications, onPressed: () {}),
            PinterestButton(
                icon: Icons.supervised_user_circle, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({super.key});

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List items = List.generate(200, (index) => index);
  final controller = ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    final proveedor = Provider.of<_MenuModel>(context, listen: false);
    controller.addListener(() {
      proveedor.mostrar = controller.offset <= scrollAnterior;
      scrollAnterior = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLarge = MediaQuery.of(context).size.width > 500;
    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: isLarge ? 3 : 4,
      itemCount: items.length,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      staggeredTileBuilder: (index) =>
          StaggeredTile.count(isLarge ? 1 : 2, index.isEven ? 2 : 3),
      itemBuilder: (context, index) => PinterestItem(index),
    );
  }
}

class PinterestItem extends StatelessWidget {
  const PinterestItem(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.green,
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  static bool _mostrar = true;

  bool get mostrar => _mostrar;
  set mostrar(bool estado) {
    _mostrar = estado;
    notifyListeners();
  }
}
