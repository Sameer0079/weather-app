import 'package:flutter/material.dart';
import 'package:weather_app/presentation/widgets/temprature_widget.dart';

class BottomSection extends StatelessWidget {
  final String sunriseTime;
  final String sunsetTime;
  final String tempMax;
  final String tempMin;

  const BottomSection(
      {super.key,
      required this.sunriseTime,
      required this.sunsetTime,
      required this.tempMax,
      required this.tempMin});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TempratureWidget(
                image: '6.png', title: 'Sunrise', time: sunriseTime),
            TempratureWidget(
                image: '12.png', title: 'Sunset', time: sunsetTime),
          ],
        ),
        const Divider(
          color: Colors.grey,
          thickness: 0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TempratureWidget(
                image: '13.png', title: 'Temp Max', time: '$tempMax °C'),
            TempratureWidget(
                image: '14.png', title: 'Temp Min', time: '$tempMin °C'),
          ],
        ),
      ],
    );
  }
}
