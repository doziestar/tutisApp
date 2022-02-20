import 'package:flutter/material.dart';

import './nav/navbar.dart';
import './utils/helper.dart';
import './utils/quiz.dart';
import './utils/result.dart';

void main() => runApp(const Tutis());

class Tutis extends StatefulWidget {
  const Tutis({Key? key}) : super(key: key);

  @override
  State<Tutis> createState() => _TutisState();
}

class _TutisState extends State<Tutis> {
  var questionIndex = 0;
  var _totalScore = 0;

  // ignore: curly_braces_in_flow_control_structures
  chooseQuestion(int score) {
    if (questionIndex <= questions.length - 1) {
      _totalScore += score;

      setState(() {
        questionIndex = questionIndex + 1;
        print('score: $_totalScore');
        print(questionIndex);
      });
    }
  }

  nextQuestion() {
    if (questionIndex < questions.length - 1) {
      setState(() {
        questionIndex = questionIndex + 1;
        print(questionIndex);
      });
    }
  }

  getPreviousQuestion() {
    if (questionIndex > 0) {
      setState(() {
        questionIndex = questionIndex - 1;
        print(questionIndex);
      });
    }
  }

  restartQuiz() {
    setState(() {
      questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tutis-ID'),
          backgroundColor: Colors.blueGrey[900],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: restartQuiz,
          child: const Icon(Icons.refresh),
          backgroundColor: Colors.blueGrey[900],
          hoverColor: Colors.blue,
          tooltip: 'Next',
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        drawer: const NavBar(),
        body: questionIndex <= questions.length - 1
            ? Quiz(
                questions,
                questionIndex,
                chooseQuestion,
              )
            : Next(_totalScore),
      ),
    );
  }
}
