import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/common/custom_elevated_button.dart';
import 'package:lotuserp_comanda/page/common/custom_header_popup.dart';
import 'package:lotuserp_comanda/page/common/custom_text_field.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/extrato/logic/logic_buttons_quantity_people.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';

import '../../../../../core/size_screen.dart';
import '../../../../../utils/dependencies.dart';

class QuantityPeople extends StatelessWidget {
  const QuantityPeople({super.key});

  @override
  Widget build(BuildContext context) {
    final _orderController = Dependencies.orderController();
    final _logicButtonsQuantityPeople = LogicButtonsQuantityPeople.instance;

    Widget _buildBody() {
      Widget _buildHeader() {
        return CustomHeaderPopup(
            text: 'Divisão da Conta', isPopupClosable: false);
      }

      Widget _buildTitle() {
        return Text(
          'Conta dividida para quantas pessoas?',
          style: CustomTextStyle.blackBoldText(20),
          textAlign: TextAlign.center,
        );
      }

      // inputformatter aceita paenas numeros
      Widget _buildTextField() {
        return SizedBox(
          width:
              SizeScreen.isMobile ? Get.size.width * 0.5 : Get.size.width * 0.2,
          child: CustomTextField(
            labelText: 'digite aqui',
            controller: _orderController.numberPeopleController,
            isNumeric: true,
            inputFormatter: [FilteringTextInputFormatter.digitsOnly],
            prefixIcon: Icons.person,
          ),
        );
      }

      Widget _buildBackButton() {
        return SizedBox(
          height: 60,
          child: CustomElevatedButton(
              colorButton: CustomColors.informationBox,
              text: 'Voltar',
              style: CustomTextStyle.whiteBoldText(20),
              function: () => _logicButtonsQuantityPeople.backButton()),
        );
      }

      Widget _buildConfirmButton() {
        return SizedBox(
          height: 60,
          child: CustomElevatedButton(
              colorButton: CustomColors.confirmButtonColor,
              text: 'Confirmar',
              style: CustomTextStyle.blackBoldText(20),
              function: () {
                _logicButtonsQuantityPeople.confirmButton(context);
              }),
        );
      }

      Widget _buildLineButtons() {
        return Row(
          children: [
            Expanded(child: _buildBackButton()),
            Expanded(child: _buildConfirmButton()),
          ],
        );
      }

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(),
          SizedBox(
            height: Get.size.height * 0.03,
          ),
          _buildTitle(),
          SizedBox(height: Get.size.height * 0.03),
          _buildTextField(),
          Expanded(
              child: SizedBox(
            height: Get.size.height * 0.03,
          )),
          _buildLineButtons(),
        ],
      );
    }

    return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: SizedBox(
          height: SizeScreen.isMobile
              ? Get.size.height * 0.4
              : Get.size.height * 0.5,
          width:
              SizeScreen.isMobile ? Get.size.width * 0.5 : Get.size.width * 0.3,
          child: _buildBody(),
        ));
  }
}
