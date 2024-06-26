import 'package:flutter/material.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/extrato/common/container_informations.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';

class Informations {
  final _orderController = Dependencies.orderController();

  Widget buildTotalBruto() {
    return ContainerInformations(
        text: 'Total Bruto',
        value: _orderController.tableSelected.value.total_bruto ?? 0.0,
        color: const Color.fromARGB(255, 184, 184, 184));
  }

  Widget buildTotalCouvert() {
    return ContainerInformations(
        text: 'Couvert',
        value: _orderController.tableSelected.value.taxa_couvert ?? 0.0,
        color: const Color.fromARGB(255, 184, 184, 184));
  }

  Widget buildTotalServicos() {
    return ContainerInformations(
        text: 'Serviços',
        value: _orderController.tableSelected.value.taxa_servico ?? 0.0,
        color: const Color.fromARGB(255, 184, 184, 184),
        isPercentage: true);
  }

  Widget buildTotalLiquido() {
    return ContainerInformations(
        text: 'Total Liquido',
        value: _orderController.tableSelected.value.total_consumo ?? 0.0,
        color: CustomColors.secondaryColor);
  }
}
