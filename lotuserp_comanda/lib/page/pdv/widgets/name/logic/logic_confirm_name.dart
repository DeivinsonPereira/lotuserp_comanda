import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/utils/methods/order/order_features.dart';

class LogicConfirmName {
  final _orderFeatures = OrderFeatures.instance;

  void updateName(BuildContext context) async {
    _orderFeatures.updateName();
    _orderFeatures.nameToOrderTable();
    Get.back();
  }
}
