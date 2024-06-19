import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/cart/pages/cart_shopping_monitor.dart';
import 'package:lotuserp_comanda/page/common/custom_cherry.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/get/pdv_bool.dart';

class LogicNavigationToCartShopping {
  final _pdvBool = PdvBool.instance;

  LogicNavigationToCartShopping._privateConstructor();

  static final LogicNavigationToCartShopping _instance =
      LogicNavigationToCartShopping._privateConstructor();

  static LogicNavigationToCartShopping get instance => _instance;

  void navigation() {
    if (_pdvBool.isOrderTicketsListEmpty()) {
      _handleError();
      return;
    }

    Get.to(() => const CartShoppingMonitor());
  }

  void _handleError() {
    const CustomCherryError(message: 'Nenhum item selecionado.')
        .show(Get.context!);
  }
}
