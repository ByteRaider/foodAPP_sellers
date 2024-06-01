import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? data;
  final String? hintText;
  final bool? isObscure;
  final bool? enabled = true;

  const CustomTextField(
      {super.key, this.controller, this.data, this.hintText, this.isObscure});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        obscureText: isObscure!,
        enabled: enabled,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(data, color: Theme.of(context).secondaryHeaderColor),
          hintText: hintText,
        ),
      ),
    );
  }
}
