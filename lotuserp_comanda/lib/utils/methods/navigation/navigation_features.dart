import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/order/service/logic/logic_update_tables.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';

import '../../../core/enum/pages_index.dart';

class NavigationFeatures {
  final _navigationFeatures = Dependencies.navigationController();

  NavigationFeatures._privateConstructor();

  static final NavigationFeatures _instance =
      NavigationFeatures._privateConstructor();

  static NavigationFeatures get instance => _instance;

  Future<void> changePage(int page) async {
    if (page == PagesIndex.ORDER.index) {
      _navigationFeatures.pc.value.animateToPage(page,
          duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
      _navigationFeatures.update();
      await LogicUpdateTables().updateTables(context: Get.context);
    }
    _navigationFeatures.pc.value.animateToPage(page,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
    _navigationFeatures.update();
  }

  void setPaginaAtual(int page) {
    _navigationFeatures.paginaAtual.value = page;
    _navigationFeatures.update();
  }

  
}
