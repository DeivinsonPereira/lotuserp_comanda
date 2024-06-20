import 'package:lotuserp_comanda/model/collection/mesa_listada.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';

class OrderGet {
  final _orderController = Dependencies.orderController();
  OrderGet._privateConstructor();

  static final OrderGet _instance = OrderGet._privateConstructor();

  static OrderGet get instance => _instance;

  List<mesa_listada> getListTablesByIdStatus(int idStatus) {
    return _orderController.listTables
        .where((element) => element.status == idStatus)
        .toList();
  }
}
