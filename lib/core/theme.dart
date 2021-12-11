import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class AppTheme {
  static ThemeData lightTheme() => ThemeData(
        appBarTheme: const AppBarTheme(
          color: surfaceColor,
        ),
        fontFamily: 'SF-Pro-Display',
        scaffoldBackgroundColor: backgroundColor,
        canvasColor: backgroundColor,
        splashColor: Colors.transparent,
        textTheme: const TextTheme(
          bodyText1: bodyText1,
          bodyText2: bodyText2,
        ),
        backgroundColor: backgroundColor,
        colorScheme: const ColorScheme(
          surface: surfaceColor,
          background: backgroundColor,
          brightness: Brightness.light,
          error: errorColor,
          onError: errorColor,
          onBackground: backgroundColor,
          onPrimary: backgroundColor,
          onSecondary: backgroundColor,
          onSurface: backgroundColor,
          primary: backgroundColor,
          secondary: backgroundColor,
          primaryVariant: backgroundColor,
          secondaryVariant: backgroundColor,
        ),
      );

  static const backgroundColor = Colors.black;
  static const surfaceColor = Color(0xff1B1F23);
  static const errorColor = Colors.red;
  static const textGreyLight = Color(0xff6A737D);
  static const primaryTextColor = Color(0xff0366D6);
  static const bodyText1 = TextStyle(
    fontFamily: 'SF-Pro-Display',
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: textGreyLight,
  );

  static const bodyText2 = TextStyle(
    fontFamily: 'SF-Pro-Display',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
