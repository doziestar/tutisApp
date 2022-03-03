import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

final ThemeData darkTheme = FlexThemeData.dark(
  colors: const FlexSchemeColor(
    primary: Color(0xff004e15),
    primaryVariant: Color(0xff00411f),
    secondary: Color(0xff007256),
    secondaryVariant: Color(0xff295300),
    appBarColor: Color(0xff295300),
    error: Color(0xff790000),
  ).defaultError.toDark(35),
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 18,
  appBarStyle: FlexAppBarStyle.background,
  appBarOpacity: 0.95,
  appBarElevation: 0,
  transparentStatusBar: true,
  tabBarStyle: FlexTabBarStyle.forAppBar,
  tooltipsMatchBackground: true,
  swapColors: true,
  darkIsTrueBlack: true,
  useSubThemes: true,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  // To use playground font, add GoogleFonts package and uncomment:
  // fontFamily: GoogleFonts.notoSans().fontFamily,
  subThemesData: const FlexSubThemesData(
    useTextTheme: true,
    fabUseShape: true,
    interactionEffects: true,
    bottomNavigationBarElevation: 0,
    bottomNavigationBarOpacity: 0.95,
    navigationBarOpacity: 0.95,
    navigationBarMutedUnselectedText: true,
    navigationBarMutedUnselectedIcon: true,
    inputDecoratorIsFilled: true,
    inputDecoratorBorderType: FlexInputBorderType.outline,
    inputDecoratorUnfocusedHasBorder: true,
    blendOnColors: true,
    blendTextTheme: false,
    popupMenuOpacity: 0.95,
  ),
);
