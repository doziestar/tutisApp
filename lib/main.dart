import 'package:flutter/material.dart';

import './answer.dart';
import './nav/navbar.dart';
import './question.dart';

void main() => runApp(const Tutis());

class Tutis extends StatefulWidget {
  const Tutis({Key? key}) : super(key: key);

  @override
  State<Tutis> createState() => _TutisState();
}

class _TutisState extends State<Tutis> {
  var questionIndex = 0;

  var questions = [
    {
      'questionText': 'What\'s your favorite color?',
      // 'answers': [
      //   {'text': 'Black', 'score': 10},
      //   {'text': 'Red', 'score': 5},
      //   {'text': 'blue', 'score': 3},
      //   {'text': 'White', 'score': 1},
      // ],
      'answers': ['Black', 'Red', 'blue', 'White'],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      // 'answers': [
      //   {'text': 'Dog', 'score': 10},
      //   {'text': 'Cat', 'score': 5},
      //   {'text': 'Rabbit', 'score': 3},
      //   {'text': 'Lion', 'score': 1},
      // ],
      'answers': [
        'Dog',
        'Cat',
        'Rabbit',
        'Lion',
      ],
    },
    {
      'questionText': 'What\'s your favorite instructor?',
      'answers': [
        'Max',
        'Max',
        'Max',
        'Max',
      ],
      // 'answers': [
      //   {'text': 'Max', 'score': 10},
      //   {'text': 'Mosh', 'score': 5},
      //   {'text': 'Angela', 'score': 3},
      //   {'text': 'Josh', 'score': 1},
      // ],
    },
  ];

  // ignore: curly_braces_in_flow_control_structures
  getNextQuestion() {
    if (questionIndex + 1 <= questions.length) {
      setState(() {
        questionIndex = questionIndex + 1;
      });
    }
  }

  getPreviousQuestion() {
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
        ),
      ),
    );
  }
}
