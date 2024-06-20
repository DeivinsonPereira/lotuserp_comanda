import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';

class LogicTitleOrderTable {
  final _orderController = Dependencies.orderController();

  Widget build() {
    return Obx(() {
      switch (_orderController.buttonSelected.value) {
        case 0:
          return _buildTitle('Todas');
        case 1:
          return _buildTitle('Livres');
        case 2:
          return _buildTitle('Ocupadas');
        case 3:
          return _buildTitle('Contas');
        case 4:
          return _buildTitle('Reservadas');
        default:
          return _buildTitle('Todas');
      }
    });
  }

  Widget _buildTitle(String text) {
    return Text(text, style: CustomTextStyle.blackBoldText(30));
  }
}
