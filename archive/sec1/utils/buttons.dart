import 'package:flutter/material.dart';

// final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom( primary: Colors.black87,
// minimumSize: const Size(88, 36),
// padding: const EdgeInsets.symmetric(horizontal: 16),
// shape: const RoundedRectangleBorder(
// borderRadius: BorderRadius.all(Radius.circular(2)),
// ), ).copyWith(
// side: MaterialStateProperty.resolveWith<BorderSide>( (Set<MaterialState> states) {
// if (states.contains(MaterialState.pressed)) {
//   return BorderSide(
// color: Theme.of(context).colorScheme.primary,
// width: 1, );
// }
// return null; // Defer to the widget's default. },
// ), );

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.black87,
  primary: Colors.grey[300],
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  primary: Colors.black87,
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
  ),
);

// ElevatedButton(
//   style = ButtonStyle(
// backgroundColor: MaterialStateProperty.resolveWith<Color>( (Set<MaterialState> states) {
// if (states.contains(MaterialState.disabled)) return Colors.red;
// return null; // Defer to the widget's default. }),
// foregroundColor: MaterialStateProperty.resolveWith<Color>( (Set<MaterialState> states) {
// if (states.contains(MaterialState.disabled)) return Colors.blue;
// return null; // Defer to the widget's default. }),
// ),
// onPressed: null,
// child: const Text('ElevatedButton with custom disabled colors'),
// )

// OutlinedButton(
// style: OutlinedButton.styleFrom(
// shape: StadiumBorder(), side: BorderSide(
// width: 2,
// color: Colors.red ),
// ),
// onPressed: () { },
// child: Text('OutlinedButton with custom shape and border'),
// )