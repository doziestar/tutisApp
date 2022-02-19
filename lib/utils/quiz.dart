import 'package:flutter/material.dart';

import '../answer.dart';
import '../question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final getNextQuestion;

  const Quiz(this.questions, this.questionIndex, this.getNextQuestion);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(30),
      child: Column(children: <Widget>[
        Question(
          questionIndex: questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<String>).map(
          (answer) {
            return Answer(
              answer,
              getNextQuestion,
            );
          },
        ),
      ]),
    );
  }
}
