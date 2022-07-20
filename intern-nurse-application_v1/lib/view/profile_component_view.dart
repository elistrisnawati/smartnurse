import 'package:flutter/material.dart';

/// The Profile Component
class ProfileComponentView extends StatelessWidget {
  final String caption;
  final String value;

  const ProfileComponentView(
      {required this.caption, required this.value, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            caption,
            style: const TextStyle(color: Colors.blue, fontSize: 16.0),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22.0,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
        ]);
  }
}
