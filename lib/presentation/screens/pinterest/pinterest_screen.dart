import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_animaciones/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

class PinterestScreen extends StatefulWidget {
  const PinterestScreen({super.key});
  static const String route = '/pinterest';

  @override
  State<PinterestScreen> createState() => _PinterestScreenState();
}

class _PinterestScreenState extends State<PinterestScreen> {
  double valorPrevio = 0.0;
  ScrollController controller = ScrollController();
  bool showMenu = false;
  @override
  void initState() {
    controller.addListener(listener);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(listener);
    controller.dispose();
    super.dispose();
  }

  void listener() {
    showMenu = controller.offset <= valorPrevio;
    valorPrevio = controller.offset;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isLarge = MediaQuery.of(context).size.width > 500;
    return Scaffold(
      appBar: AppBar(title: const Text('Pinterest'), centerTitle: true),
      floatingActionButton: _PinterestMenu(showMenu: showMenu),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: GridView.custom(
        controller: controller,
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: <QuiltedGridTile>[
            const QuiltedGridTile(2, 2),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 1),
            if (isLarge) const QuiltedGridTile(1, 2),
          ],
        ),
        semanticChildCount: 800,
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => _TileElement(index: index),
        ),
      ),
    );
  }
}

class _PinterestMenu extends StatelessWidget {
  const _PinterestMenu({required this.showMenu});
  final bool showMenu;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: showMenu ? 1 : 0,
      duration: const Duration(milliseconds: 500),
      child: FloatingActionMenu(
        children: <Widget>[
          IconButton(icon: const Icon(Icons.pie_chart), onPressed: () {}),
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          IconButton(
            icon: const Icon(Icons.supervised_user_circle),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _TileElement extends StatelessWidget {
  const _TileElement({required this.index});
  final int index;

  String get imageUrl {
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${index + 1}.png";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.green,
      ),
      child: InkWell(
        onTap: () {
          context.go('${PinterestScreen.route}/${index + 1}');
        },
        child: CircleAvatar(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) {
              return const Center(child: CircularProgressIndicator());
            },
            errorWidget: (context, error, stackTrace) {
              return Image.asset('assets/images/no-image.jpg');
            },
          ),
        ),
      ),
    );
  }
}
