import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MusicAppBar extends StatelessWidget {
  const MusicAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(FontAwesomeIcons.chevronLeft),
            ),
            const Spacer(),
            const Icon(FontAwesomeIcons.message),
            const SizedBox(width: 20),
            const Icon(FontAwesomeIcons.headphonesSimple),
            const SizedBox(width: 20),
            const Icon(FontAwesomeIcons.arrowUpRightFromSquare),
          ],
        ),
      ),
    );
  }
}
