import 'package:flutter/material.dart';
import 'package:water_intake/constants.dart';

class RoundIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPress;

  RoundIcon({required this.icon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 5.0,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      shape: CircleBorder(),
      fillColor: kInactiveCardColor,
      child: Icon(icon),
    );
  }
}
