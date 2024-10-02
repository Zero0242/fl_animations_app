import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SlideShowRef extends ConsumerWidget {
  const SlideShowRef({
    super.key,
    required this.children,
    this.direction = VerticalDirection.down,
  });
  final List<Widget> children;
  final VerticalDirection direction;

  int get itemCount => children.length;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Flex(
      direction: Axis.vertical,
      verticalDirection: direction,
      children: <Widget>[
        _SliderDots(itemCount: itemCount),
        Expanded(
          child: PageView(
            onPageChanged: ref.read(_slideIndexProvider.notifier).updateCount,
            children: children,
          ),
        ),
      ],
    );
  }
}

class _SliderDots extends ConsumerWidget {
  const _SliderDots({required this.itemCount});
  final int itemCount;
  double get _dotPrimario => 15;
  double get _dotSecundario => 12;
  Color get _colorPrimario => Colors.blue;
  Color get _colorSecundario => Colors.grey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(_slideIndexProvider);
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(itemCount, (index) {
          final isActive = index == current;
          final size = isActive ? _dotPrimario : _dotSecundario;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.bounceInOut,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            height: size,
            width: size,
            decoration: BoxDecoration(
              color: isActive ? _colorPrimario : _colorSecundario,
              shape: BoxShape.circle,
            ),
          );
        }),
      ),
    );
  }
}

// Manejo de estado con riverpod
final _slideIndexProvider =
    AutoDisposeNotifierProvider<_SlideIndexNotifier, int>(
  _SlideIndexNotifier.new,
);

class _SlideIndexNotifier extends AutoDisposeNotifier<int> {
  @override
  int build() {
    return 0;
  }

  void updateCount(int value) {
    state = value;
  }
}
