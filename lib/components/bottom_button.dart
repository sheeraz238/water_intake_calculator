import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String ButtomTitle;
  BottomButton({required this.onTap, required this.ButtomTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: kBottomNavigationBarHeight,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: kBottomButtonColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: Text(ButtomTitle, style: kTextStyle)),
      ),
    );
  }
}
