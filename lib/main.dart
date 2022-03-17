import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './config/theme/dark.dart';
import './config/theme/light.dart';
import '../routes/routes.dart';
import '../screens/auth/login.dart';
import '../screens/splash/splash.dart';
import 'providers/auth.dart';
import 'screens/navigation/tab_screen.dart';

// void main(List<String> args) {
//   runApp(Tutis());
// }

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(Tutis());
}

// FlutterNativeSplash.remove();

class Tutis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
      ],
      child: MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        title: 'Tutis',
        debugShowCheckedModeBanner: false,
        home: Consumer<Auth>(
          builder: (context, value, child) => value.isAuth
              ? TabScreen()
              : FutureBuilder(
                  future: value.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : const LoginScreen(),
                ),
        ),
        routes: allRoutes,
      ),
    );
  }
}
