import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/common/custom_cherry.dart';
import 'package:lotuserp_comanda/page/common/loading_screen.dart';
import 'package:lotuserp_comanda/service/send_request_bill.dart';

import '../../../../../utils/dependencies.dart';
import '../../../../../utils/methods/order/order_features.dart';

class LogicButtonsQuantityPeople {
  final _orderFeatures = OrderFeatures.instance;
  final _orderController = Dependencies.orderController();

  LogicButtonsQuantityPeople._privateConstructor();

  static final LogicButtonsQuantityPeople instance =
      LogicButtonsQuantityPeople._privateConstructor();

  void backButton() {
    Get.back();
    _orderFeatures.clearNumberPeopleController();
  }

  Future<void> confirmButton(BuildContext context) async {
    if (_isNumberPeopleInvalid()) {
      const CustomCherryError(message: 'Selecione pelo menos uma pessoa')
          .show(context);
      return;
    }

    Get.dialog(const LoadingScreen());
    SendRequestBill().send();
  }

  bool _isNumberPeopleInvalid() {
    return _orderController.numberPeopleController.text == '' ||
        _orderController.numberPeopleController.text == '0';
  }
}
