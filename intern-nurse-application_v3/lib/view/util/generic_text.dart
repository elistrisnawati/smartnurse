import "package:flutter/material.dart";

// to make the standar bottom navigation
class GenericText extends StatelessWidget {
  final String text;

  const GenericText({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black54,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
