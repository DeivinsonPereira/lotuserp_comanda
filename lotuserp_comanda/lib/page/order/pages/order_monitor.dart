// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/common/custom_cart_icon.dart';
import 'package:lotuserp_comanda/page/common/custom_elevated_button.dart';
import 'package:lotuserp_comanda/page/common/custom_text_field.dart';
import 'package:lotuserp_comanda/page/logout/logout_page.dart';
import 'package:lotuserp_comanda/page/order/service/logic/logic_get_tables_by_button.dart';
import 'package:lotuserp_comanda/page/order/service/logic/logic_navigation_to_cart_shopping.dart';
import 'package:lotuserp_comanda/page/order/service/logic/logic_update_tables.dart';
import 'package:lotuserp_comanda/service/code_sacanner_service.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/methods/order/order_features.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/features/pdv_remove.dart';
import 'package:lotuserp_comanda/utils/quantity_back.dart';
import '../components/card_table_order.dart';
import '../service/logic/logic_colors.dart';
import '../service/logic/logic_get_title_order_table.dart';

class OrderMonitor extends StatelessWidget {
  const OrderMonitor({super.key});

  @override
  Widget build(BuildContext context) {
    final _orderController = Dependencies.orderController();
    final _orderFeatures = OrderFeatures.instance;
    final _pdvRemove = PdvRemove.instance;

    Widget _buildSpace(double size) {
      return SizedBox(width: Get.size.width * size);
    }

    // Constrói o título
    Widget _buildTitle() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.dialog(
                        barrierDismissible: false,
                        LogoutPage(
                          text: 'Deseja sair do aplicativo?',
                          function: () {
                            QuantityBack.back(2);
                            _pdvRemove.removeAllOrderToOrderTicketsList();
                          },
                        ));
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  )),
              LogicTitleOrderTable().build(),
            ],
          ),
        ),
      );
    }

    Widget _buildButtons(IconData icon, Function() function) {
      return InkWell(
        onTap: function,
        child: Container(
            height: 58,
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: CustomColors.secondaryColor,
            ),
            child: Center(
              child: Icon(
                icon,
                color: Colors.white,
              ),
            )),
      );
    }

    Widget _buildReadQrCodeButton() {
      return _buildButtons(
        FontAwesomeIcons.qrcode,
        () async =>
            await CodeScannerService.instance.readBarCode(isQrCode: true),
      );
    }

    Widget _buildReadBarCodeButton() {
      return _buildButtons(
        FontAwesomeIcons.barcode,
        () async => await CodeScannerService.instance.readBarCode(),
      );
    }

    // Constrói o campo de busca
    Widget _buildSearchField() {
      return Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: Get.size.width * 0.2,
          child: CustomTextField(
            isNumeric: true,
            inputFormatter: [FilteringTextInputFormatter.digitsOnly],
            prefixIcon: Icons.search,
            labelText: 'Busque por Comanda',
            controller: _orderController.searchTableController,
          ),
        ),
      );
    }

    // Constrói o botão de busca
    Widget _buildButtonSearch() {
      return Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: SizedBox(
          height: 58,
          child: CustomElevatedButton(
            function: () {
              _orderFeatures.searchTableById();
            },
            colorButton: CustomColors.secondaryColor,
            text: 'Pesquisar',
            style: CustomTextStyle.whiteBoldText(18),
            rounded: 10,
          ),
        ),
      );
    }

    // Constrói o campo de busca
    Widget _buildTitleAndSearchField() {
      return SizedBox(
        width: Get.size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTitle(),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 8.0),
              child: Row(
                children: [
                  _buildSearchField(),
                  _buildButtonSearch(),
                  _buildSpace(0.015),
                  _buildReadBarCodeButton(),
                  _buildSpace(0.015),
                  _buildReadQrCodeButton(),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // Constrói os botões
    Widget _buildButtonBody(String text, Function() function, int indexButton) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Obx(() => CustomElevatedButton(
            function: function,
            colorButton: LogicColors().getColorsButton(indexButton),
            text: text,
            style: LogicColors().getColorsTextButton(indexButton),
            rounded: 10)),
      );
    }

    // Constrói o botão de atualizar
    Widget _buildUpdateButton() {
      return SizedBox(
        width: Get.size.width * 0.10,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: InkWell(
            onTap: () async =>
                await LogicUpdateTables().updateTables(context: context),
            child: Container(
              width: Get.size.width * 0.1,
              height: 50,
              decoration: BoxDecoration(
                color: CustomColors.secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    }

    // Constrói a linha dos botões
    Widget _buildLineFilterButtons() {
      return Container(
        height: 60,
        width: Get.size.width,
        color: Colors.grey[300],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(children: [
                SizedBox(width: Get.size.width * 0.02),
                _buildUpdateButton(),
                SizedBox(width: Get.size.width * 0.02),
                _buildButtonBody(
                    'Todas',
                    () => LogicGetTablesByButton(_orderController)
                        .getTables(0, -1),
                    0),
                _buildButtonBody(
                    'Livres',
                    () => LogicGetTablesByButton(_orderController)
                        .getTables(1, 0),
                    1),
                _buildButtonBody(
                    'Ocupadas',
                    () => LogicGetTablesByButton(_orderController)
                        .getTables(2, 1),
                    2),
                _buildButtonBody(
                    'Contas',
                    () => LogicGetTablesByButton(_orderController)
                        .getTables(3, 2),
                    3),
                _buildButtonBody(
                    'Reservadas',
                    () => LogicGetTablesByButton(_orderController)
                        .getTables(4, 4),
                    4),
              ]),
            ),
            CustomCartIcon(
                function: () =>
                    LogicNavigationToCartShopping.instance.navigation()),
            SizedBox(width: Get.size.width * 0.02),
          ],
        ),
      );
    }

    // Constrói o corpo do popUp
    Widget _buildBody() {
      return Column(
        children: [
          _buildTitleAndSearchField(),
          const SizedBox(height: 10),
          const Expanded(
            child: CardTableOrder(count: 9, sizeNumberCard: 40),
          ),
          _buildLineFilterButtons(),
        ],
      );
    }

    // Constrói o popUp
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }
}
