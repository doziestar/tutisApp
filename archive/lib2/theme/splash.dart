import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SplashScreen'),
      ),
      body: Center(
        child: Container(
          child: const Text('SplashScreen'),
        ),
      ),
    );
  }
}
