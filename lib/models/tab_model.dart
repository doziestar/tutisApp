import 'package:flutter/material.dart';

class TabScreenModel {
  final Widget screen;
  final String title;
  final IconData icon;
  final IconData selectedIcon;

  TabScreenModel({
    required this.screen,
    required this.title,
    required this.icon,
    required this.selectedIcon,
  });
}
