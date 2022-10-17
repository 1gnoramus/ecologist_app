import 'package:flutter/material.dart';

class Button_2 extends StatelessWidget {
  Button_2(
      {required this.onTap,
      required this.textColor,
      required this.text,
      required this.buttonColor});

  final VoidCallback onTap;
  final Color buttonColor;
  final Color textColor;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
    );
  }
}
