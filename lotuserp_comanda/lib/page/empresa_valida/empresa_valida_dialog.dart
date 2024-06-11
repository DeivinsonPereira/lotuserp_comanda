// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/common/custom_elevated_button.dart';
import 'package:lotuserp_comanda/page/common/custom_header_popup.dart';
import 'package:lotuserp_comanda/page/common/custom_text_field.dart';
import 'package:lotuserp_comanda/service/license_approval_flow.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/format_txt.dart';
import '../../utils/dependencies.dart';

class EmpresaValidaDialog extends StatelessWidget {
  const EmpresaValidaDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final _configController = Dependencies.configController();
    double sizeTextButton = 20;
    double heightButton = 80;

    // Constrói o header do dialog
    Widget _buildHeader() {
      return CustomHeaderPopup(
        text: 'Liberar Licença',
        isPopupClosable: false,
      );
    }

    // Constrói o campo para preencher a licenca
    Widget _buildLicencaField() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: CustomTextField(
          labelText: 'Licença',
          prefixIcon: Icons.edit_document,
          controller: _configController.licencaController,
          inputFormatter: [LicenceTxt()],
        ),
      );
    }

    // Constrói o campo para preencher o cnpj
    Widget _buildCnpjField() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: CustomTextField(
          controller: _configController.cnpjController,
          prefixIcon: FontAwesomeIcons.addressCard,
          isNumeric: true,
          inputFormatter: [CnpjTxt()],
          labelText: "CNPJ",
        ),
      );
    }

    // Constrói o botão de voltar
    Widget _buildBackButton() {
      return SizedBox(
        height: heightButton,
        child: CustomElevatedButton(
            colorButton: CustomColors.informationBox,
            text: 'Sair',
            style: CustomTextStyle.whiteBoldText(sizeTextButton),
            function: () {}),
      );
    }

    // Constrói o botão de continuar
    Widget _buildContinueButton() {
      return SizedBox(
        height: heightButton,
        child: CustomElevatedButton(
            colorButton: CustomColors.confirmButtonColor,
            text: 'Liberar Online',
            style: CustomTextStyle.blackBoldText(sizeTextButton),
            function: () async =>
                await LicenseApprovalFlow.instance.executeValidation(context)),
      );
    }

    // Constrói a linha do botão de voltar e continuar
    Widget _buildLineBackAndContinueButton() {
      return SizedBox(
        child: Row(children: [
          Expanded(child: _buildBackButton()),
          Expanded(child: _buildContinueButton()),
        ]),
      );
    }

    // Constrói o corpo do dialog
    Widget _buildBody() {
      return Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 30),
          _buildLicencaField(),
          const SizedBox(height: 30),
          _buildCnpjField(),
          const Expanded(child: SizedBox()),
          _buildLineBackAndContinueButton(),
        ],
      );
    }

    // Retorna o dialog
    return SingleChildScrollView(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Container(
          height: Get.size.height * 0.5,
          width: Get.size.width * 0.4,
          color: Colors.white,
          child: _buildBody(),
        ),
      ),
    );
  }
}
