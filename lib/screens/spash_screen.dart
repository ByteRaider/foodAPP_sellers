import 'dart:async';

import 'package:flutter/material.dart';

import '../authentication/auth_screen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  MySplashScreenState createState() => MySplashScreenState();
}

class MySplashScreenState extends State<MySplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 6), () async {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const AuthScreen()));
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/splash.jpg"),
          const SizedBox(height: 10.0),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Vende tu comida en linea",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                      letterSpacing: 3.0,
                      fontFamily: "Signatra"))),
        ],
      ),
    );
  }
}
