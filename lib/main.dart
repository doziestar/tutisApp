import 'package:flutter/material.dart';

void main() => runApp(const Instagram());

class Instagram extends StatelessWidget {
  const Instagram({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Instagram'),
        ),
        body: const Center(
          child: Text('Instagram'),
        ),
      ),
    );
  }
}
