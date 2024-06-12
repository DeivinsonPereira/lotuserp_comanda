import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_comanda/model/collection/mesa_listada.dart';
import 'package:lotuserp_comanda/page/common/custom_cherry.dart';
import 'package:lotuserp_comanda/page/order/service/interface/i_update_tables.dart';
import 'package:lotuserp_comanda/shared/components/endpoints.dart';
import 'package:lotuserp_comanda/shared/repositories/isar_db/generic_repository_multiple.dart';
import 'package:lotuserp_comanda/shared/repositories/isar_db/isar_service.dart';
import 'package:lotuserp_comanda/utils/methods/order/order_features.dart';
import '../../../common/loading_screen.dart';

class LogicUpdateTables implements IUpdateTables {
  final _genericRepositoryMultiple = GenericRepositoryMultiple.instance;
  final _isarService = IsarService.instance;
  final _logger = Logger();
  final String messageError = 'Erro ao Atualizar as mesas';

  @override
  Future<void> updateTables({BuildContext? context}) async {
    final isar = await _isarService.db;
    final _orderFeatures = OrderFeatures.instance;

    Get.dialog(const LoadingScreen());
    await _genericRepositoryMultiple.search(
      Endpoints().endpointListarMesas(),
      (value) async => await _handleSuccess(value, isar),
      (value) => _handleError(value),
      (value) => mesa_listada.fromMap(value),
    );

    List<mesa_listada> tables =
        await _genericRepositoryMultiple.getAll(isar.mesa_listadas);

    _orderFeatures.setListTables(tables);

    Get.back();
  }

  Future<void> _handleSuccess(List<mesa_listada> listTables, Isar isar) async {
    await _genericRepositoryMultiple.insert(listTables, isar.mesa_listadas);
  }

  void _handleError(String message) {
    _logger.e('$messageError: $message');
    CustomCherryError(message: '$messageError.').show(Get.context!);
  }
}
