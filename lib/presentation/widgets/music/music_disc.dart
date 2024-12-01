import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class MusicDisc extends StatelessWidget {
  const MusicDisc({
    super.key,
    required this.discImage,
    required this.getController,
  });
  final String discImage;
  final ValueChanged<AnimationController> getController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Color(0xff484750),
            Color(0xff1e1c24),
          ],
        ),
      ),
      width: 250,
      height: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SpinPerfect(
              duration: const Duration(seconds: 9),
              infinite: true,
              manualTrigger: true,
              controller: getController,
              child: Image.asset(discImage),
            ),
            Container(
              width: 25,
              height: 25,
              decoration: const BoxDecoration(
                color: Colors.black38,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 18,
              height: 18,
              decoration: const BoxDecoration(
                color: Color(0xff1c1c25),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
