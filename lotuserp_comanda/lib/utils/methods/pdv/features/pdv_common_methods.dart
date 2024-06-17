import 'package:lotuserp_comanda/utils/dependencies.dart';

class PdvCommonMethods {
  final _pdvController = Dependencies.pdvController();

  PdvCommonMethods._privateConstructor();

  static final PdvCommonMethods _instance = PdvCommonMethods._privateConstructor();

  static PdvCommonMethods get instance => _instance;


  void updateOrderTiketList() {
    _pdvController.update();
    _pdvController.orderTicketsList.refresh();
  }
}