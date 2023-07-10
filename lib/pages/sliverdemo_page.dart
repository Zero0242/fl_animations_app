import 'package:flutter/material.dart';

import '../widgets/sliver/custom_appbar.dart';
import '../widgets/sliver/custom_list_items.dart';

class SliverDemoPage extends StatelessWidget {
  const SliverDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _BotonNewList(),
          ),
        ],
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  const _MainScroll();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          floating: true,
          delegate: _CustomTitleDelegate(
            minheight: 200,
            maxheight: 250,
            child: const SliverCustomAppBar(),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            const SizedBox(height: 170),
          ]),
        )
      ],
    );
  }
}

class _CustomTitleDelegate extends SliverPersistentHeaderDelegate {
  _CustomTitleDelegate({
    required this.minheight,
    required this.maxheight,
    required this.child,
  });
  final double minheight;
  final double maxheight;
  final Widget child;

  @override
  Widget build(BuildContext context, _, __) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxheight;

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(covariant _CustomTitleDelegate oldDelegate) {
    return maxheight != oldDelegate.maxheight ||
        minheight != oldDelegate.minheight ||
        child != oldDelegate.child;
  }
}

class _BotonNewList extends StatelessWidget {
  const _BotonNewList();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 100,
      child: RawMaterialButton(
        onPressed: () {},
        child: const Text('Create new list'),
      ),
    );
  }
}
