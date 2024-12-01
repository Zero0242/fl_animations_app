import 'package:fl_animaciones/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShoePreview extends ConsumerWidget {
  const ShoePreview({
    super.key,
    this.showSizes = true,
    this.margin = const EdgeInsetsDirectional.symmetric(horizontal: 10),
    this.onTap,
  });
  final EdgeInsetsGeometry margin;
  final bool showSizes;
  final VoidCallback? onTap;

  static const List<double> sizes = [7, 7.5, 8, 8.5, 9, 9.5];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final shoeImage = ref.watch(shoeStoreProvider).asset;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: size.height * 0.5,
        width: double.infinity,
        margin: margin,
        decoration: BoxDecoration(
          color: const Color(0xfff8d468),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image.asset(shoeImage),
            ),
            if (showSizes)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  for (final shoeSize in sizes) _ShoeSizes(shoeSize: shoeSize),
                ],
              ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

class _ShoeSizes extends ConsumerWidget {
  const _ShoeSizes({required this.shoeSize});
  final double shoeSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoeSizeRef = ref.watch(shoeStoreProvider).talla;

    return InkWell(
      onTap: () {
        ref.read(shoeStoreProvider.notifier).updateTalla(shoeSize);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: 40,
        width: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: shoeSizeRef == shoeSize ? Colors.blue : Colors.cyan,
          boxShadow: [
            if (shoeSizeRef == shoeSize)
              const BoxShadow(
                color: Color(0xfff1a23a),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
          ],
        ),
        child: Center(
          child: Text('$shoeSize'),
        ),
      ),
    );
  }
}
