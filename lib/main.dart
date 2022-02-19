import 'package:flutter/material.dart';
import 'package:tutis/question.dart';

void main() => runApp(const Tutis());

class Tutis extends StatefulWidget {
  const Tutis({Key? key}) : super(key: key);

  @override
  State<Tutis> createState() => _TutisState();
}

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
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
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: const Text('Tutis-ID'),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[900],
                ),
              ),
              ListTile(
                title: const Text('About'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutPage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              Question(
                questionIndex: questions[questionIndex],
              ),
              ElevatedButton(
                onPressed: () => getNextQuestion(),
                child: const Text('Next'),
              ),
              ElevatedButton(
                onLongPress: () => print("about to change value"),
                onPressed: () => getPreviousQuestion(),
                child: const Text('Previous'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
