import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionIndex;

  const Question({Key? key, required this.questionIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(questionIndex)],
    );
  }
}
