import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/choose_table/logic/logic_navigation_to_pdv.dart';
import 'package:lotuserp_comanda/page/common/custom_header.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/features/pdv_remove.dart';

import '../../utils/quantity_back.dart';
import '../common/custom_elevated_button.dart';
import '../common/custom_text_field.dart';
import '../logout/logout_page.dart';

class ChooseTable extends StatelessWidget {
  const ChooseTable({super.key});

  @override
  Widget build(BuildContext context) {
    final _pdvRemove = PdvRemove.instance;
    final _orderController = Dependencies.orderController();

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

    // Constrói o botão de busca
    Widget _buildButtonSearch() {
      return SizedBox(
        height: 58,
        width: Get.size.width * 0.8,
        child: CustomElevatedButton(
          rounded: 10,
          function: () async => LogicNavigationToPdv.instance.goToPdv(),
          colorButton: CustomColors.secondaryColor,
          text: 'Pesquisar',
          style: CustomTextStyle.whiteBoldText(18),
        ),
      );
    }

    Widget _buildContent() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLineSearch(),
          _buildSpace(0.08),
          _buildButtonSearch(),
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
      body: _buildBody(),
    );
  }
}
