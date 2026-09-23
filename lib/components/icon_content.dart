import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  final IconData icons;
  final String label;

  IconContent({required this.icons, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icons, size: 120),
        SizedBox(height: 15),
        Text(label, style: kTextStyle),
      ],
    );
  }
}
