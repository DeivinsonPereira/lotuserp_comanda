import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/model/comanda_selecionada.dart';
import 'package:lotuserp_comanda/page/cart/components/custom_send_order_button.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/format_numbers.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/get/pdv_get.dart';

class ResumeOrderTicketList extends StatelessWidget {
  const ResumeOrderTicketList({super.key});

  @override
  Widget build(BuildContext context) {
    final _pdvController = Dependencies.pdvController();
    final _pdvGet = PdvGet.instance;

    Widget _buildTotalOrder(ComandaSelecionada comandaSelecionada, int index) {
      return SizedBox(
        height: 40,
        child: Column(
          children: [
            if (comandaSelecionada.listItemsCartShopping.isNotEmpty) ...{
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Comanda ${comandaSelecionada.comandaSelecionada.id_comanda}',
                  style: CustomTextStyle.blackText(20),
                ),
                Text(
                  'R\$ ${FormatNumbers.formatNumbertoString(_pdvGet.getTotalValuePerTable(comandaSelecionada).value)}',
                  style: CustomTextStyle.blackBoldText(20),
                ),
              ]),
            }
          ],
        ),
      );
    }

    Widget _buildResumeOrderList() {
      return Obx(() => ListView.builder(
          itemCount: _pdvController.orderTicketsList.length,
          itemBuilder: (context, index) {
            ComandaSelecionada comandaSelecionada =
                _pdvController.orderTicketsList[index];
            return _buildTotalOrder(comandaSelecionada, index);
          }));
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Resumo',
            style: CustomTextStyle.blackBoldText(30),
          ),
          Expanded(
            child: Material(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5.0,
              child: Container(
                width: Get.size.width * 0.9,
                height: Get.size.height * 0.8,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(child: _buildResumeOrderList()),
                  ],
                ),
              ),
            ),
          ),
          const CustomSendOrderButton()
        ],
      ),
    );
  }
}
