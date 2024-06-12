// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:lotuserp_comanda/utils/format_txt.dart';

class CustomTextFieldFiveLines extends StatelessWidget {
  final TextEditingController controller;
  String? textHint;
  int? maxLines;
  CustomTextFieldFiveLines({
    Key? key,
    required this.controller,
    this.textHint = '',
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        inputFormatters: [UpperCaseTxt()],
        keyboardType: TextInputType.text,
        maxLines: maxLines,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          hintText: textHint,
        ),
        controller: controller,
      ),
    );
  }
}
