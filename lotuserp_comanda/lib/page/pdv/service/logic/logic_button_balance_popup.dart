import 'package:get/get.dart';
import 'package:lotuserp_comanda/model/collection/produto.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/format_numbers.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/pdv_features.dart';

class LogicButtonBalancePopup {
  final _pdvController = Dependencies.pdvController();
  final _pdvFeatures = PdvFeatures.instance;

  LogicButtonBalancePopup._privateConstructor();

  static final LogicButtonBalancePopup _instance =
      LogicButtonBalancePopup._privateConstructor();

  static LogicButtonBalancePopup get instance => _instance;

  void back() {
    _pdvController.pesagemController.text = '0.000';
    Get.back();
  }

  void confirm(produto produtoSelected) async {
    if (_pdvController.pesagemController.text == '0.000') return;

    _pdvFeatures.addCartShoppingProduct(produtoSelected,
        weight: FormatNumbers.formatStringToDouble(
                double.parse(_pdvController.pesagemController.text)
                    .toStringAsFixed(3)) /
            1000);
    _pdvController.pesagemController.text = '0.000';
    Get.back();
  }
}
