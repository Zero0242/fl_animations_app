import 'package:animations_app/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCirculasPage extends StatefulWidget {
  const GraficasCirculasPage({super.key});

  @override
  State<GraficasCirculasPage> createState() => _GraficasCirculasPageState();
}

class _GraficasCirculasPageState extends State<GraficasCirculasPage> {
  double porcentaje = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Graficas Animadas')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            porcentaje >= 100 ? porcentaje = 0 : porcentaje += 10;
          });
        },
        child: const Icon(Icons.refresh, color: Colors.orange),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje),
              CustomRadialProgress(porcentaje: porcentaje),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje),
              CustomRadialProgress(porcentaje: porcentaje),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    super.key,
    required this.porcentaje,
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 180,
      child: RadialProgressAnimation(
        porcentaje: porcentaje,
        colorPrimario: Colors.blue,
        gradiente: const LinearGradient(colors: [
          Color(0xffc012ff),
          Color(0xff6d05e8),
          Colors.red,
        ]),
      ),
    );
  }
}
