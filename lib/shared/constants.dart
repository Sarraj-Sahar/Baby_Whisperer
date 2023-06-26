import 'package:flutter/material.dart';

const Color splashLilac = Color.fromARGB(255, 202, 207, 253);
const Color splashPink = Color.fromARGB(255, 255, 218, 216);
const Color splashBlue = Color.fromARGB(255, 183, 231, 254);
const Color splashActiveDot = Color.fromARGB(255, 169, 141, 255);
const Color kprimaryColor = Color.fromARGB(255, 169, 169, 255);
const Color kbackground = Color.fromARGB(255, 229, 250, 255);
const Color kContentColorLightTheme = Color(0xFF1D1D35);
const Color kContentColorDarkTheme = Color(0xFFF5FCF9);
const Color kWarninngColor = Color(0xFFF3BB1C);
const Color kErrorColor = Color(0xFFF03738);

const defaultPadding = 20.0;

const logoDarkTheme = "assets/icons/Logo_dark_theme.svg";
const logoLightTheme = "assets/icons/Logo_light_theme.svg";

const requiredField = "This field is required";
const invalidEmail = "Enter a valid email address";

const InputDecoration otpInputDecoration = InputDecoration(
  filled: false,
  border: UnderlineInputBorder(),
  hintText: "0",
);

InputDecoration formInputDecoration = InputDecoration(
    focusColor: kprimaryColor.withOpacity(0.2),
    disabledBorder: InputBorder.none,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kprimaryColor),
      borderRadius: BorderRadius.circular(10.0),
    )
    // enabledBorder: UnderlineInputBorder(
    //   borderSide: BorderSide(color: Colors.grey),
    //   borderRadius: BorderRadius.circular(10.0),
    // ),
    // fillColor: kprimaryColor.withOpacity(0.2),
    );
