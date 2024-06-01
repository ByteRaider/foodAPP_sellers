import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mexa_sellers_app/theme/app_theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController anyController = TextEditingController();
  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(2),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            InkWell(
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.20,
                backgroundColor: AppTheme.primary,
                backgroundImage: imageXFile == null
                    ? null
                    : FileImage(File(imageXFile!.path)),
                child: imageXFile == null
                    ? Icon(
                        Icons.add_photo_alternate,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width * 0.20,
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
