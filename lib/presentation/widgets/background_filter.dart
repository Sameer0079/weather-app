import 'dart:ui';

import 'package:flutter/material.dart';

class HomePageBackgroundFilter {
  BuildContext context;
  HomePageBackgroundFilter({required this.context});
  List<Widget> getFilter() {
    return [
      Align(
        alignment: const AlignmentDirectional(0, -1.2),
        child: Container(
          height: 300,
          width: 600,
          decoration: const BoxDecoration(color: Color(0xFF86A7FC)),
        ),
      ),
      Align(
        alignment: const AlignmentDirectional(0, 1.2),
        child: Container(
          height: 300,
          width: 600,
          decoration: const BoxDecoration(color: Color(0xFFC5E898)),
        ),
      ),
      Align(
        alignment: const AlignmentDirectional(3, -0.3),
        child: Container(
          height: 600,
          width: 300,
          decoration: const BoxDecoration(
              color: Color(0xFFFFDD95), shape: BoxShape.circle),
        ),
      ),
      Align(
        alignment: const AlignmentDirectional(-3, -0.3),
        child: Container(
          height: 600,
          width: 300,
          decoration: const BoxDecoration(
            color: Color(0xFFFFDD95),
            shape: BoxShape.circle,
          ),
        ),
      ),
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Colors.transparent),
        ),
      )
    ];
  }
}
