import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/model/mesa_extrato.dart';
import 'package:lotuserp_comanda/page/common/custom_elevated_button.dart';
import 'package:lotuserp_comanda/page/common/custom_header_popup.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/extrato/components/card_extrato.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/format_numbers.dart';

class ExtratoDialog extends StatelessWidget {
  const ExtratoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final _orderController = Dependencies.orderController();
    final extratoLength = _orderController.mesaExtrato.length;

    Widget _buildHeader() {
      return CustomHeaderPopup(
          text:
              'Extrato da mesa: ${_orderController.tableSelected.value.id_comanda}');
    }

    Widget _buildItensQuantity() {
      return Text(
        'Qtde itens: $extratoLength',
        style: CustomTextStyle.blackBoldText(20),
      );
    }

    Widget _buildTotalValue() {
      return Text(
          'R\$ ${FormatNumbers.formatNumbertoString(_orderController.tableSelected.value.total_consumo)}',
          style: CustomTextStyle.blackBoldText(20));
    }

    Widget _buildLineQuantityValue() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildItensQuantity(),
            _buildTotalValue(),
          ],
        ),
      );
    }

    Widget _buildContent() {
      return ListView.builder(
          itemCount: extratoLength,
          itemBuilder: (context, index) {
            MesaExtrato mesaSelected = _orderController.mesaExtrato[index];
            return CardExtrato(mesaSelected: mesaSelected, index: index);
          });
    }

    Widget _buildBackButton() {
      return Row(
        children: [
          Expanded(
            child: SizedBox(
                height: 60,
                child: CustomElevatedButton(
                    text: 'Voltar',
                    function: () {
                      Get.back();
                      FocusScope.of(context).unfocus();
                    },
                    colorButton: CustomColors.informationBox,
                    style: CustomTextStyle.whiteBoldText(20))),
          ),
        ],
      );
    }

    Widget _buildBody() {
      return Column(
        children: [
          _buildHeader(),
          _buildLineQuantityValue(),
          Expanded(
            child: _buildContent(),
          ),
          _buildBackButton()
        ],
      );
    }

    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(0.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
      ),
      child: SizedBox(
        height: Get.size.height * 0.7,
        width: Get.size.width * 0.9,
        child: _buildBody(),
      ),
    );
  }
}
