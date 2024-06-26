import 'package:lotuserp_comanda/page/order/service/logic/logic_get_tables_by_button.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';

class ListFilterTables {
  static final _orderController = Dependencies.orderController();

  static List<dynamic> listTables = [
    {
      'mesas': 'Todas',
      'logica': () => LogicGetTablesByButton(_orderController).getTables(0, -1),
      'index': 0
    },
    {
      'mesas': 'Livres',
      'logica': () => LogicGetTablesByButton(_orderController).getTables(1, 0),
      'index': 1
    },
    {
      'mesas': 'Ocupadas',
      'logica': () => LogicGetTablesByButton(_orderController).getTables(2, 1),
      'index': 2
    },
    {
      'mesas': 'Contas',
      'logica': () => LogicGetTablesByButton(_orderController).getTables(3, 2),
      'index': 3
    },
    {
      'mesas': 'Reservadas',
      'logica': () => LogicGetTablesByButton(_orderController).getTables(4, 3),
      'index': 4
    },
  ];
}
