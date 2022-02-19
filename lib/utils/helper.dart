import 'package:flutter/material.dart';

const questions = [
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

class Next extends StatelessWidget {
  const Next({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'You\'ve reached the end of the quiz.',
        style:
            TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
      ),
    );
  }
}
