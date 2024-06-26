import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/order/enum/status_comandas.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/extrato/logic/logic_get_status_description.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';

import '../../../../common/custom_cherry.dart';
import '../components/quantity_people.dart';

class LogicButtonsExtrato {
  final _orderController = Dependencies.orderController();

  LogicButtonsExtrato._privateConstructor();

  static final LogicButtonsExtrato instance =
      LogicButtonsExtrato._privateConstructor();

  void backButton(BuildContext context) {
    Get.back();
    FocusScope.of(context).unfocus();
  }

  void requestBillButton() {
    if (_isTableValid()) {
      Get.dialog(const QuantityPeople(), barrierDismissible: false);
      return;
    }
    CustomCherryError(
            message:
                'Mesa inválida em status de ${LogicGetStatusDescription.getStatusDescription(_orderController.tableSelected.value.status ?? 0)}.')
        .show(Get.context!);
  }

  bool _isTableValid() {
    return _orderController.tableSelected.value.status ==
            StatusComandas.LIVRE.index ||
        _orderController.tableSelected.value.status ==
            StatusComandas.OCUPADA.index;
  }
}
