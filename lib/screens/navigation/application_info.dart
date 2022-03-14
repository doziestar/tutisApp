import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverFillRemaining(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/user.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Platform.isIOS
                                ? CupertinoIcons.info_circle
                                : FontAwesomeIcons.infoCircle,
                            size: 100,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          )
        : Scaffold(
            body: Center(
              child: Container(
                child: const Text('AccountScreen'),
              ),
            ),
          );
  }
}
