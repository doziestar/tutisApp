import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: Center(
            child: AnimatedContainer(
              duration: const Duration(seconds: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/tutis.png'),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Chidozie C. Okafor',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Active until: 12/02/2030',
                    style: Theme.of(context).textTheme.subtitle1,
                  )
                ],
              ),
            ),
          ))
        : Scaffold(
            body: Center(
              child: AnimatedContainer(
                duration: const Duration(seconds: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/tutis.png'),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Chidozie C. Okafor',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Active until: 12/02/2030',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
