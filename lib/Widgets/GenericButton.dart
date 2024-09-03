import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const GenericButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          onPressed();
        },
        child: Text(text));
  }
}
