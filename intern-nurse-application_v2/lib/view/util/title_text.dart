import "package:flutter/material.dart";

class TitleText extends StatelessWidget {
  final String text;

  const TitleText({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 28.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
