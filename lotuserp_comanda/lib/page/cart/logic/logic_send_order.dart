import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/common/custom_cherry.dart';
import 'package:lotuserp_comanda/page/common/loading_screen.dart';
import 'package:lotuserp_comanda/service/send_order.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/get/pdv_get.dart';

class LogicSendOrder {
  final _pdvGet = PdvGet.instance;

  Future<void> send(BuildContext context) async {
    if(_pdvGet.getQuantityOrdersInOrderTicketsList() < 1) {
      const CustomCherryError(message: 'Nenhum item no carrinho!').show(context);
      return;
    }
    Get.dialog(const LoadingScreen());
    SendOrder().toServer(context);
  }
}
