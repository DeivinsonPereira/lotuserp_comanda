// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/common/custom_elevated_button.dart';
import 'package:lotuserp_comanda/page/common/custom_header_popup.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/name/logic/logic_confirm_name.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/format_txt.dart';
import 'package:lotuserp_comanda/utils/methods/order/order_features.dart';

class NameDialog extends StatelessWidget {
  const NameDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final _orderController = Dependencies.orderController();
    final _orderFeatures = OrderFeatures.instance;

    Widget _buildHeader() {
      return CustomHeaderPopup(text: 'Identificador');
    }

    Widget _buildButtonBack() {
      return SizedBox(
        height: 60,
        child: CustomElevatedButton(
            colorButton: CustomColors.informationBox,
            text: 'Voltar',
            style: CustomTextStyle.whiteBoldText(20),
            function: () {
              Get.back();
              _orderFeatures.clearName();
            }),
      );
    }

    //botão de continuar
    Widget _buildButtonContinue() {
      return TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        onPressed: () async {
          LogicConfirmName().updateName(context);
        },
        child: Container(
          color: CustomColors.confirmButtonColor,
          height: 60,
          alignment: Alignment.center,
          child: const Text(
            'Continuar',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
      );
    }

    Widget _buildLineButtons() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: _buildButtonBack()),
          Expanded(child: _buildButtonContinue()),
        ],
      );
    }

    //Text field para preenchimento do CPF ou CNPJ
    Widget _buildNameField() {
      return SizedBox(
        width: 270,
        child: TextField(
          controller: _orderController.clientNameController,
          keyboardType: TextInputType.text,
          inputFormatters: [UpperCaseTxt()],
          decoration: const InputDecoration(
            labelText: 'Identificador',
            prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      );
    }

    //Conteudo
    Widget _buildContent() {
      return Expanded(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _buildNameField(),
          const SizedBox(
            height: 10,
          ),
        ]),
      );
    }

    //Inicio do código
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: SizedBox(
        width: 350,
        height: 300,
        child: Column(
          children: [
            _buildHeader(),
            _buildContent(),
            _buildLineButtons(),
          ],
        ),
      ),
    );
  }
}
