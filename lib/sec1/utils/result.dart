import 'package:flutter/material.dart';

class Next extends StatelessWidget {
  final int totalScore;
  const Next(this.totalScore);

  String get outputMessage {
    String message;
    if (totalScore <= 8) {
      message =
          'You\'ve reached the end of the quiz. \nYou are awesome and innocent!';
    } else if (totalScore <= 12) {
      message = 'You\'ve reached the end of the quiz. \nPretty likeable!';
    } else if (totalScore <= 16) {
      message = 'You\'ve reached the end of the quiz.\nYou are ... strange?!';
    } else {
      message = 'You\'ve reached the end of the quiz.\nYou are so bad!';
    }
    return message;
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'You\'ve reached the end of the quiz.\nYou are awesome and innocent!',
        style:
            TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
      ),
    );
  }
}
