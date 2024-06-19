import 'package:get/get.dart';
import 'package:lotuserp_comanda/core/size_screen.dart';
import 'package:lotuserp_comanda/model/collection/produto.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/balance_pop_up.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/complemento/complemento_dialog_mobile.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/complemento/complemento_dialog_monitor.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/features/pdv_add.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/features/pdv_update.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/get/pdv_bool.dart';

class LogicAddProduct {
  final _pdvFetures = PdvUpdate.instance;
  final _pdvBool = PdvBool.instance;
  final _pdvAdd = PdvAdd.instance;
  final _pdvController = Dependencies.pdvController();

  LogicAddProduct._privateConstructor();

  static final LogicAddProduct _instance =
      LogicAddProduct._privateConstructor();

  static LogicAddProduct get instance => _instance;

  void addProductToCartShopping(produto productSelected) {
    _pdvController.pesagemController.text = '0.000';
    if (productSelected.produto_pesagem == 1) {
      Get.dialog(
          barrierDismissible: false,
          BalancePopUp(
            produtoSelected: productSelected,
          ));
      return;
    }

    if (_pdvBool.isProductWithComplement(productSelected)) {
      _pdvFetures.setComplementosFiltered(productSelected);
      if (SizeScreen.isMobile) {
        Get.dialog(ComplementoDialogMobile(produtoSelected: productSelected));
        return;
      }

      Get.dialog(
          barrierDismissible: false,
          ComplementoDialogMonitor(
            produtoSelected: productSelected,
          ));
      return;
    }

    _pdvAdd.addCartShoppingProduct(productSelected);
  }
}
