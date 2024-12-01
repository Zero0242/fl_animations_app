import 'package:flutter_riverpod/flutter_riverpod.dart';

final shoeStoreProvider =
    StateNotifierProvider.autoDispose<ShoeStoreNotifier, ShoeStoreState>((ref) {
  return ShoeStoreNotifier();
});

class ShoeStoreNotifier extends StateNotifier<ShoeStoreState> {
  ShoeStoreNotifier() : super(ShoeStoreState());

  void updateImage(String image) {
    state = state.copyWith(asset: image);
  }

  void updateTalla(double talla) {
    state = state.copyWith(talla: talla);
  }
}

class ShoeStoreState {
  ShoeStoreState({
    this.asset = 'assets/images/azul.png',
    this.talla = 9.0,
  });

  final String asset;
  final double talla;

  ShoeStoreState copyWith({
    String? asset,
    double? talla,
  }) {
    return ShoeStoreState(
      asset: asset ?? this.asset,
      talla: talla ?? this.talla,
    );
  }
}
