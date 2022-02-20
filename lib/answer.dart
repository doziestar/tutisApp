import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final answerText;
  final VoidCallback selectHandler;

  const Answer(this.answerText, this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blueGrey[900]),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) return Colors.red;
              if (states.contains(MaterialState.hovered)) return Colors.green;
              if (states.contains(MaterialState.pressed)) return Colors.blue;
              return Colors.pink;
            },
          ), // Defer to the widget's default. }),
        ),
        onPressed: selectHandler,
        child: Text(answerText),
      ),
    );
  }
}
