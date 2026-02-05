import 'package:flutter/material.dart';

class CenteredText extends StatelessWidget {
  CenteredText(this.text, {super.key});

  String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(style: TextStyle(color: Colors.white, fontSize: 28), text),
    );
  }
}