import 'package:lotuserp_comanda/controller/order_controller.dart';
import 'package:lotuserp_comanda/page/order/service/interface/i_logic_get_tables.dart';
import 'package:lotuserp_comanda/utils/methods/order/order_features.dart';
import 'package:lotuserp_comanda/utils/methods/order/order_get.dart';

class LogicGetTablesByButton implements ILogicGetTables {
  final OrderController _orderController;
  final _orderFeatures = OrderFeatures.instance;
  final _orderGet = OrderGet.instance;

  LogicGetTablesByButton(this._orderController);

  @override
  void getTables(int indexButton, int idStatus) {
    _orderFeatures.updateButtonSelected(indexButton);
    _filterListTables(idStatus);
  }

  void _filterListTables(int idStatus) {
    if (idStatus == -1) {
      _orderFeatures.setFilteredListTables(_orderController.listTables);
      return;
    }

    _orderFeatures.setFilteredListTables(_orderGet.getListTablesByIdStatus(idStatus));
  }
}
