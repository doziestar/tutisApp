import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // width: MediaQuery.of(context).size.width * 0.9,
          margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
          padding: const EdgeInsets.all(10),
          child: Column(children: <Widget>[
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.3,
            //   child: Card(
            //     color: Theme.of(context).cardColor,
            //     elevation: 30,
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         const CircleAvatar(
            //           radius: 50,
            //           backgroundImage: AssetImage('assets/images/user.jpeg'),
            //         ),
            //         const SizedBox(height: 10),
            //         Text(
            //           'Femi Olaoluwa',
            //           style: Theme.of(context).textTheme.headline6,
            //         ),
            //         const SizedBox(height: 10),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Icon(FontAwesomeIcons.mailBulk,
            //                 color: Theme.of(context).iconTheme.color),
            //             const SizedBox(width: 10),
            //             Text(
            //               'chidosiky2015@gmail.com',
            //               style: Theme.of(context).textTheme.subtitle1,
            //             )
            //           ],
            //         ),
            //         const SizedBox(height: 10),
            //         OutlinedButton(
            //           onPressed: () {},
            //           child: Text('Authenticate For Registration',
            //               style: Theme.of(context).textTheme.titleSmall),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(
              // height: MediaQuery.of(context).size.height * 0.7,
              // width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    // width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Settings',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          title: FittedBox(
                            child: Text(
                              'Open app on incoming notifications',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          subtitle: Text(
                            'on',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          trailing: Switch.adaptive(
                            value: true,
                            onChanged: (value) {},
                          ),
                        ),
                        ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          title: Text(
                            'Allow ScreenShot',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          subtitle: Text(
                            'on',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          trailing: Switch.adaptive(
                            value: false,
                            onChanged: (value) {},
                          ),
                        ),
                        ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          title: Text(
                            'Allow Pin Pad Sound',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          subtitle: Text(
                            'on',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          trailing: Switch.adaptive(
                            value: false,
                            onChanged: (value) {},
                          ),
                        ),
                        ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          title: Text(
                            'Allow Pin Pad Vibration',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          subtitle: Text(
                            'on',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          trailing: Switch.adaptive(
                            value: false,
                            onChanged: (value) {},
                          ),
                        ),
                        ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            title: Text(
                              'Reset Push Notification',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                Platform.isIOS
                                    ? CupertinoIcons.refresh
                                    : Icons.restore,
                                size: 30,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              onPressed: () {},
                            )),
                        ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            title: Text(
                              'Delete Account',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Platform.isIOS
                                      ? CupertinoIcons.delete
                                      : Icons.delete_forever,
                                  color: Theme.of(context).iconTheme.color,
                                  size: 30,
                                ))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton(
                      onPressed: () {
                        Provider.of<Auth>(context, listen: false).logout();
                      },
                      child: Text('Logout',
                          style: Theme.of(context).textTheme.titleSmall)),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
