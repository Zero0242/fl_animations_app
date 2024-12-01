import 'package:flutter/material.dart';

class ShoeAppBar extends StatelessWidget {
  const ShoeAppBar({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        height: kBottomNavigationBarHeight,
        width: double.infinity,
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            const BackButton(),
            Text(text, style: const TextStyle(fontSize: 30)),
            const Spacer(),
            const Icon(Icons.search, size: 30),
          ],
        ),
      ),
    );
  }
}
