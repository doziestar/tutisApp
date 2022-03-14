import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../models/tab_model.dart';
import 'application_info.dart';
import 'help.dart';
import 'home.dart';
import 'profile.dart';
import 'settings.dart';

class TabScreen extends StatefulWidget {
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<TabScreenModel> _screens = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    _screens = <TabScreenModel>[
      TabScreenModel(
        screen: HomeScreen(),
        title: 'Home',
        icon: Icons.home,
        selectedIcon: FontAwesomeIcons.home,
      ),
      TabScreenModel(
        screen: AccountScreen(),
        title: 'Application Info',
        icon: Icons.apps,
        selectedIcon: FontAwesomeIcons.info,
      ),
      TabScreenModel(
        screen: UserScreen(),
        title: 'User Info',
        icon: FontAwesomeIcons.user,
        selectedIcon: FontAwesomeIcons.userAlt,
      ),
      TabScreenModel(
        screen: SettingsScreen(),
        title: 'Settings',
        icon: Icons.settings,
        selectedIcon: FontAwesomeIcons.cog,
      ),
    ];
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            // child: SafeArea(child: _screens[_selectedIndex].screen),
            navigationBar: CupertinoNavigationBar(
              middle: Text(_screens[_selectedIndex].title),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: const Icon(CupertinoIcons.bell),
                      onPressed: () {},
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: const Icon(CupertinoIcons.question),
                      onPressed: () {
                        Navigator.of(context).pushNamed(Help.routeName);
                      },
                    ),
                  ],
                ),
              ),
            ),
            child: CupertinoTabScaffold(
              tabBar: CupertinoTabBar(
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.app),
                    label: 'Application Info',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.person),
                    label: 'User Info',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.settings),
                    label: 'Settings',
                  ),
                ],
              ),
              tabBuilder: (BuildContext context, int index) {
                return CupertinoTabView(
                  builder: (BuildContext context) {
                    return SafeArea(child: _screens[index].screen);
                  },
                );
              },
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(_screens[_selectedIndex].title),
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications_none),
                  onPressed: () => {},
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.question),
                  onPressed: () {
                    Navigator.of(context).pushNamed(Help.routeName);
                  },
                ),
              ],
            ),
            bottomNavigationBar: NavigationBarTheme(
              data: NavigationBarThemeData(
                backgroundColor:
                    Theme.of(context).navigationBarTheme.backgroundColor,
                indicatorColor:
                    Theme.of(context).navigationBarTheme.indicatorColor,
                iconTheme: Theme.of(context).navigationBarTheme.iconTheme,
                labelTextStyle:
                    Theme.of(context).navigationBarTheme.labelTextStyle,
                labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              ),
              child: NavigationBar(
                animationDuration: const Duration(milliseconds: 300),
                destinations: _screens.map((TabScreenModel model) {
                  return NavigationDestination(
                    icon: Icon(model.icon),
                    label: model.title,
                    selectedIcon: Icon(model.selectedIcon),
                  );
                }).toList(),
                onDestinationSelected: _onItemTapped,
                selectedIndex: _selectedIndex,
              ),
            ),
            body: _screens[_selectedIndex].screen,
          );
  }
}
