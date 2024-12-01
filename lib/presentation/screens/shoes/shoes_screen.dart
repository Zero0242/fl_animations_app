import 'package:fl_animaciones/config/config.dart';
import 'package:fl_animaciones/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'shoes_details_screen.dart';

class ShoesScreen extends StatefulWidget {
  const ShoesScreen({super.key});
  static const String route = '/shoes';

  @override
  State<ShoesScreen> createState() => _ShoesScreenState();
}

class _ShoesScreenState extends State<ShoesScreen> {
  @override
  void initState() {
    StatusBarUtils.setLight();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const ShoeAppBar(text: 'For You!'),
          Expanded(
            child: ListView(
              children: <Widget>[
                Hero(
                  tag: 'uwuowo',
                  child: ShoePreview(
                    onTap: () {
                      context.push(ShoesDetailsScreen.route);
                    },
                  ),
                ),
                const ShoesDescription(
                  titulo: 'Nike Air Max 720',
                  descripcion:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
              ],
            ),
          ),
          const CartButton(monto: 750),
        ],
      ),
    );
  }
}
