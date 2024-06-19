import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/core/size_screen.dart';
import 'package:lotuserp_comanda/utils/methods/order/order_features.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/features/pdv_update.dart';

import '../../../pages/pdv_mobile.dart';

class LogicConfirmName {
  final _orderFeatures = OrderFeatures.instance;
  final _pdvUpdate = PdvUpdate.instance;

  void updateName(BuildContext context) async {
    _orderFeatures.updateName();
    _orderFeatures.nameToOrderTable();

    if (SizeScreen.isMobile) {
      Get.back();
      _navigation(const PdvMobile());
      return;
    }

    Get.back();
  }

  _navigation(Widget page) {
    _pdvUpdate.setGroupSelected(0);
    Get.to(() => page, transition: Transition.rightToLeft);
  }
}
