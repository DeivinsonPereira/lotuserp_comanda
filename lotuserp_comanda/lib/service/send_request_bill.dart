import 'dart:convert';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_comanda/page/common/custom_cherry.dart';
import 'package:lotuserp_comanda/shared/components/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:lotuserp_comanda/utils/methods/order/order_features.dart';
import 'package:lotuserp_comanda/utils/quantity_back.dart';

import '../page/order/service/logic/logic_update_tables.dart';
import '../shared/components/header.dart';
import '../utils/dependencies.dart';

class SendRequestBill {
  final _orderFeatures = OrderFeatures.instance;
  final _orderController = Dependencies.orderController();

  final _logger = Logger();

  Future<void> send() async {
    try {
      Uri uri = Uri.parse(Endpoints()
          .sendRequestBill(_orderController.numberPeopleController.text));

      var response = await http.get(uri, headers: Header.getBasicHeader());

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        if (data['success'] == true) {
          _handleSuccess();
          return;
        }
        _handleError(data['message']);
        return;
      }
      _handleError(response.statusCode.toString());
      return;
    } catch (e) {
      _handleError(e.toString());
      return;
    }
  }

  Future<void> _handleSuccess() async {
    QuantityBack.back(3);
    await LogicUpdateTables().updateTables(context: Get.context!);
    _orderFeatures.clearNumberPeopleController();
  }

  void _handleError(String message) {
    _logger.e('Erro: $message');
    const CustomCherryError(
            message: 'Erro: Não foi possível solicitar a conta.')
        .show(Get.context!);
    Get.back();
  }
}
