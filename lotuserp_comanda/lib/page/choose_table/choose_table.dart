import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/choose_table/logic/logic_navigation_to_pdv.dart';
import 'package:lotuserp_comanda/page/common/custom_header.dart';
import 'package:lotuserp_comanda/service/code_sacanner_service.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/methods/order/order_features.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/features/pdv_remove.dart';

import '../../utils/quantity_back.dart';
import '../common/custom_elevated_button.dart';
import '../common/custom_text_field.dart';
import '../logout/logout_page.dart';
import '../pdv/widgets/extrato/logic/open_dialog_extrato.dart';

class ChooseTable extends StatelessWidget {
  const ChooseTable({super.key});

  @override
  Widget build(BuildContext context) {
    final _pdvRemove = PdvRemove.instance;
    final _orderController = Dependencies.orderController();
    final _orderFeatures = OrderFeatures.instance;

    Widget _buildSpace(double size) {
      return SizedBox(height: Get.size.height * size);
    }

    Widget _buildHeader() {
      return CustomHeader(
          title: 'Escolha uma mesa',
          hasIcon: true,
          onPressed: () => Get.dialog(
              barrierDismissible: false,
              LogoutPage(
                text: 'Deseja sair do aplicativo?',
                function: () {
                  QuantityBack.back(2);
                  _pdvRemove.removeAllOrderToOrderTicketsList();
                },
              )));
    }

    Widget _buildLineSearch() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: Get.size.width * 0.8,
            child: CustomTextField(
              functionSubmitted: (value) {
                FocusScope.of(context).unfocus();
                LogicNavigationToPdv.instance.goToPdv();
              },
              isNumeric: true,
              inputFormatter: [FilteringTextInputFormatter.digitsOnly],
              prefixIcon: Icons.search,
              labelText: 'Busque por Comanda',
              controller: _orderController.commandNumberController,
            ),
          ),
        ),
      );
    }

    Widget _buildButtons(IconData icon, Function() function, String text) {
      return SizedBox(
        height: 58,
        width: Get.size.width * 0.8,
        child: CustomElevatedButton(
          icon: icon,
          rounded: 10,
          function: function,
          colorButton: CustomColors.secondaryColor,
          text: text,
          style: CustomTextStyle.whiteBoldText(18),
        ),
      );
    }

    // Constrói o botão de busca
    Widget _buildButtonSearch() {
      return _buildButtons(
        Icons.search,
        () async {
          FocusScope.of(context).unfocus();
          LogicNavigationToPdv.instance.goToPdv();
        },
        'Pesquisar',
      );
    }

    Widget _buildButtonReadQrCode() {
      return _buildButtons(
        FontAwesomeIcons.barcode,
        () async {
          FocusScope.of(context).unfocus();
          await CodeScannerService.instance.readBarCode();
          // _orderController.readBarCode();
        },
        'Ler Código de Barras',
      );
    }

    Widget _buildButtonReadBarCode() {
      return _buildButtons(
        FontAwesomeIcons.qrcode,
        () async {
          FocusScope.of(context).unfocus();
          await CodeScannerService.instance.readBarCode(isQrCode: true);
          // _orderController.readBarCode();
        },
        'Ler Qr Code',
      );
    }

    Widget _buildButtonShowExtract() {
      return _buildButtons(
        Icons.list,
        () async {
          FocusScope.of(context).unfocus();
          _orderFeatures.setTableSelectedById(
              _orderController.commandNumberController.text);
          OpenDialogExtrato().open();
          // _orderController.showExtract();
        },
        'Extrato',
      );
    }

    Widget _buildContent() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLineSearch(),
          _buildSpace(0.08),
          _buildButtonSearch(),
          _buildSpace(0.02),
          _buildButtonReadQrCode(),
          _buildSpace(0.02),
          _buildButtonReadBarCode(),
          _buildSpace(0.02),
          _buildButtonShowExtract(),
        ],
      );
    }

    Widget _buildBody() {
      return Column(
        children: [
          _buildHeader(),
          _buildSpace(0.02),
          Expanded(child: _buildContent()),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.size.height,
          width: Get.size.width,
          child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => FocusScope.of(context).unfocus(),
              child: _buildBody()),
        ),
      ),
    );
  }
}
