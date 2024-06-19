import 'package:get/get.dart';
import 'package:lotuserp_comanda/core/size_screen.dart';
import 'package:lotuserp_comanda/model/collection/complemento.dart';
import 'package:lotuserp_comanda/model/complement_cart_shopping.dart';
import 'package:lotuserp_comanda/model/item_cart_shopping.dart';
import 'package:lotuserp_comanda/page/order/service/logic/logic_update_tables.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/methods/navigation/navigation_features.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/features/pdv_common_methods.dart';

class PdvRemove {
  final _pdvController = Dependencies.pdvController();
  final _pdvCommonMethods = PdvCommonMethods.instance;
  final _navigationFeatures = NavigationFeatures.instance;

  PdvRemove._privateConstructor();

  static final PdvRemove _instance = PdvRemove._privateConstructor();

  static PdvRemove get instance => _instance;

  void removeOrderToOrderTicketsList(int index) {
    _pdvController.orderTicketsList.removeAt(index);
    _pdvController.update();
    _pdvController.orderTicketsList.refresh();
  }

  void removeAllOrderToOrderTicketsList() {
    _pdvController.orderTicketsList.clear();
    _pdvController.update();
  }

  void removeComplementSelected(complemento complementoSelected) {
    ComplementCartShopping? complement = _pdvController.listComplementSelected
        .where((element) =>
            element.complementos.id_complemento ==
            complementoSelected.id_complemento)
        .firstOrNull;

    if (complement == null) return;

    if (complement.quantity > 1) {
      complement.quantity--;
      _pdvController.update();
      return;
    }

    _pdvController.listComplementSelected.remove(complement);
    _pdvController.update();
  }

  void clearAllComplementSelected() {
    _pdvController.listComplementSelected.value = [];
    _pdvController.update();
  }

  // Remove produtos do carrinho de compras
  void removeCartShopping(int index) {
    ItemCartShopping produtoSelected = _pdvController.cartShopping[index];

    if (produtoSelected.quantidade > 1) {
      produtoSelected.quantidade--;
    } else {
      produtoSelected.quantidade = 0;
      _pdvController.cartShopping.remove(produtoSelected);
    }
    _pdvController.update();
    _pdvController.cartShopping.refresh();
  }

  // Remove produtos do orderTicketList
  void removeCartShoppingFromOrderTicketList(
      int indexOrderTicket, ItemCartShopping orderSelected, index) {
    if (orderSelected.quantidade > 1) {
      orderSelected.quantidade--;
      _pdvCommonMethods.updateOrderTiketList();
      return;
    }

    deleteItemFromOrderTicket(indexOrderTicket, index);
  }

  // Deleta um produto do carrinho de compras
  void deleteItemCartShopping(int index) {
    _pdvController.cartShopping.removeAt(index);
    _pdvController.update();
  }

  void deleteItemFromOrderTicket(int indexOrderTicket, int index) {
    if (_pdvController
            .orderTicketsList[indexOrderTicket].listItemsCartShopping.length >
        1) {
      _pdvController.orderTicketsList[indexOrderTicket].listItemsCartShopping
          .removeAt(index);
      _pdvCommonMethods.updateOrderTiketList();
      return;
    }

    removeOrderToOrderTicketsList(indexOrderTicket);

    if (_pdvController.orderTicketsList.isEmpty) {
      if (SizeScreen.isMobile) {
        _navigationFeatures.resetPage();
        return;
      }

      Get.back();
      LogicUpdateTables().updateTables(context: Get.context);
    }
  }

  // Remove todos os produtos do carrinho de compras
  void removeAllCartShopping() {
    _pdvController.cartShopping.clear();
    _pdvController.update();
  }

  void clearComplementoController() {
    _pdvController.complementoController.text = '';
  }
}
