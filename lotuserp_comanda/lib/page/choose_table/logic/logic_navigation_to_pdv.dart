import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/common/custom_cherry.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/features/pdv_update.dart';

import '../../../utils/methods/order/order_features.dart';
import '../../order/service/interface/i_navigation_pdv.dart';
import '../../order/service/logic/navigation_pdv.dart';

class LogicNavigationToPdv {
  final _orderFeatures = OrderFeatures.instance;
  final _orderController = Dependencies.orderController();
  final _pdvController = Dependencies.pdvController();
  final _pdvUpdate = PdvUpdate.instance;

  LogicNavigationToPdv._privateConstructor();

  static final LogicNavigationToPdv _instance = LogicNavigationToPdv._privateConstructor();

  static LogicNavigationToPdv get instance => _instance;    

  Future<void> goToPdv() async {
    bool result = _orderFeatures
        .setTableSelectedById(_orderController.commandNumberController.text);
    if (result) {
      _pdvUpdate.updateFilteredProdutos(0, _pdvController.allGroups[0]);
      INavigationPdv navigationPdv = NavigationPdv();
      await navigationPdv.navigation(context: Get.context);
      return;
    }

    _handleError();
    return;
  }

  void _handleError() {
    return const CustomCherryError(message: 'Nenhuma mesa selecionada!')
        .show(Get.context!);
  }
}
