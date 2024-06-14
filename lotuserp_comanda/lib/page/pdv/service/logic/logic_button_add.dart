import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/common/custom_cherry.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/pdv_features.dart';

class LogicButtonAdd {
  final _pdvFeatures = PdvFeatures.instance;
  final _pdvController = Dependencies.pdvController();
  LogicButtonAdd._privateConstructor();

  static final LogicButtonAdd _instance = LogicButtonAdd._privateConstructor();

  static LogicButtonAdd get instance => _instance;

  void addOrderAndBack() {
    if (_isCartShoppingEmpty()) {
      _handleError();
      return;
    }

    _pdvFeatures.addOrderToOrderTicketsList();
    _pdvFeatures.clearAllComplementSelected();
    _pdvFeatures.clearComplementoController();
    _pdvFeatures.removeAllCartShopping();
    Get.back();

    print('OrderTicketList: ${_pdvController.orderTicketsList.length}');
  }

  bool _isCartShoppingEmpty() {
    return _pdvController.cartShopping.isEmpty;
  }

  void _handleError() {
    const CustomCherryError(message: 'Nenhum item adicionado ao carrinho!')
        .show(Get.context!);
  }
}
