import 'package:lotuserp_comanda/controller/order_controller.dart';
import 'package:lotuserp_comanda/model/collection/mesa_listada.dart';
import 'package:lotuserp_comanda/page/order/service/interface/i_logic_get_tables.dart';
import 'package:lotuserp_comanda/utils/methods/order/order_features.dart';

class LogicGetTablesByButton implements ILogicGetTables {
  final OrderController _mesaController;
  final _orderFeatures = OrderFeatures.instance;

  LogicGetTablesByButton(this._mesaController);

  @override
  void getTables(int indexButton, int idStatus) {
    _orderFeatures.updateButtonSelected(indexButton);
    _filterListTables(idStatus);
  }

  void _filterListTables(int idStatus) {
    if (idStatus == -1) {
      _orderFeatures.setFilteredListTables(_mesaController.listTables);
      return;
    }
    List<mesa_listada> listTables = _mesaController.listTables
        .where((element) => element.status == idStatus)
        .toList();
    _orderFeatures.setFilteredListTables(listTables);
  }
}
