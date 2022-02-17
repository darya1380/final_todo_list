
import 'package:flutter/material.dart';

class Themes
{
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blueGrey[300], appBarTheme: AppBarTheme(
    brightness: Brightness.light, textTheme: TextTheme(
    headline6: TextStyle(
      color: Colors.black
    )
  )
  ),
    buttonColor: Colors.pinkAccent
  );
  final darkTheme = ThemeData.dark().copyWith(
      primaryColor: Colors.blueGrey[800], appBarTheme: AppBarTheme(
      brightness: Brightness.dark, textTheme: TextTheme(
      headline6: TextStyle(
          color: Colors.white
      )
  )
  ),buttonColor: Colors.pinkAccent
  );
}