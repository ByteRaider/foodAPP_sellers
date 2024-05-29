import 'package:flutter/material.dart';
import 'screens/spash_screen.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String text = 'Sellers App';

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: text,
      theme: AppTheme.lightTheme,
      home: const MySplashScreen(),
    );
  }
}
