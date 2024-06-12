// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/model/collection/produto.dart';
import 'package:lotuserp_comanda/page/common/custom_header_popup.dart';
import 'package:lotuserp_comanda/page/pdv/service/logic/logic_button_balance_popup.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/format_txt.dart';

import '../../../utils/custom_colors.dart';

class BalancePopUp extends StatelessWidget {
  final produto produtoSelected;

  BalancePopUp({
    Key? key,
    required this.produtoSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pdvController = Dependencies.pdvController();

    Widget _buildTitle() {
      return Text(
        'Insira o peso do produto',
        style: CustomTextStyle.blackBoldText(20),
      );
    }

    // Constrói o textField
    Widget _buildTextField() {
      return Container(
        padding: const EdgeInsets.only(
          top: 50,
        ),
        child: SizedBox(
          width: 300,
          child: TextField(
            inputFormatters: [DecimalInputFormatter()],
            controller: _pdvController.pesagemController,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 26),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              prefixIcon: Icon(Icons.balance),
              labelText: 'Quantidade',
            ),
          ),
        ),
      );
    }

    //Constrói o corpo
    Widget _buildBody() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTitle(),
          _buildTextField(),
        ],
      );
    }

    //Constroi o botão de voltar
    Widget _buildButtonBack() {
      return Expanded(
        child: Container(
          height: 65,
          color: CustomColors.informationBox,
          child: TextButton(
            onPressed: () {
              _pdvController.pesagemController.text = '0.000';
              Get.back();
            },
            child: const Text(
              'Voltar',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    }

    //Constroi o botão de confirmação
    Widget _buildButtonConfirm() {
      return Expanded(
        child: Container(
          height: 65,
          color: CustomColors.confirmButtonColor,
          child: TextButton(
            onPressed: () async {
              LogicButtonBalancePopup.instance.confirm(produtoSelected);
            },
            child: const Text(
              'Confirmar',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    }

    //inicio da página

    return SingleChildScrollView(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: SizedBox(
          width: 400,
          height: 425,
          child: Column(
            children: [
              CustomHeaderPopup(
                text: 'Pesagem',
                isPopupClosable: true,
              ),
              Expanded(
                child: _buildBody(),
              ),
              Row(
                children: [
                  _buildButtonBack(),
                  _buildButtonConfirm(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
