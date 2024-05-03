import 'package:flutter/material.dart';

class Legend extends StatelessWidget {
  final String topic;
  final int color;

  const Legend({super.key, required this.topic, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(color),
          ),
        ),
        const SizedBox(width: 10),
        Text(topic),
      ],
    );
  }
}
