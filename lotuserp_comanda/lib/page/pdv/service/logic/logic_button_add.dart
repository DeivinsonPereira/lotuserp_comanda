import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/common/custom_cherry.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/methods/order/order_features.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/features/pdv_add.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/features/pdv_remove.dart';

class LogicButtonAdd {
  final _pdvController = Dependencies.pdvController();
  final _pdvRemove = PdvRemove.instance;
  final _pdvAdd = PdvAdd.instance;
  final _orderFeatures = OrderFeatures.instance;
  LogicButtonAdd._privateConstructor();

  static final LogicButtonAdd _instance = LogicButtonAdd._privateConstructor();

  static LogicButtonAdd get instance => _instance;

  void addOrderAndBack() {
    if (_isCartShoppingEmpty()) {
      _handleError();
      return;
    }

    _pdvAdd.addOrderToOrderTicketsList();
    _pdvRemove.clearAllComplementSelected();
    _pdvRemove.clearComplementoController();
    _pdvRemove.removeAllCartShopping();
    _orderFeatures.clearName();
    Get.back();
  }

  bool _isCartShoppingEmpty() {
    return _pdvController.cartShopping.isEmpty;
  }

  void _handleError() {
    const CustomCherryError(message: 'Nenhum item adicionado ao carrinho!')
        .show(Get.context!);
  }
}
