import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/common/loading_screen.dart';
import 'package:lotuserp_comanda/service/send_order.dart';

class LogicSendOrder {
  Future<void> send(BuildContext context) async {
    Get.dialog(const LoadingScreen());
    SendOrder().toServer(context);
  }
}
