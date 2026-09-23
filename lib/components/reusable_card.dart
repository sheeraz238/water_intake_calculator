import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget childCard;
  final VoidCallback onPress;

  const ReusableCard({
    super.key,
    required this.colour,
    required this.childCard,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        //padding: EdgeInsets.only(bottom: 10),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(25),
        ),
        child: childCard,
      ),
    );
  }
}
