import 'package:fl_animaciones/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HeadersHomeScreen extends StatelessWidget {
  const HeadersHomeScreen({super.key});
  static const String route = '/headers';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Headers')),
      body: ListView(
        children: [
          HeaderDisplayContainer(
            title: 'Header Diagonal',
            customPainter: DiagonalHeaderPainter(),
          ),
          HeaderDisplayContainer(
            title: 'Header Triangulo',
            customPainter: TriangleHeaderPainter(),
          ),
          HeaderDisplayContainer(
            title: 'Header Pico',
            customPainter: PeakHeaderPainter(),
          ),
          HeaderDisplayContainer(
            title: 'Header Curvo',
            customPainter: RoundedHeaderPainter(),
          ),
          HeaderDisplayContainer(
            title: 'Header Waves',
            customPainter: WaveHeaderPainter(),
          ),
          HeaderDisplayContainer(
            title: 'Gradient Waves',
            customPainter: WaveHeaderPainter(
              gradient: const LinearGradient(
                colors: [
                  Color(0xff40E0D0),
                  Color(0xffFF8C00),
                  Color(0xffFF0080),
                ],
              ),
            ),
          ),
          const Divider(),
          Text(
            'Headers animados',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const _ExperimentHeader(),
        ],
      ),
    );
  }
}

class _ExperimentHeader extends StatefulWidget {
  const _ExperimentHeader();

  @override
  State<_ExperimentHeader> createState() => _ExperimentHeaderState();
}

class _ExperimentHeaderState extends State<_ExperimentHeader>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller?.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, child) {
        return Container(
          margin: const EdgeInsets.all(15),
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
          ),
          child: CustomPaint(
            painter: AnimatedHeaderPainter(listenable: _controller!),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const BackButton(),
                const Text('Some AppBar'),
                IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AnimatedHeaderPainter extends CustomPainter {
  AnimatedHeaderPainter({required this.listenable})
    : super(repaint: listenable);

  final Animation<double> listenable;

  @override
  void paint(Canvas canvas, Size size) {
    final refHeight = size.height * 0.875;
    final minPoint = (refHeight * 6) / 8;
    final maxPoint = (refHeight * 10) / 8;
    final path = Path()
      ..lineTo(0, refHeight)
      ..quadraticBezierTo(
        size.width * 0.25,
        maxPoint,
        size.width * 0.5,
        refHeight,
      )
      ..quadraticBezierTo(size.width * 0.75, minPoint, size.width, refHeight)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);
    final paint = Paint();

    final rect = Offset.zero & size;
    paint.shader = LinearGradient(
      colors: const [Color(0xff40E0D0), Color(0xffFF8C00), Color(0xffFF0080)],
      stops: [0.0, listenable.value, 1.0],
    ).createShader(rect);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(AnimatedHeaderPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(AnimatedHeaderPainter oldDelegate) => false;
}
