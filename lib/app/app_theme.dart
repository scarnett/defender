import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static Color get backgroundColor => const Color.fromRGBO(34, 34, 34, 1.0);
  static Color get primaryColor => const Color.fromRGBO(250, 248, 24, 1.0);
  static Color get dangerColor => Colors.red;
  static String get fontFamily => 'Orbitron';
}

class ButtonStyles {
  static ButtonStyle getDefaultTextButtonStyle() => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(AppTheme.primaryColor),
        foregroundColor: MaterialStateProperty.all<Color>(AppTheme.backgroundColor),
        overlayColor: MaterialStateProperty.all<Color>(AppTheme.primaryColor),
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(10.0),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
        ),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontFamily: AppTheme.fontFamily,
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.0,
          ),
        ),
      );

  static ButtonStyle getSimpleTextButtonStyle() => ButtonStyles.getDefaultTextButtonStyle().copyWith(
        backgroundColor: MaterialStateProperty.all<Color>(AppTheme.backgroundColor),
        foregroundColor: MaterialStateProperty.all<Color>(AppTheme.primaryColor),
        overlayColor: MaterialStateProperty.all<Color>(AppTheme.backgroundColor),
      );
}

ThemeData appThemeData = ThemeData(
  scaffoldBackgroundColor: AppTheme.backgroundColor,
  primaryColor: AppTheme.primaryColor,
  fontFamily: AppTheme.fontFamily,
  appBarTheme: AppBarTheme(
    backgroundColor: AppTheme.backgroundColor,
    centerTitle: true,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: AppTheme.primaryColor,
    ),
    titleTextStyle: TextStyle(
      color: AppTheme.primaryColor,
      fontFamily: AppTheme.fontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.0,
    ),
  ),
  cupertinoOverrideTheme: CupertinoThemeData(
    primaryColor: AppTheme.primaryColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppTheme.primaryColor),
      borderRadius: BorderRadius.circular(0.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppTheme.primaryColor),
      borderRadius: BorderRadius.circular(0.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppTheme.primaryColor),
      borderRadius: BorderRadius.circular(0.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppTheme.primaryColor),
      borderRadius: BorderRadius.circular(0.0),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 10.0,
      vertical: 10.0,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    labelStyle: TextStyle(
      color: AppTheme.primaryColor,
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.0,
    ),
    errorStyle: TextStyle(
      color: AppTheme.dangerColor,
      fontSize: 10.0,
      fontWeight: FontWeight.w100,
      height: 1.0,
      letterSpacing: 1.0,
    ),
  ),
  dividerTheme: const DividerThemeData(
    space: 1.0,
    thickness: 1.0,
  ),
  textTheme: TextTheme(
    titleSmall: TextStyle(
      color: AppTheme.primaryColor,
      fontFamily: AppTheme.fontFamily,
    ),
    titleMedium: TextStyle(
      color: AppTheme.primaryColor,
      fontFamily: AppTheme.fontFamily,
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.0,
    ),
    titleLarge: TextStyle(
      color: AppTheme.primaryColor,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.0,
    ),
    displaySmall: TextStyle(
      color: AppTheme.primaryColor,
      fontFamily: AppTheme.fontFamily,
      fontSize: 10.0,
      letterSpacing: 1.0,
    ),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppTheme.primaryColor,
    selectionColor: AppTheme.primaryColor.withOpacity(0.25),
    selectionHandleColor: AppTheme.primaryColor,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyles.getDefaultTextButtonStyle(),
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: AppTheme.primaryColor,
    contentTextStyle: TextStyle(
      color: AppTheme.backgroundColor,
      fontFamily: AppTheme.fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 18.0,
      letterSpacing: 1.0,
    ),
  ),
);
