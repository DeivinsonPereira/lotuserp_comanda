import 'package:flutter/material.dart';
import 'package:lotuserp_comanda/controller/order_controller.dart';
import 'package:lotuserp_comanda/page/order/service/interface/i_logic_colors_order.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';

import '../../../../utils/custom_colors.dart';

class LogicColors implements ILogicColorsOrder {
  final OrderController _orderController = Dependencies.orderController();

  @override
  Color getColorsCard(int status) {
    switch (status) {
      case 0:
        return CustomColors.confirmButtonColor;
      case 1:
        return Colors.red;
      case 2:
        return CustomColors.primaryColor;
      case 3:
        return const Color.fromARGB(255, 139, 139, 139);
      case 4:
        return Colors.orange;
      case 5:
        return Colors.purple;
      default:
        return CustomColors.informationBox;
    }
  }

  @override
  Color getColorsButton(int indexButton) {
    if (indexButton == _orderController.buttonSelected.value) {
      return CustomColors.secondaryColor;
    }
    return Colors.white;
  }

  @override
  TextStyle getColorsTextButton(int indexButton) {
    double fontSize = 15;

    if (indexButton == _orderController.buttonSelected.value) {
      return CustomTextStyle.whiteBoldText(fontSize);
    }
    return CustomTextStyle.blackBoldText(fontSize);
  }
}
