import 'package:lotuserp_comanda/model/collection/complemento.dart';
import 'package:lotuserp_comanda/model/collection/produto.dart';
import 'package:lotuserp_comanda/model/item_cart_shopping.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';

class PdvBool {
  final _pdvController = Dependencies.pdvController();

  PdvBool._privateConstructor();

  static final PdvBool _instance = PdvBool._privateConstructor();

  static PdvBool get instance => _instance;

  // Verifica se existe ou não algum complemento
  bool isComplementEmpty(int index) {
    return _pdvController.cartShopping[index].complementoSelected.isEmpty;
  }

  // Verifica se existe ou não alguma descrição nos complementos
  bool isComplementDescriptionEmpty(int index) {
    return _pdvController.cartShopping[index].informationComplement.isEmpty ||
        _pdvController.cartShopping[index].informationComplement == '';
  }

  bool isCartShoppingEmpty() {
    return _pdvController.cartShopping.isEmpty;
  }

  bool isProductWithComplement(produto produtoSelected) {
    complemento? complement = _pdvController.allComplementos
        .where((element) => element.id_produto == produtoSelected.id_produto)
        .firstOrNull;
    return complement != null;
  }

  bool isOrderTicketsListEmpty() {
    return _pdvController.orderTicketsList.isEmpty;
  }

  bool isListItemCartShoppingEmpty(ItemCartShopping orderTicket) {
    return orderTicket.complementoSelected.isEmpty;
  }
}
