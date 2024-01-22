import 'package:flutter/material.dart';

class H1 extends StatelessWidget {
  const H1 (
    this.text, { Key? key, this.color, this.textAlignment }
  ) : super(key: key);

  final String text;
  final Color? color;
  final TextAlign? textAlignment;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text, style: TextStyle(
            fontSize: 32,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 5
              ..color = Colors.black
          ),
          textAlign: textAlignment,
        ),
        Text(
          text, style: TextStyle(
            fontSize: 32,
            color: color
          ),
          textAlign: textAlignment,
        ),
      ]
    );
  }
}