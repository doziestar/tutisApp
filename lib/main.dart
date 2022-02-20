import 'package:flutter/material.dart';

class ExpenseTracker extends StatelessWidget {
  const ExpenseTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expense Tracker'),
        ),
        body: const Center(
          child: Text('Expense Tracker'),
        ),
      ),
    );
  }
}
