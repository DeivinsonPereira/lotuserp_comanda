// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/core/size_screen.dart';
import 'package:lotuserp_comanda/page/common/custom_cherry.dart';
import 'package:lotuserp_comanda/page/order/service/interface/i_navigation_pdv.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/name/name_dialog.dart';
import 'package:lotuserp_comanda/utils/methods/order/order_bool.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/features/pdv_update.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/get/pdv_bool.dart';

import '../../../pdv/pages/pdv_mobile.dart';
import '../../../pdv/pages/pdv_monitor.dart';

class NavigationPdv implements INavigationPdv {
  final _pdvFeatures = PdvUpdate.instance;
  final _pdvBool = PdvBool.instance;
  final _orderBool = OrderBool.instance;

  @override
  Future<void> navigation({BuildContext? context}) async {
    if (_orderBool.isInvalidTable()) {
      const CustomCherryError(message: 'Mesa Inválida.').show(Get.context!);
      return;
    }

    if (_doHasNoName()) {
      Get.dialog(barrierDismissible: false, const NameDialog());
      return;
    }

    if (SizeScreen.isMobile) {
      _navigation(const PdvMobile());
      return;
    }

    _navigation(const PdvMonitor());
  }

  _navigation(Widget page) {
    _pdvFeatures.setGroupSelected(0);
    Get.to(() => page, transition: Transition.rightToLeft);
  }

  bool _doHasNoName() {
    return SizeScreen.isMobile &&
        _orderBool.isTableFree() &&
        !_pdvBool.hasNameOnCommand();
  }
}
