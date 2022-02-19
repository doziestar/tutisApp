import 'package:flutter/material.dart';
import 'package:tutis/answer.dart';
import 'package:tutis/nav/navbar.dart';
import 'package:tutis/question.dart';

void main() => runApp(const Tutis());

class Tutis extends StatefulWidget {
  const Tutis({Key? key}) : super(key: key);

  @override
  State<Tutis> createState() => _TutisState();
}

class _TutisState extends State<Tutis> {
  var questionIndex = 0;

  var questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Apples are round, and oranges are round.',
    'You can lead a cow down stairs but not up stairs.',
    'Apples are round, and oranges are round.',
  ];

  // ignore: curly_braces_in_flow_control_structures
  void getNextQuestion() {
    if (questionIndex + 1 <= questions.length) {
      setState(() {
        questionIndex = questionIndex + 1;
      });
    }
  }

  void getPreviousQuestion() {
    if (questionIndex > 0) {
      setState(() {
        questionIndex = questionIndex - 1;
      });
    }
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
          onPressed: getNextQuestion,
          child: const Icon(Icons.arrow_forward),
          backgroundColor: Colors.blueGrey[900],
          hoverColor: Colors.blue,
          tooltip: 'Next',
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        drawer: const NavBar(),
        body: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              Question(
                questionIndex: questions[questionIndex],
              ),
              const Answer(
                answerText: 'Next',
              ),
              const Answer(
                answerText: 'Previous',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
