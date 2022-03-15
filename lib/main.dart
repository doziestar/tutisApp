import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutis/screens/auth/login.dart';
import 'package:tutis/screens/navigation/home.dart';

import './config/theme/dark.dart';
import './config/theme/light.dart';
import '../routes/routes.dart';
import 'providers/auth.dart';

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
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => Auth(),
          ),
        ],
        child: Consumer<Auth>(
          builder: (ctx, auth, _) =>
              auth.isAuth ? HomeScreen() : const LoginScreen(),
        ),
      ),
      // home: TabScreen(),
      routes: allRoutes,
    );
  }
}
