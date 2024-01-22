import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  const TextInput(
    this.placeholder,
    this.controller,
    { super.key }
  );

  final String placeholder;
  final TextEditingController controller;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.placeholder,
        hintStyle: const TextStyle(
          fontSize: 26
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 26
      ),
    );
  }
}