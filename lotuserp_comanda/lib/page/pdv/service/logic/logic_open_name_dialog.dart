import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/name/name_dialog.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/methods/order/order_features.dart';

class LogicOpenNameDialog {
  final _orderController = Dependencies.orderController();
  final _orderFeatures = OrderFeatures.instance;

  void open() {
    _fillName();
    Get.dialog(barrierDismissible: false, const NameDialog());
  }

  void _fillName() {
    if (_isNameEmpty()) {
      _orderController.clientNameController.text = '';
      return;
    }

    _orderFeatures.setNameController(_orderController.clientName);
    _orderController.clientNameController.text = _orderController.clientName;
  }

  bool _isNameEmpty() {
    return _orderController.clientName.isEmpty ||
        _orderController.clientName == '';
  }
}
