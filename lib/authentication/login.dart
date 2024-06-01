import 'package:flutter/material.dart';
import 'package:mexa_sellers_app/theme/app_theme.dart';
import 'package:mexa_sellers_app/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const _LogoContainer(),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: emailController,
                  data: Icons.email,
                  hintText: "Email",
                  isObscure: false,
                  enabled: true,
                ),
                CustomTextField(
                  controller: passwordController,
                  data: Icons.lock,
                  hintText: "Password",
                  isObscure: true,
                  enabled: true,
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.background,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            ),
            onPressed: () {
              print("Clicked");
            },
            child: const Text(
              "Login",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class _LogoContainer extends StatelessWidget {
  const _LogoContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset("images/seller.png",
            width: MediaQuery.of(context).size.width * 0.5),
      ),
    );
  }
}
