import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/controller/config_controller.dart';
import 'package:lotuserp_comanda/page/common/custom_elevated_button.dart';
import 'package:lotuserp_comanda/page/common/custom_image.dart';
import 'package:lotuserp_comanda/page/common/custom_text_field.dart';
import 'package:lotuserp_comanda/page/config/popups/logic/logic_buttons_password.dart';
import 'package:lotuserp_comanda/page/home/logic/logic_buttons_home_page.dart';
import 'package:lotuserp_comanda/service/open_empresa_valida.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';

import '../../../utils/methods/config/config_features.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final _configFeatures = ConfigFeatures.instance;
    final _configController = Dependencies.configController();
    final double widthButtons = Get.size.width * 0.8;
    final double heightButtons = Get.size.height * 0.085;
    final _logicButtonsPassword = LogicButtonsPassword.instance;
    final _logicButtonsHomePage = LogicButtonsHomePage.instance;
    final _customImage = CustomImage.instance;

    OpenEmpresaValida().openDialog(context);

    Widget _buildTextTitle() {
      return Text(
        'Bem Vindo(a)',
        style: CustomTextStyle.blackBoldText(40),
      );
    }

    Widget _buildLogo() {
      return _customImage.getLogoPadrao();
    }

    Widget _buildLoginField() {
      return SizedBox(
        width: Get.size.width * 0.8,
        child: CustomTextField(
          controller: _configController.loginUser,
          labelText: 'Login',
          prefixIcon: Icons.person,
        ),
      );
    }

    Widget _buildEnterButton() {
      return SizedBox(
        width: widthButtons,
        height: heightButtons,
        child: CustomElevatedButton(
            rounded: 10,
            colorButton: CustomColors.primaryColor,
            text: 'Entrar',
            style: CustomTextStyle.whiteBoldText(24),
            function: () async => await _logicButtonsHomePage.confirmButton()),
      );
    }

    Widget _buildPasswordField() {
      return SizedBox(
        width: Get.size.width * 0.8,
        child: Obx(() => CustomTextField(
              controller: _configController.passwordUser,
              labelText: 'Senha',
              isSecret: true,
              prefixIcon: Icons.key,
              suffixIcon: _configController.isObscure.value == false
                  ? Icons.remove_red_eye
                  : Icons.visibility_off,
            )),
      );
    }

    Widget _buildExitButton() {
      return SizedBox(
        width: widthButtons,
        height: heightButtons,
        child: CustomElevatedButton(
            rounded: 10,
            colorButton: Colors.red,
            text: 'Sair',
            style: CustomTextStyle.whiteBoldText(24),
            function: () => _logicButtonsHomePage.exitButtonLogic()),
      );
    }

    Widget _buildCheckBox() {
      return Transform.scale(
        scale: 1.3,
        child: Obx(() => Checkbox(
            shape: const CircleBorder(),
            value: _configController.isRemember.value,
            onChanged: (value) {
              _configFeatures.toggleIsRemember();
            })),
      );
    }

    Widget _buildTextRemember() {
      return const Text('Relembrar');
    }

    Widget _buildVersionDate() {
      return const Text('Version: 2.0.21\nBuilder: 1056\nDate: 19/06/2024');
    }

    Widget _buildConfigButton() {
      return Container(
        width: Get.size.width * 0.2,
        height: heightButtons,
        decoration: BoxDecoration(
          color: CustomColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
          onPressed: () {
            _configFeatures.clearPasswordUserController();
            _logicButtonsPassword.openCreatePasswordDialog(context);
          },
          icon: const Icon(
            Icons.settings,
            size: 45,
          ),
          color: CustomColors.secondaryColor,
        ),
      );
    }

    Widget _buildContent() {
      return Column(
        children: [
          _buildTextTitle(),
          Expanded(child: _buildLogo()),
          _buildLoginField(),
          const SizedBox(height: 20),
          _buildPasswordField(),
          Row(
            children: [
              _buildCheckBox(),
              _buildTextRemember(),
            ],
          ),
          const SizedBox(height: 20),
          _buildEnterButton(),
          const SizedBox(height: 20),
          _buildExitButton(),
          const Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildVersionDate(),
              _buildConfigButton(),
            ],
          )
        ],
      );
    }

    Widget _buildBody() {
      return SizedBox(
        width: Get.size.width,
        height: Get.size.height,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: Get.size.width * 0.95,
            height: Get.size.height * 0.95,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: _buildContent(),
            ),
          ),
        ),
      );
    }

    return GetBuilder<ConfigController>(
      builder: (_) => Scaffold(
        backgroundColor: _.selectedColor.value.color,
        body: SingleChildScrollView(child: _buildBody()),
      ),
    );
  }
}
