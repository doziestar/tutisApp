import 'package:flutter/material.dart';
import 'package:tutis/screens/auth/login.dart';
import 'package:tutis/screens/auth/signup.dart';

import '../screens/navigation/help.dart';

Map<String, Widget Function(BuildContext)> allRoutes = <String, WidgetBuilder>{
  Help.routeName: (BuildContext context) => Help(),
  LoginScreen.routeName: (BuildContext context) => const LoginScreen(),
  RegisterScreen.routeName: (BuildContext context) => const RegisterScreen(),
};
