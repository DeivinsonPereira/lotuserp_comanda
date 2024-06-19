// ignore_for_file: public_member_api_docs, sort_constructors_first, no_leading_underscores_for_local_identifiers
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/pdv/service/logic/logic_button_add.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/format_numbers.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/get/pdv_get.dart';

class PaymentTotalWidgetMonitor extends StatelessWidget {
  const PaymentTotalWidgetMonitor({super.key});

  @override
  Widget build(BuildContext context) {
    final _pdvGet = PdvGet.instance;

    // Constrói o container que mostra o valor total do pagamento
    Widget _buildContainerValue() {
      return Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: CustomColors.primaryColor,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Obx(() => AutoSizeText(
                  FormatNumbers.formatNumbertoString(
                      _pdvGet.getTotalValueCartShopping()),
                  style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                )),
          ),
        ),
      );
    }

    // Constrói o container de pagamento
    Widget _buildPaymentContainer() {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
        ),
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Adicionar', style: CustomTextStyle.whiteBoldText(35)),
          ],
        ),
      );
    }

    // Constrói o corpo do botão de pagamento
    Widget _buildBody() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: _buildPaymentContainer(),
          ),
          Expanded(
            flex: 1,
            child: _buildContainerValue(),
          ),
        ],
      );
    }

    // retorna o botão de pagamento
    return InkWell(
      onTap: () async {
        LogicButtonAdd.instance.addOrderAndBack();
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, top: 5, bottom: 5),
        child: _buildBody(),
      ),
    );
  }
}
