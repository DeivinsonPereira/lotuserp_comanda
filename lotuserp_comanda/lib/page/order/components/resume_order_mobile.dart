// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/controller/pdv_controller.dart';
import 'package:lotuserp_comanda/model/item_cart_shopping.dart';
import 'package:lotuserp_comanda/page/common/custom_elevated_button.dart';
import 'package:lotuserp_comanda/page/pdv/service/logic/verification_type_resume.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import '../../../model/collection/produto.dart';

class ResumeOrderMobile extends StatelessWidget {
  final PdvController pdvController;
  const ResumeOrderMobile({
    Key? key,
    required this.pdvController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Constrói o cabeçalho do widget
    Widget _buildHeader() {
      return Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Resumo',
              style: CustomTextStyle.blackBoldText(30),
            ),
            Text(
              '${pdvController.cartShopping.length} itens',
              style: CustomTextStyle.blackText(20),
            ),
          ],
        ),
      );
    }

    // Constrói o conteúdo do widget de resumo
    Widget _buildContent() {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Obx(
          () => ListView.builder(
            itemCount: pdvController.cartShopping.length,
            itemBuilder: (context, index) {
              produto produtos =
                  pdvController.cartShopping[index].produtoSelected;

              ItemCartShopping itemCartShopping =
                  pdvController.cartShopping[index];

              return VerificationTypeResume.instance.buildResume(
                  produtos, itemCartShopping, index, pdvController);

              /*return CardResumeOrder(
                index: index,
                produtoSelected: produtos,
                pdvController: pdvController,
              );*/
            },
          ),
        ),
      );
    }

    Widget _buildBackButton() {
      return Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 60,
              child: CustomElevatedButton(
                  colorButton: CustomColors.informationBox,
                  text: 'Voltar',
                  style: CustomTextStyle.whiteBoldText(24),
                  function: () => Get.back()),
            ),
          ),
        ],
      );
    }

    // Constrói o corpo do widget
    Widget _buildBody() {
      return Column(
        children: [
          _buildHeader(),
          Expanded(child: _buildContent()),
          _buildBackButton(),
        ],
      );
    }

    // Retorna o widget de resumo dos itens no carrinho
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: Get.size.height * 0.7,
        width: Get.size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: _buildBody(),
      ),
    );
  }
}
