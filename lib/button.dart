import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String text;
  Color back;
  Color fore;
  Function click;
  // Function(String) clicked;
  Button({
    required this.click,
    required this.text,
    required this.back,
    required this.fore,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: back,
            foregroundColor: fore,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            fixedSize: Size.fromHeight(60)),
        onPressed: () {
          click(text);
        },
        child: Text(
          text,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ));
  }
}
