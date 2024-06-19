import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  
}
