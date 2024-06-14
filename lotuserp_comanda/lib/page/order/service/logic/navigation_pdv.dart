// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/order/service/interface/i_navigation_pdv.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/pdv_features.dart';

import '../../../pdv/pdv_page.dart';

class NavigationPdv implements INavigationPdv {
  final _pdvFeatures = PdvFeatures.instance;

  @override
  Future<void> navigation({BuildContext? context}) async {
    _pdvFeatures.setGroupSelected(0);
    Get.to(() => const PdvPage());
  }
}
