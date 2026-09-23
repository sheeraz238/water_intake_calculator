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
        width: double.infinity,
        height: kBottomNavigationBarHeight,
        color: kBottomButtonColor,
        child: Center(child: Text(ButtomTitle, style: kTextStyle)),
      ),
    );
  }
}
