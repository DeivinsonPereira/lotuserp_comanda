import 'package:flutter/material.dart';
import 'package:lotuserp_comanda/model/collection/mesa_listada.dart';
import 'package:lotuserp_comanda/model/comanda_selecionada.dart';
import 'package:lotuserp_comanda/model/item_cart_shopping.dart';
import 'package:lotuserp_comanda/page/pdv/service/logic/verification_type_resume.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';

class LogicBuildDetailsOrder {
  final _verificationTypeResume = VerificationTypeResume.instance;
  final _pdvController = Dependencies.pdvController();

  Widget build(int index, ComandaSelecionada comandaSelecionada) {
    mesa_listada comandaSelected = comandaSelecionada.comandaSelecionada;
    List<ItemCartShopping> itemCartShopping =
        comandaSelecionada.listItemsCartShopping;

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Comanda ${comandaSelected.id_comanda}',
              style: CustomTextStyle.blackBoldText(25),
            ),
          ),
        ),
        ..._buildProductsList(itemCartShopping, index),
      ],
    );
  }

  List<Widget> _buildProductsList(
      List<ItemCartShopping> itemCartShopping, int index) {
    List<Widget> products = [];
    for (var i = 0; i < itemCartShopping.length; i++) {
      products.add(_verificationTypeResume.buildResume(
          itemCartShopping[i].produtoSelected,
          itemCartShopping[i],
          i,
          _pdvController,
          isCartShopping: true,
          indexOrderTicketList: index));
    }
    return products;
  }
}
