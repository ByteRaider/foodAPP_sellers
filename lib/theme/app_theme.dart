import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.green;
  static const Color secondary = Colors.deepPurpleAccent;
  static const Color background = Colors.black54;
  static const Color iconColor = Colors.white60;
  static const Color iconCOlor2 = Colors.pinkAccent;
  static const Color accent = Colors.purpleAccent;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(backgroundColor: primary, elevation: 0),
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black),
    primaryColor: Colors.black,
  );
}
