import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/common/custom_elevated_button.dart';
import 'package:lotuserp_comanda/page/config/popups/logic/logic_buttons_password.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:pinput/pinput.dart';

import '../../../../utils/custom_text_style.dart';
import '../../../../utils/methods/config/config_features.dart';
import '../../../common/custom_header_popup.dart';

class CreatePasswordDialogMobile extends StatelessWidget {
  const CreatePasswordDialogMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final _configController = Dependencies.configController();
    final _configFeatures = ConfigFeatures.instance;
    double height = Get.size.height;
    double width = Get.size.width;
    double heightButton = 80;

    // Constrói o Header do dialog
    Widget _buildHeader() {
      return CustomHeaderPopup(
        text: 'Definir senha',
        isPopupClosable: true,
      );
    }

    // Constrói o texto do dialog
    Widget _buildText() {
      return SizedBox(
        height: height * 0.08,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            'Defina a sua senha',
            style: CustomTextStyle.blackText(20),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    // Constrói as caixas de texto para a senha
    Widget _buildPasswordField() {
      return Pinput(
        defaultPinTheme: PinTheme(
          textStyle: CustomTextStyle.whiteBoldText(24),
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(10)),
          height: height * 0.08,
          width: width * 0.08,
        ),
        length: 6,
        autofocus: true,
        showCursor: true,
        controller: _configController.passwordConfigController,
      );
    }

    // COnstrói o botão voltar
    Widget _buildBackButton() {
      return SizedBox(
        height: heightButton,
        child: CustomElevatedButton(
            colorButton: CustomColors.informationBox,
            text: 'Voltar',
            style: CustomTextStyle.whiteBoldText(20),
            function: () {
              _configFeatures.clearPasswordConfigAndController();
              Get.back();
            }),
      );
    }

    // Constrói o Botão continuar
    Widget _buildContinueButton() {
      return SizedBox(
          height: heightButton,
          child: CustomElevatedButton(
              colorButton: CustomColors.confirmButtonColor,
              text: 'Continuar',
              style: CustomTextStyle.blackBoldText(20),
              function: () async => await LogicButtonsPassword.instance
                  .openConfirmPasswordDialog()));
    }

    // Constrói a linha dos botões voltar e continuar
    Widget _buildBackAndContinueButtons() {
      return Row(children: [
        Expanded(child: _buildBackButton()),
        Expanded(child: _buildContinueButton()),
      ]);
    }

    // Constróui o corpo do dialog
    Widget _buildBody() {
      return Column(children: [
        _buildHeader(),
        _buildText(),
        Expanded(child: _buildPasswordField()),
        _buildBackAndContinueButtons()
      ]);
    }

    // retorna o Dialog
    return SingleChildScrollView(
      child: Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          height: height * 0.5,
          width: width * 0.5,
          child: _buildBody(),
        ),
      ),
    );
  }
}
