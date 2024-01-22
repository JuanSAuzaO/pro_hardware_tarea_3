import 'package:flutter/material.dart';

class DataBox extends StatelessWidget {
  const DataBox(this.text, {
    super.key,
  });
  //Variable to receive the text from parent
  final String text;

  @override
  Widget build(BuildContext context) {
    //Give the text box a proper separation, place the text and style it as
    //shown to Figma
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Text(text , style: const TextStyle(
          color: Colors.black,
          fontSize: 32
        ),
      ),
    );
  }
}