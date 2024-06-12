import 'package:flutter/material.dart';

abstract class ILogicColorsOrder {
  Color getColorsCard(int status);
  Color getColorsButton(int indexButton);
  TextStyle getColorsTextButton(int indexButton);
}
