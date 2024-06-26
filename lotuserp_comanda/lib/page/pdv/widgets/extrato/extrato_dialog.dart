import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/core/size_screen.dart';
import 'package:lotuserp_comanda/model/mesa_extrato.dart';
import 'package:lotuserp_comanda/page/common/custom_elevated_button.dart';
import 'package:lotuserp_comanda/page/common/custom_header_popup.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/extrato/components/card_extrato.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/extrato/components/line_informations_mobile.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/extrato/components/line_informations_monitor.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/extrato/logic/logic_buttons_extrato.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';

class ExtratoDialog extends StatelessWidget {
  const ExtratoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final _orderController = Dependencies.orderController();
    final _logicButtonsExtrato = LogicButtonsExtrato.instance;
    final extratoLength = _orderController.mesaExtrato.length;

    Widget _buildHeader() {
      return CustomHeaderPopup(
          text:
              'Extrato da mesa: ${_orderController.tableSelected.value.id_comanda}');
    }

    Widget _buildContent() {
      return ListView.builder(
          itemCount: extratoLength,
          itemBuilder: (context, index) {
            MesaExtrato mesaSelected = _orderController.mesaExtrato[index];
            return CardExtrato(mesaSelected: mesaSelected, index: index);
          });
    }

    Widget _buildLineInformationsMonitor() {
      return const LineInformationsMonitor();
    }

    Widget _buildLineInformationsMobile() {
      return const LineInformationsMobile();
    }

    Widget _buildBackButton() {
      return SizedBox(
        height: 60,
        child: CustomElevatedButton(
          text: 'Voltar',
          function: () {
            _logicButtonsExtrato.backButton(context);
          },
          colorButton: CustomColors.informationBox,
          style: CustomTextStyle.whiteBoldText(20),
        ),
      );
    }

    Widget _buildRequestBuildButton() {
      return SizedBox(
        height: 60,
        child: CustomElevatedButton(
          text: 'Solicitar Conta',
          function: () => _logicButtonsExtrato.requestBillButton(),
          colorButton: CustomColors.confirmButtonColor,
          style: CustomTextStyle.blackBoldText(20),
        ),
      );
    }

    Widget _buildBackAndContinueButton() {
      return Row(
        children: [
          Expanded(child: _buildBackButton()),
          Expanded(
            child: _buildRequestBuildButton(),
          ),
        ],
      );
    }

    Widget _buildBody() {
      return Column(
        children: [
          _buildHeader(),
          Expanded(
            child: _buildContent(),
          ),
          SizeScreen.isMobile
              ? _buildLineInformationsMobile()
              : _buildLineInformationsMonitor(),
          _buildBackAndContinueButton()
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
        width:
            SizeScreen.isMobile ? Get.size.width * 0.9 : Get.size.width * 0.5,
        child: _buildBody(),
      ),
    );
  }
}
