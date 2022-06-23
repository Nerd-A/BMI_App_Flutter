import 'package:flutter/material.dart';
import 'package:bmi/constants/app_constants.dart';

class RightBar extends StatelessWidget {
  final double barWidth;
  const RightBar({required this.barWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )),
        )
      ],
    );
  }
}
