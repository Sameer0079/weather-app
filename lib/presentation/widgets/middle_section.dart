import 'package:flutter/material.dart';

class MiddleSection extends StatelessWidget {
  final String degree;
  final String weatherType;
  final String image;
  final String time;
  const MiddleSection({
    super.key,
    required this.degree,
    required,
    required this.weatherType,
    required this.image,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image),
        Text(
          '$degree°C',
          style: const TextStyle(fontSize: 55, color: Colors.white),
        ),
        Text(
          weatherType,
          style: const TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(
          time,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
