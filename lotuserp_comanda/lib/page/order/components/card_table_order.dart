// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lotuserp_comanda/controller/order_controller.dart';
import 'package:lotuserp_comanda/model/collection/mesa_listada.dart';
import 'package:lotuserp_comanda/page/common/custom_cherry.dart';
import 'package:lotuserp_comanda/page/order/enum/status_comandas.dart';
import 'package:lotuserp_comanda/page/order/service/interface/i_navigation_pdv.dart';
import 'package:lotuserp_comanda/page/order/service/logic/logic_colors.dart';
import 'package:lotuserp_comanda/page/order/service/logic/logic_get_user_name.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/extrato/logic/logic_get_status_description.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/extrato/logic/open_dialog_extrato.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/format_numbers.dart';
import 'package:lotuserp_comanda/utils/methods/order/order_features.dart';

import '../../../utils/methods/pdv/features/pdv_update.dart';
import '../service/logic/navigation_pdv.dart';

class CardTableOrder extends StatelessWidget {
  final int count;
  final double sizeNumberCard;
  const CardTableOrder({
    Key? key,
    required this.count,
    required this.sizeNumberCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _orderController = Dependencies.orderController();
    final _orderFeatures = OrderFeatures.instance;
    final _pdvFeatures = PdvUpdate.instance;
    final _pdvController = Dependencies.pdvController();
    final _logicGetUserName = LogicGetUserName.instance;

    // Constrói o título
    Widget _buildTitle() {
      return SizedBox(
        height: 25,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Mesa',
            style: CustomTextStyle.greyTextStyle(12),
          ),
        ),
      );
    }

    // Constrói o número da mesa(comanda) no card
    Widget _buildNumber(mesa_listada data) {
      return Text(
        FormatNumbers.intToString(data.id_comanda),
        style: CustomTextStyle.blackBoldText(sizeNumberCard),
      );
    }

    // Constrói o valor do consumo da mesa
    Widget _buildValue(mesa_listada data) {
      return SizedBox(
        height: 25,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'R\$ ${FormatNumbers.formatNumbertoString(data.total_consumo)}',
            style: CustomTextStyle.blackText(16),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }

    Widget _buildUserName(mesa_listada data) {
      return _logicGetUserName.build(data);
    }

    Widget _buildDivider(mesa_listada data) {
      return SizedBox(
        height: Get.size.height * 0.03,
        child: Divider(
          color: LogicColors().getColorsCard(data.status!),
          thickness: 4,
          height: 2,
          indent: 10,
          endIndent: 10,
        ),
      );
    }

    Widget _buildContent(mesa_listada data) {
      return GestureDetector(
        onTap: () async {
          if (data.status == StatusComandas.LIVRE.index ||
              data.status == StatusComandas.OCUPADA.index) {
            _orderFeatures.setTableSelected(data);
            _pdvFeatures.updateFilteredProdutos(0, _pdvController.allGroups[0]);
            INavigationPdv navigationPdv = NavigationPdv();
            await navigationPdv.navigation(context: context);
            return;
          }

          CustomCherryError(
                  message:
                      'Mesa inválida em status de ${LogicGetStatusDescription.getStatusDescription(_orderController.tableSelected.value.status ?? 0)}')
              .show(Get.context!);
        },
        onLongPress: () async {
          _orderFeatures.setTableSelected(data);
          OpenDialogExtrato().open();
        },
        child: Material(
          elevation: 7,
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color.fromARGB(118, 0, 0, 0),
                width: 0.5,
              ),
            ),
            child: Column(
              children: [
                _buildTitle(),
                Expanded(child: _buildNumber(data)),
                _buildValue(data),
                _buildUserName(data),
                _buildDivider(data),
              ],
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<OrderController>(
        builder: (_) {
          return GridView.builder(
            itemCount: _orderController.filteredListTables.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: count,
                childAspectRatio: 0.8,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
            itemBuilder: (context, index) {
              var data = _.filteredListTables[index];
              return _buildContent(data);
            },
          );
        },
      ),
    );
  }
}
