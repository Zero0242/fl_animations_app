import 'package:animate_do/animate_do.dart';
import 'package:fl_animaciones/config/config.dart';
import 'package:fl_animaciones/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShoesDetailsScreen extends StatefulWidget {
  const ShoesDetailsScreen({super.key});
  static const String route = '/shoes/details';
  static const String partial = 'details';

  @override
  State<ShoesDetailsScreen> createState() => _ShoesDetailsScreenState();
}

class _ShoesDetailsScreenState extends State<ShoesDetailsScreen> {
  @override
  void dispose() {
    StatusBarUtils.setDark();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: 'uwuowo',
                child: ShoePreview.fullScreen(),
              ),
              Positioned(
                top: 60,
                child: FloatingActionButton.small(
                  elevation: 0,
                  highlightElevation: 0,
                  backgroundColor: Colors.transparent,
                  onPressed: () => context.pop(),
                  child: const Icon(
                    Icons.chevron_left,
                    size: 60,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const ShoesDescription(
                    titulo: 'Nike Air Max 720',
                    descripcion:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: <Widget>[
                        const Text(
                          r'$180.0',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Bounce(
                          from: 8,
                          delay: const Duration(seconds: 1),
                          child: const ShoeButton(
                            text: 'Buy Now',
                            width: 120,
                            height: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const ShoeColorPicker(),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        const _BotonPreferencia(
                          Icon(
                            Icons.star,
                            color: Colors.red,
                            size: 25,
                          ),
                        ),
                        _BotonPreferencia(
                          Icon(
                            Icons.add_shopping_cart,
                            color: Colors.grey.withOpacity(0.7),
                            size: 25,
                          ),
                        ),
                        _BotonPreferencia(
                          Icon(
                            Icons.settings,
                            color: Colors.grey.withOpacity(0.4),
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BotonPreferencia extends StatelessWidget {
  const _BotonPreferencia(this.icon);
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: -5,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: icon,
    );
  }
}
