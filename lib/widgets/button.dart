import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;

  const Button({
    super.key,
    required this.text,
    required this.textColor,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
        child: Text(
          text,
          style: TextStyle(fontSize: 22, color: textColor),
        ),
      ),
    );
  }
}
