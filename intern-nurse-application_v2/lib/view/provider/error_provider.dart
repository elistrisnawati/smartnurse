import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ErrorProviderView extends StatelessWidget {
  const ErrorProviderView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(height: 80),
          const FaIcon(FontAwesomeIcons.xmark, size: 30),
          const Text(
            "Sorry, there is problem here",
            style: TextStyle(fontSize: 20),
          ),
          const Text(
            "Please try again later...",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
