import 'package:flutter/material.dart';

class LoadingProviderView extends StatelessWidget {
  const LoadingProviderView({
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
          const CircularProgressIndicator(
            color: Colors.blue,
          ),
          const Text(
            "Loading ...",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
