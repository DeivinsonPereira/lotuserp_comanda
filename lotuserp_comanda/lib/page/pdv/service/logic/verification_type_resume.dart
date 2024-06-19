import 'package:flutter/material.dart';
import 'package:lotuserp_comanda/controller/pdv_controller.dart';
import 'package:lotuserp_comanda/model/collection/produto.dart';
import 'package:lotuserp_comanda/model/item_cart_shopping.dart';
import 'package:lotuserp_comanda/page/cart/components/custom_card_complement_cart_shopping.dart';
import 'package:lotuserp_comanda/page/cart/components/custom_card_pesagem_cart_shopping.dart';
import 'package:lotuserp_comanda/page/cart/components/custom_card_product_cart_shopping.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/custom_card_complement.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/custom_card_pesagem.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/custom_card_product.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/get/pdv_get.dart';

class VerificationTypeResume {
  final _pdvGet = PdvGet.instance;

  VerificationTypeResume._privateConstructor();

  static final VerificationTypeResume _instance =
      VerificationTypeResume._privateConstructor();

  static VerificationTypeResume get instance => _instance;

  Widget buildResume(produto produtoSelected, ItemCartShopping itemCartShopping,
      int index, PdvController pdvController,
      {bool isCartShopping = false, int? indexOrderTicketList}) {
    if (produtoSelected.produto_pesagem == 0) {
      if (_isProductWithComplement(itemCartShopping)) {
        if (isCartShopping) {
          return CustomCardComplementCartShopping(
            index: index,
            produtoSelected: produtoSelected,
            pdvController: pdvController,
            indexOrderTicketList: indexOrderTicketList!,
          );
        }
        return CustomCardComplement(
          index: index,
          produtoSelected: produtoSelected,
          pdvController: pdvController,
        );
      }
      if (isCartShopping) {
        return CustomCardProductCartShopping(
            index: index,
            produtoSelected: produtoSelected,
            pdvController: pdvController,
            indexOrderTicketList: indexOrderTicketList!);
      }
      return CustomCardProduct(
        index: index,
        produtoSelected: produtoSelected,
        pdvController: pdvController,
      );
    } else {
      if (isCartShopping) {
        return CustomCardPesagemCartShopping(
            index: index,
            produtoSelected: produtoSelected,
            pdvController: pdvController,
            indexOrderTicketList: indexOrderTicketList!);
      }
      return CustomCardPesagem(
        index: index,
        produtoSelected: produtoSelected,
        pdvController: pdvController,
      );
    }
  }

  bool _isProductWithComplement(ItemCartShopping itemCartShopping) {
    return _pdvGet
        .getAllComplements()
        .where((element) =>
            element.id_produto == itemCartShopping.produtoSelected.id_produto)
        .isNotEmpty;
  }
}
