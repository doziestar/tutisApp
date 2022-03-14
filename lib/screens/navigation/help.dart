import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  static const String routeName = '/help';
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
              middle: Text('Help'),
            ),
            child: Material(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'Help & Support',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            'IP: 189.2893****839',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                        Divider(
                          thickness: 5,
                          color: Theme.of(context).dividerColor,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: ListTileTheme(
                            data: ListTileThemeData(
                                tileColor:
                                    Theme.of(context).listTileTheme.tileColor,
                                textColor:
                                    Theme.of(context).listTileTheme.textColor,
                                style: ListTileStyle.list),
                            child: ListView(
                              children: [
                                ListTile(
                                  // leading: const Icon(Icons.abc),s
                                  title: Text(
                                    'How To Use Tutis-ID',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ),
                                // const Divider(),
                                ListTile(
                                  // leading: const Icon(Icons.abc),s
                                  title: Text(
                                    'How To Use Tutis-ID',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ),
                                // const Divider(),
                                ListTile(
                                  // leading: const Icon(Icons.abc),s
                                  title: Text(
                                    'How To Use Tutis-ID',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ),
                                const Divider()
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('Help'),
            ),
            body: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Help & Support',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Text(
                          'IP: 189.2893****839',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      Divider(
                        thickness: 5,
                        color: Theme.of(context).dividerColor,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: ListTileTheme(
                          data: ListTileThemeData(
                              tileColor:
                                  Theme.of(context).listTileTheme.tileColor,
                              textColor:
                                  Theme.of(context).listTileTheme.textColor,
                              style: ListTileStyle.list),
                          child: ListView(
                            children: [
                              ListTile(
                                // leading: const Icon(Icons.abc),s
                                title: Text(
                                  'How To Use Tutis-ID',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                              // const Divider(),
                              ListTile(
                                // leading: const Icon(Icons.abc),s
                                title: Text(
                                  'How To Use Tutis-ID',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                              // const Divider(),
                              ListTile(
                                // leading: const Icon(Icons.abc),s
                                title: Text(
                                  'How To Use Tutis-ID',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                              const Divider()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
