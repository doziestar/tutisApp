import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final BottomNavigationBar myBottomBar = BottomNavigationBar(
  iconSize: 30,
  showSelectedLabels: true,
  showUnselectedLabels: true,
  items: [
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.home : Icons.home),
      activeIcon:
          Icon(Platform.isIOS ? CupertinoIcons.house_alt_fill : Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.app : Icons.apps),
      activeIcon: Icon(Platform.isIOS ? CupertinoIcons.app_fill : Icons.apps),
      label: 'Application Info',
    ),
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.person : Icons.person),
      activeIcon:
          Icon(Platform.isIOS ? CupertinoIcons.person_solid : Icons.person),
      label: 'Profile',
    ),
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.settings : Icons.settings),
      activeIcon:
          Icon(Platform.isIOS ? CupertinoIcons.settings_solid : Icons.settings),
      label: 'Settings',
    ),
  ],
);
