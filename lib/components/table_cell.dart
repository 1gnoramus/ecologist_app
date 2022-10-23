import 'package:flutter/material.dart';
import 'constants.dart';

class TablePiece extends StatelessWidget {
  const TablePiece({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        text,
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );
  }
}
