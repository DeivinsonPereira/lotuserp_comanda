import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/core/enum/pages_index.dart';

import '../page/order/service/logic/logic_update_tables.dart';

class NavigationController extends GetxController {
  List<Widget> pages = <Widget>[];

  RxInt paginaAtual = 0.obs;
  late Rx<PageController> pc;

  @override
  void onInit() {
    super.onInit();
    paginaAtual.value = 0;
    pc = PageController(initialPage: paginaAtual.value).obs;
  }

  Future<void> changePage(int page) async {
    if (page == PagesIndex.ORDER.index) {
      pc.value.animateToPage(page,
          duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
      update();
      await LogicUpdateTables().updateTables(context: Get.context);
    }
    pc.value.animateToPage(page,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
    update();
  }

  void setPaginaAtual(int page) {
    paginaAtual.value = page;
    update();
  }
}
