import 'package:get/get.dart';
import 'package:lotuserp_comanda/model/mesa_extrato.dart';
import 'package:lotuserp_comanda/page/common/custom_cherry.dart';
import 'package:lotuserp_comanda/page/common/loading_screen.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/extrato/extrato_dialog.dart';
import 'package:lotuserp_comanda/shared/components/endpoints.dart';
import 'package:lotuserp_comanda/shared/repositories/isar_db/generic_repository_multiple.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/methods/order/order_features.dart';

class OpenDialogExtrato {
  final _genericRepositoryMultiple = GenericRepositoryMultiple.instance;
  final _orderController = Dependencies.orderController();
  final _orderFeatures = OrderFeatures.instance;

  Future<void> open() async {
    Get.dialog(const LoadingScreen());
    await searchExtrato();
  }

  Future<void> searchExtrato() async {
    await _genericRepositoryMultiple.search(
        Endpoints().searchComandasExtrato(
            _orderController.tableSelected.value.id_comanda),
        (value) => _handleSuccess(value),
        (value) => handleError(value),
        (value) => MesaExtrato.fromMap(value));
  }

  void _handleSuccess(List<MesaExtrato> value) {
    Get.back();
    if (value.isNotEmpty) {
      _orderFeatures.setMesaExtrato(value);
      Get.dialog(const ExtratoDialog());
      return;
    }
  }

  void handleError(dynamic value) {
    Get.back();
    const CustomCherryError(message: 'Erro ao buscar o extrato')
        .show(Get.context!);
  }
}
