// ignore_for_file: public_member_api_docs, sort_constructors_first, no_leading_underscores_for_local_identifiers
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/pdv/service/logic/logic_button_add.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/format_numbers.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/get/pdv_get.dart';

class PaymentTotalWidgetMobile extends StatelessWidget {
  const PaymentTotalWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final _pdvGet = PdvGet.instance;
    final double heightContainers = Get.size.height * 0.1;

    // Constrói o container que mostra o valor total do pagamento
    Widget _buildContainerValue() {
      return Container(
        height: heightContainers,
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
        height: heightContainers,
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
        children: [
          Expanded(
            child: _buildPaymentContainer(),
          ),
          Expanded(
            child: _buildContainerValue(),
          ),
        ],
      );
    }

    // retorna o botão de pagamento
    return InkWell(
      onTap: () async {
        LogicButtonAdd.instance.addOrderAndBack();
        FocusScope.of(context).unfocus();
      },
      child: _buildBody(),
    );
  }
}
