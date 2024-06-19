import 'package:flutter/material.dart';
import 'package:lotuserp_comanda/core/size_screen.dart';
import 'package:lotuserp_comanda/model/item_cart_shopping.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/format_numbers.dart';
import 'package:lotuserp_comanda/utils/format_string.dart';

class PresentationInfoResumeCartShopping {
  final _pdvController = Dependencies.pdvController();

  PresentationInfoResumeCartShopping._privateConstructor();

  static final PresentationInfoResumeCartShopping _instance =
      PresentationInfoResumeCartShopping._privateConstructor();

  static PresentationInfoResumeCartShopping get instance => _instance;

  Widget build(int index, int indexOrderTicketList) {
    final cartShopping = _pdvController
        .orderTicketsList[indexOrderTicketList].listItemsCartShopping[index];

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizeScreen.isMobile
              ? Text(
                  '${cartShopping.produtoSelected.id_produto} - ${FormatString.limitarTexto(cartShopping.produtoSelected.descricao ?? '', 15)}')
              : Text(
                  '${cartShopping.produtoSelected.id_produto} - ${cartShopping.produtoSelected.descricao ?? ''}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
          Text(
            'R\$ ${FormatNumbers.formatNumbertoString(cartShopping.produtoSelected.preco_venda)}',
          ),
        ],
      ),
      ..._buildWidget(index, cartShopping, indexOrderTicketList),
    ]);
  }

  List<Widget> _buildWidget(
      int index, ItemCartShopping cartShopping, int indexOrderTicketList) {
    List<Widget> complements = [];
    if (cartShopping.complementoSelected.isNotEmpty) {
      complements
          .addAll(_buildComplements(index, cartShopping, indexOrderTicketList));
    }

    if (cartShopping.informationComplement.isNotEmpty) {
      complements.add(_buildComplementsDescription(index, cartShopping));
    }

    return complements;
  }

  List<Widget> _buildComplements(
      int index, ItemCartShopping cartShopping, int indexOrderTicketList) {
    List<Widget> complements = [];
    for (var i = 0; i < cartShopping.complementoSelected.length; i++) {
      complements.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizeScreen.isMobile
              ? Text(
                  '+ ${FormatString.limitarTexto(cartShopping.complementoSelected[i].complementos.descricao, 15)}')
              : Text(
                  '+ ${cartShopping.complementoSelected[i].complementos.descricao}'),
          Text(
              ' ${cartShopping.complementoSelected[i].quantity} - R\$ ${FormatNumbers.formatNumbertoString(cartShopping.complementoSelected[i].complementos.valor)}'),
        ],
      ));
    }
    return complements;
  }

  Widget _buildComplementsDescription(
      int index, ItemCartShopping cartShopping) {
    return Text('+ ${cartShopping.informationComplement}');
  }
}
