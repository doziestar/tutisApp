import 'package:flutter/material.dart';
import 'package:tutis/screens/auth/forgot_password.dart';
import 'package:tutis/screens/auth/login.dart';
import 'package:tutis/screens/auth/signup.dart';
import 'package:tutis/screens/navigation/home.dart';

import '../screens/navigation/help.dart';

Map<String, Widget Function(BuildContext)> allRoutes = <String, WidgetBuilder>{
  Help.routeName: (BuildContext context) => Help(),
  LoginScreen.routeName: (BuildContext context) => const LoginScreen(),
  RegisterScreen.routeName: (BuildContext context) => const RegisterScreen(),
  ForgotPasswordScreen.routeName: (BuildContext context) =>
      const ForgotPasswordScreen(),
  HomeScreen.routeName: (BuildContext context) => HomeScreen(),
};
