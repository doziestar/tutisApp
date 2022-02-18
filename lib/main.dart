import 'package:flutter/material.dart';

void main() => runApp(const Tutis());

String question() {
  var questions = 'What is your name?';
  return questions;
}

class Tutis extends StatefulWidget {
  const Tutis({Key? key}) : super(key: key);

  @override
  State<Tutis> createState() => _TutisState();
}

class _TutisState extends State<Tutis> {
  int questionIndex = 0;

  void getQuestionIndex() {
    print("getQuestionIndex was called");
    setState(() {
      questionIndex = questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    String questions = question();
    List<String> listOfQuestions = [
      'What is your name?',
      'What is your favorite color?',
      'What is your favorite animal?',
      'What is your favorite food?',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tutis-ID'),
          backgroundColor: Colors.blueGrey[900],
        ),
        backgroundColor: Colors.blueGrey[100],
        body: Column(
          children: [
            Text(
              listOfQuestions[questionIndex],
            ),
            ElevatedButton(
              onPressed: () => getQuestionIndex(),
              child: const Text('Next'),
            ),
            ElevatedButton(
              onPressed: () => print('started'),
              child: Text(listOfQuestions.elementAt(1)),
            ),
            ElevatedButton(
              onPressed: () => print('stopped'),
              child: Text(listOfQuestions.elementAt(2)),
            ),
          ],
        ),
      ),
    );
  }
}
