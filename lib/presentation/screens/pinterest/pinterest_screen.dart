import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinterestScreen extends StatelessWidget {
  const PinterestScreen({super.key});
  static const String route = '/pinterest';

  @override
  Widget build(BuildContext context) {
    final isLarge = MediaQuery.of(context).size.width > 500;
    return Scaffold(
      appBar: AppBar(title: const Text('Pinterest'), centerTitle: true),
      body: GridView.custom(
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
      child: CircleAvatar(
        child: FadeInImage(
          placeholder: const AssetImage('assets/images/loading.gif'),
          image: NetworkImage(imageUrl),
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset('assets/images/no-image.jpg');
          },
        ),
      ),
    );
  }
}
