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
        // style: ButtonStyle(
        //   backgroundColor:  Colors.blue,
        //   foregroundColor: Colors.white,
        // ),
        onPressed: selectHandler,
        child: Text(answerText),
      ),
    );
  }
}
