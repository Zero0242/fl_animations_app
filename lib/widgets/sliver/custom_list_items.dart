import 'package:flutter/material.dart';

class TaskListItem extends StatelessWidget {
  const TaskListItem(this.title, this.color, {super.key});
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}

final items = [
  const TaskListItem('Orange', Color(0xffF08F66)),
  const TaskListItem('Family', Color(0xffF2A38A)),
  const TaskListItem('Subscriptions', Color(0xffF7CDD5)),
  const TaskListItem('Books', Color(0xffFCEBAF)),
  const TaskListItem('Orange', Color(0xffF08F66)),
  const TaskListItem('Family', Color(0xffF2A38A)),
  const TaskListItem('Subscriptions', Color(0xffF7CDD5)),
  const TaskListItem('Books', Color(0xffFCEBAF)),
];
