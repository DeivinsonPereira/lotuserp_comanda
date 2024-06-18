// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';

class CustomHeader extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  bool? hasIcon = false;

  CustomHeader({
    Key? key,
    this.onPressed,
    required this.title,
    this.hasIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _configController = Dependencies.configController();

    return Container(
      height: 60,
      width: Get.size.width,
      color: _configController.selectedColor.value.color,
      child: Row(children: [
        if (hasIcon == true) ...{
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        },
        Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ]),
    );
  }
}
