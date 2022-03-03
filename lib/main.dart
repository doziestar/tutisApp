import 'package:flutter/material.dart';
import 'package:tutis/theme/dark.dart';
import 'package:tutis/theme/light.dart';

void main(List<String> args) {
  runApp(const Tutis());
}

class Tutis extends StatelessWidget {
  const Tutis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tutis'),
        ),
      ),
    );
  }
}
