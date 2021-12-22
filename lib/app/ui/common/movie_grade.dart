import 'package:flutter/material.dart';

class MovieGrade extends StatelessWidget {
  const MovieGrade({Key? key, required this.grade, required this.iconSize})
      : super(key: key);

  final num grade;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    var starDisplayCount = grade ~/ 2;

    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star,
          color: Color(index >= starDisplayCount ? 0xffC4C4C4 : 0xfff1C644),
          size: iconSize,
        ),
      ),
    );
  }
}
