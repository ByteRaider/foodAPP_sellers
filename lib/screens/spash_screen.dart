import 'package:flutter/material.dart';

class MySplashScreen extends StatefulWidget {
  MySplashScreen({Key? key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
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
                  style: TextStyle(color: Colors.black))),
        ],
      ),
    );
  }
}
