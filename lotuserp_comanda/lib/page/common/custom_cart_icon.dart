// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/get/pdv_get.dart';

import '../../utils/custom_colors.dart';

class CustomCartIcon extends StatelessWidget {
  final Function() function;
  final bool isCart;
  const CustomCartIcon({
    Key? key,
    required this.function,
    this.isCart = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double _position = 20.0;
    final _pdvGet = PdvGet.instance;

    return InkWell(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Container(
          width: Get.size.width * 0.15,
          decoration: BoxDecoration(
            color: CustomColors.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Center(
            child: Stack(
              children: [
                const SizedBox(
                  width: 40,
                  height: 40,
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  bottom: _position,
                  left: _position,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: !isCart
                          ? Obx(() => Text(
                                _pdvGet
                                    .getQuantityOrdersInOrderTicketsList()
                                    .toString(),
                                style: CustomTextStyle.whiteBoldText(12),
                              ))
                          : Obx(() => Text(
                              _pdvGet.getQuantityCartShopping().toString(),
                              style: CustomTextStyle.whiteBoldText(12))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
