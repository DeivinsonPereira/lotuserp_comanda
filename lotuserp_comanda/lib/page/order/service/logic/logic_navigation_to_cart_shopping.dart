import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/cart/cart_shopping_page.dart';
import 'package:lotuserp_comanda/page/common/custom_cherry.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/pdv_get.dart';

class LogicNavigationToCartShopping {
  final _pdvGet = PdvGet.instance;

  LogicNavigationToCartShopping._privateConstructor();

  static final LogicNavigationToCartShopping _instance =
      LogicNavigationToCartShopping._privateConstructor();

  static LogicNavigationToCartShopping get instance => _instance;

  void navigation() {
    if (_pdvGet.isOrderTicketsListEmpty()) {
      _handleError();
      return;
    }

    Get.to(() => const CartShoppingPage());
  }

  void _handleError() {
    const CustomCherryError(message: 'Nenhum item selecionado.')
        .show(Get.context!);
  }
}
