import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  const Answer({Key? key, required this.answerText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => null,
      child: Text(answerText),
    );
  }
}
