import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.green;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(backgroundColor: primary, elevation: 0),
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black),
    primaryColor: Colors.black,
  );
}
