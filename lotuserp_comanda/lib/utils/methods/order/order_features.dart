import 'package:get/get.dart';
import 'package:lotuserp_comanda/model/collection/mesa_listada.dart';
import 'package:lotuserp_comanda/model/mesa_extrato.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';

class OrderFeatures {
  final _orderController = Dependencies.orderController();

  OrderFeatures._privateConstructor();

  static final OrderFeatures _instance = OrderFeatures._privateConstructor();

  static OrderFeatures get instance => _instance;

  // seta a mesa selecionada
  void setTableSelected(mesa_listada table) {
    _orderController.tableSelected.value = table;
    _orderController.update();
  }

  bool setTableSelectedById(String idComanda) {
    mesa_listada? table = _orderController.listTables
        .where((element) =>
            element.id_comanda.toString() ==
            idComanda.replaceFirst(RegExp(r'^0+'), ''))
        .firstOrNull;

    if (table == null) return false;

    _orderController.tableSelected.value = table;
    _orderController.update();
    return true;
  }

  // seta a mesa filtrada
  void setFilteredListTables(List<mesa_listada> tables) {
    _orderController.filteredListTables.assignAll(tables);
    _orderController.update();
  }

  // adiciona mesas atualizadas na lista
  void setListTables(List<mesa_listada> tables) {
    _orderController.listTables.assignAll(tables);
    _orderController.filteredListTables.assignAll(tables);
    _orderController.filteredListTables.refresh();
    _orderController.update();
  }

  // busca a mesa pelo id
  void searchTableById() {
    if (_orderController.searchTableController.text.isNotEmpty) {
      List<mesa_listada> table = _orderController.listTables
          .where(
            (element) =>
                element.id_comanda ==
                int.parse(_orderController.searchTableController.text),
          )
          .toList();
      setFilteredListTables(table);
    }
    _orderController.update();
  }

  void nameToOrderTable() {
    _orderController.tableSelected.value.identificador =
        _orderController.clientName;
    clearName();
  }

  // Muda o index do botão de filtragem selecionado
  void updateButtonSelected(int value) {
    _orderController.buttonSelected.value = value;
    _orderController.update();
    _orderController.buttonSelected.refresh();
  }

  void updateName() {
    _orderController.clientName = _orderController.clientNameController.text;
    _orderController.update();
  }

  void setNameController(String value) {
    _orderController.clientNameController.text = value;
    _orderController.update();
  }

  void setMesaExtrato(List<MesaExtrato> mesaExtrato) {
    _orderController.mesaExtrato.assignAll(mesaExtrato);
    _orderController.update();
  }

  // Limpa todas as variáveis
  void clearAll() {
    _orderController.searchTableController.clear();
    _orderController.tableSelected = mesa_listada(id_comanda: 0).obs;
    _orderController.update();
  }

  void clearName() {
    _orderController.clientNameController.text = '';
    _orderController.clientName = '';
    _orderController.update();
  }

  void clearCommandNumberController() {
    _orderController.commandNumberController.text = '';
    _orderController.update();
  }
}
