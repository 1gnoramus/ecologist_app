import 'package:flutter/material.dart';
import 'constants.dart';

class Button_1 extends StatelessWidget {
  Button_1(
      {required this.color,
      required this.onTap,
      required this.textColor,
      required this.buttonText});

  final Color color;
  final Color textColor;
  final VoidCallback onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 10.0),
          onPressed: onTap,
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
        ),
      ),
    );
  }
}
