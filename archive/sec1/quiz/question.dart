import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final questionIndex;

  const Question({Key? key, required this.questionIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      // use the questionIndex to get the question as map
      child: Text(
        questionIndex,
        style: const TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}
