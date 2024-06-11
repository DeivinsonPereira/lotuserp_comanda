import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/controller/config_controller.dart';
import 'package:lotuserp_comanda/page/common/custom_elevated_button.dart';
import 'package:lotuserp_comanda/page/common/custom_image.dart';
import 'package:lotuserp_comanda/page/common/custom_text_field.dart';
import 'package:lotuserp_comanda/service/open_empresa_valida.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/methods/config/config_features.dart';

import '../config/popups/logic/logic_buttons_password.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _configFeatures = ConfigFeatures.instance;
    final _configController = Dependencies.configController();
    final double widthButtons = Get.size.width * 0.25;
    final double heightButtons = Get.size.height * 0.085;
    final _logicButtonsPassword = LogicButtonsPassword.instance;
    
    OpenEmpresaValida().openDialog(context);

    Widget _buildTextTitle() {
      return Text(
        'Bem Vindo(a)',
        style: CustomTextStyle.blackBoldText(40),
      );
    }

    Widget _buildLogo() {
      return CustomImage().getLogoPadrao(height: 150, width: widthButtons);
    }

    Widget _buildLoginField() {
      return SizedBox(
        width: Get.size.width * 0.5,
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
            function: () {
              //TODO : implementar a lógica para entrar
            }),
      );
    }

    Widget _buildPasswordField() {
      return SizedBox(
        width: Get.size.width * 0.5,
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
            function: () {
              // TODO : implementar a lógica para sair do programa
            }),
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
      return const Text('Version: 2.0.21\nBuilder: 1056\nDate: 11/06/2024');
    }

    Widget _buildConfigButton() {
      return Container(
        width: Get.size.width * 0.05,
        height: heightButtons,
        decoration: BoxDecoration(
          color: CustomColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
          onPressed: () {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTextTitle(),
              _buildLogo(),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            _buildLoginField(),
            _buildEnterButton(),
          ]),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPasswordField(),
              _buildExitButton(),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildCheckBox(),
              _buildTextRemember(),
            ],
          ),
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
