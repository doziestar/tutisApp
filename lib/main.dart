import 'package:flutter/material.dart';
import 'package:tutis/screens/auth/login.dart';

import './config/theme/dark.dart';
import './config/theme/light.dart';
import '../routes/routes.dart';

void main(List<String> args) {
  runApp(Tutis());
}

class Tutis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      title: 'Tutis',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      // home: TabScreen(),
      routes: allRoutes,
    );
  }
}
