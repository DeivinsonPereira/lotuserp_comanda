import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/format_numbers.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/pdv_get.dart';

class CustomSendOrderButton extends StatelessWidget {
  const CustomSendOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    final _pdvGet = PdvGet.instance;
    final double height = Get.size.height;

    Widget _buildTextButton() {
      return Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
          color: CustomColors.confirmButtonColor,
        ),
        child: Center(
          child: Text(
            'Enviar Pedido',
            textAlign: TextAlign.center,
            style: CustomTextStyle.whiteBoldText(30),
          ),
        ),
      );
    }

    Widget _buildTotalValueButton() {
      return Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
          color: CustomColors.primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Obx(() => Text(
                  'R\$ ${FormatNumbers.formatNumbertoString(_pdvGet.getTotalValueOrder().value)}',
                  textAlign: TextAlign.end,
                  style: CustomTextStyle.whiteBoldText(30),
                )),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(children: [
        Expanded(
          child: _buildTextButton(),
        ),
        Expanded(
          child: _buildTotalValueButton(),
        )
      ]),
    );
  }
}
