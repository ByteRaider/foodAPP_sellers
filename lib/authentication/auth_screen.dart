import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.purple, Colors.deepPurple.shade300],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: const [0.0, 1.0],
                      tileMode: TileMode.clamp)),
            ),
            title: const Text(
              "Vende tu comida en linea",
              style: TextStyle(fontFamily: "Lobster"),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "Login",
                  icon: Icon(Icons.lock),
                ),
                Tab(
                  text: "Register",
                  icon: Icon(Icons.person_add),
                ),
              ],
              indicatorColor: Colors.white38,
              indicatorWeight: 5,
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.purple,
                Colors.deepPurple,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            )),
            child: const TabBarView(
              children: [
                Text("Login"),
                Text("Register"),
              ],
            ),
          ),
        ));
  }
}
