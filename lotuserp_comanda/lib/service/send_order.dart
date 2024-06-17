import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_comanda/model/item_cart_shopping.dart';
import 'package:lotuserp_comanda/model/order.dart';
import 'package:lotuserp_comanda/model/order_item.dart';
import 'package:lotuserp_comanda/page/common/custom_cherry.dart';
import 'package:lotuserp_comanda/shared/components/endpoints.dart';
import 'package:lotuserp_comanda/shared/components/header.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/features/pdv_remove.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/get/pdv_get.dart';
import 'package:http/http.dart' as http;
import 'package:lotuserp_comanda/utils/quantity_back.dart';

class SendOrder {
  final _pdvGet = PdvGet.instance;
  final _pdvRemove = PdvRemove.instance;
  final _pdvController = Dependencies.pdvController();
  final _configController = Dependencies.configController();

  final _logger = Logger();

  final String errorMessage = 'Erro ao enviar pedido';

  Future<void> toServer(BuildContext context) async {
    Uri uri = Uri.parse(Endpoints().sendOrder());

    int count = 0;

    while (_pdvController.orderTicketsList.isNotEmpty) {
      List<OrderItem> itens = _getOrderItens(count);

      Order order = _getOder(itens, count);

      if (kDebugMode) {
        print(order.toJson());
      }

      try {
        var response = await http
            .post(uri, headers: Header.getBasicHeader(), body: order.toJson())
            .timeout(const Duration(seconds: 15));

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          if (data['success'] == true) {
            await _handleSuccess(context, count);
            continue;
          }
          _handleError(context, data['message'], errorMessage);
          return;
        }
        _handleError(context, response.statusCode.toString(), errorMessage);
        return;
      } catch (e) {
        _handleError(context, e.toString(), errorMessage);
        return;
      }
    }
  }

  Order _getOder(List<OrderItem> itens, int indexOrderTicket) {
    return Order(
        id_partner_cliente: _configController.clientId,
        id_usuario: _configController.usuarioLogado.id,
        id_comanda: _pdvController
            .orderTicketsList[indexOrderTicket].comandaSelecionada.id_comanda,
        identificador: '', // TODO colocar o nome do cliente no identificador
        itens: itens);
  }

  List<OrderItem> _getOrderItens(int indexOrderTicket) {
    List<OrderItem> itens = [];
    List<ItemCartShopping> itensCartShopping =
        _pdvController.orderTicketsList[indexOrderTicket].listItemsCartShopping;

    for (var i = 0; i < itensCartShopping.length; i++) {
      int idProduto =
          _pdvGet.getIdProductFromOrderTicketsList(indexOrderTicket, i);
      String complementos =
          _pdvGet.getAllComplementsDescription(indexOrderTicket, i);
      double valueSold = _pdvGet.getValueSold(indexOrderTicket, i);
      double qtde = _pdvGet.getQuantityItemFromOrderTicket(indexOrderTicket, i);

      itens.add(OrderItem(
          id_produto: idProduto,
          complemento: complementos,
          vlr_vendido: valueSold,
          qtde: qtde));
    }

    return itens;
  }

  Future<void> _handleSuccess(BuildContext context, int index) async {
    _pdvRemove.removeOrderToOrderTicketsList(index);
    if (_pdvController.orderTicketsList.isEmpty) {
      const CustomCherrySuccess(message: 'Pedido enviado com sucesso')
          .show(context);
      QuantityBack.back(2);
    }
  }

  Future<void> _handleError(
      BuildContext context, String messageReturned, String messageToUser,
      {String? messageCatch}) async {
    _logError(messageReturned, messageCatch: messageCatch);
    CustomCherryError(message: messageToUser).show(context);
    Get.back();
  }

  void _logError(String message, {String? messageCatch}) {
    if (messageCatch != null) {
      _logger.e('Erro ao enviar pedido: $messageCatch');
    }
    _logger.e('Erro: $message');
  }
}
