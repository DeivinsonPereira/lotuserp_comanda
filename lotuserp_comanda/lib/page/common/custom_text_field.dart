// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/format_txt.dart';
import 'package:lotuserp_comanda/utils/methods/config/config_features.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController controller;
  final bool? isNumeric;
  final List<TextInputFormatter>? inputFormatter;
  bool? isSecret;

  CustomTextField(
      {super.key,
      required this.labelText,
      this.prefixIcon,
      this.suffixIcon,
      required this.controller,
      this.isNumeric = false,
      this.inputFormatter,
      this.isSecret = false});

  @override
  Widget build(BuildContext context) {
    final _configController = Dependencies.configController();
    final _configFeatures = ConfigFeatures.instance;
    return TextField(
      inputFormatters: [...?inputFormatter, UpperCaseTxt()],
      obscureText: isSecret == true ? _configController.isObscure.value : false,
      keyboardType:
          isNumeric == true ? TextInputType.number : TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: labelText,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: () => _configFeatures.toggleIsObscure(),
                  icon: Icon(suffixIcon))
              : null),
    );
  }
}
