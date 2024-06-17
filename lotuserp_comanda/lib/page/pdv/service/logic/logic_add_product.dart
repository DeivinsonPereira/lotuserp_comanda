import 'package:get/get.dart';
import 'package:lotuserp_comanda/model/collection/produto.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/balance_pop_up.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/complemento/complemento_dialog.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/features/pdv_add.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/features/pdv_update.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/get/podv_bool.dart';

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
      Get.dialog(
          barrierDismissible: false,
          ComplementoDialog(
            produtoSelected: productSelected,
          ));
      return;
    }

    _pdvAdd.addCartShoppingProduct(productSelected);
  }
}
