import 'package:flutter/material.dart';

import './sec2/navbar.dart';

void main() => runApp(const ExpenseTracker());

class ExpenseTracker extends StatelessWidget {
  const ExpenseTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expense Tracker'),
          backgroundColor: Colors.deepPurple[900],
        ),
        drawer: const NavBar(),
        body: const Center(
          child: Text('Expense Tracker'),
        ),
      ),
    );
  }
}
