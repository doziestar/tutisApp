import 'package:flutter/material.dart';

import 'body.dart';

void main() => runApp(const ExpenseTracker());

class ExpenseTracker extends StatelessWidget {
  const ExpenseTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: Colors.white,
        ),
        primarySwatch: Colors.green,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.green,
      ),
      home: const Body(),
    );
  }
}




/**
 * FIXME:
 * 1. modal dialog should be centered
 */