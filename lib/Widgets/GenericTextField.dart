import 'package:flutter/material.dart';

class GenericTextInput extends StatelessWidget {
  final String textHint;
  final TextEditingController controller;
  final EdgeInsets margin;
  const GenericTextInput({super.key, required this.textHint, required this.controller, required this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextField(
        keyboardType: TextInputType.number,
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: textHint,
        ),
      ),
    );
  }
}
