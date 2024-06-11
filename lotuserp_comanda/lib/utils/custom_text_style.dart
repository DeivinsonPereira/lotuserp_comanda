import 'package:flutter/material.dart';

class CustomTextStyle {
  CustomTextStyle._privateConstructor();

  static TextStyle blackBoldText(double fontSize) {
    return TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: fontSize);
  }

  static TextStyle blackText(double fontSize) {
    return TextStyle(color: Colors.black, fontSize: fontSize);
  }

  static TextStyle whiteBoldText(double fontSize) {
    return TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: fontSize);
  }

  static TextStyle whiteText(double fontSize) {
    return TextStyle(color: Colors.white, fontSize: fontSize);
  }
}
