import 'package:flutter/material.dart';
import 'package:tutis/screens/navigation/help.dart';
import 'package:tutis/screens/navigation/tab_screen.dart';

import './config/theme/dark.dart';
import './config/theme/light.dart';

void main(List<String> args) {
  runApp(Tutis());
}

class Tutis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      title: 'Tutis',
      debugShowCheckedModeBanner: false,
      home: TabScreen(),
      routes: {
        Help.routeName: (context) => Help(),
      },
    );
  }
}
