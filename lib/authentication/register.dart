import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mexa_sellers_app/theme/app_theme.dart';
import 'package:mexa_sellers_app/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
// Form key
  final _formKey = GlobalKey<FormState>();
// Text Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
//   Geo Location
  Position? position;
  List<Placemark> placeMarks = [];
// Image Picker
  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();

// Image Picker Function
  Future<void> _getImage() async {
    // Allow user to pick image from gallery
    imageXFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageXFile;
    });
  }

// Allow user to get geo location
  getCurrentLocation() async {
    // Check if location is enabled
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    // Get Current Position
    Position newPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    position = newPosition;
    // Get place marks
    placeMarks =
        await placemarkFromCoordinates(position!.latitude, position!.longitude);
    Placemark pMark = placeMarks[0];
    // Get complete address
    String completeAddress =
        '${pMark.subThoroughfare} ${pMark.thoroughfare}, ${pMark.subLocality} ${pMark.locality}, ${pMark.subAdministrativeArea}, ${pMark.administrativeArea} ${pMark.postalCode}, ${pMark.country}';
    locationController.text = completeAddress;
  }

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
              onTap: () {
                _getImage();
              },
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
            const SizedBox(
              height: 10,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: nameController,
                    data: Icons.person,
                    hintText: "Name",
                    isObscure: false,
                  ),
                  CustomTextField(
                    controller: phoneController,
                    data: Icons.phone,
                    hintText: "Phone",
                    isObscure: false,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    data: Icons.lock,
                    hintText: "Password",
                    isObscure: true,
                  ),
                  CustomTextField(
                    controller: confirmPasswordController,
                    data: Icons.lock,
                    hintText: "Confirm Password",
                    isObscure: true,
                  ),
                  CustomTextField(
                    controller: emailController,
                    data: Icons.email,
                    hintText: "Email",
                    isObscure: false,
                  ),
                  CustomTextField(
                    controller: locationController,
                    data: Icons.location_pin,
                    hintText: "Location",
                    isObscure: false,
                    enabled: false,
                  ),
                  Container(
                    width: 400,
                    height: 50,
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                      label: const Text(
                        "Get my current location",
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: const Icon(
                        Icons.location_on,
                        color: AppTheme.iconCOlor2,
                      ),
                      onPressed: () => getCurrentLocation(),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.background,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )),
                    ),
                  )
                ],
              ),
            ), //form
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.accent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )),
              onPressed: () => print("clicked"),
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  color: AppTheme.secondary,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ], //children
        ),
      ),
    );
  }
}
