import 'package:lotuserp_comanda/page/order/enum/status_comandas.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';

class OrderBool {
  final _orderController = Dependencies.orderController();

  OrderBool._privateConstructor();

  static final OrderBool _instance = OrderBool._privateConstructor();

  static OrderBool get instance => _instance;

  bool isTableFree() {
    return _orderController.tableSelected.value.status ==
        StatusComandas.LIVRE.index;
  }

  bool isInvalidTable() {
    int statusTable = _orderController.tableSelected.value.status ?? 0;
    return statusTable == StatusComandas.BLOQUEADA.index ||
        statusTable == StatusComandas.CONTA.index ||
        statusTable == StatusComandas.INATIVADA.index;
  }
}
