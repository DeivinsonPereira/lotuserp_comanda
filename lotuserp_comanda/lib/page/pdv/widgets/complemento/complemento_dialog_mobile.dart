// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/model/collection/produto.dart';
import 'package:lotuserp_comanda/page/common/custom_elevated_button.dart';
import 'package:lotuserp_comanda/page/common/custom_header_popup.dart';
import 'package:lotuserp_comanda/page/common/custom_text_field_five_lines.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/complemento/components/build_card_complemento_mobile.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/features/pdv_add.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/features/pdv_remove.dart';
import '../../../../controller/pdv_controller.dart';
import '../../../../model/collection/complemento.dart';

class ComplementoDialogMobile extends StatelessWidget {
  final produto produtoSelected;
  const ComplementoDialogMobile({
    Key? key,
    required this.produtoSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pdvController = Dependencies.pdvController();
    final _pdvAdd = PdvAdd.instance;
    final _pdvRemove = PdvRemove.instance;
    const double sizeButtons = 60;

    Widget _buildBackButton() {
      return SizedBox(
        height: sizeButtons,
        child: CustomElevatedButton(
          function: () {
            Get.back();
            _pdvRemove.clearAllComplementSelected();
            _pdvRemove.clearComplementoController();
          },
          style: CustomTextStyle.whiteBoldText(20),
          text: 'Voltar',
          colorButton: CustomColors.informationBox,
        ),
      );
    }

    Widget _buildConfirmButton() {
      return SizedBox(
        height: sizeButtons,
        child: CustomElevatedButton(
            colorButton: CustomColors.confirmButtonColor,
            text: 'Confirmar',
            style: CustomTextStyle.blackBoldText(20),
            function: () {
              _pdvAdd.addProductWithComplementToCartShopping(produtoSelected);
              Get.back();
            }),
      );
    }

    Widget _buildBackAndConfirmButton() {
      return Row(children: [
        Expanded(
          child: _buildBackButton(),
        ),
        Expanded(
          child: _buildConfirmButton(),
        )
      ]);
    }

    Widget _buildComplementos() {
      return GetBuilder<PdvController>(
        builder: (_) {
          return ListView.builder(
              itemCount: _.filteredComplementos.length,
              itemBuilder: (context, index) {
                complemento complementoSelecionado =
                    _.filteredComplementos[index];
                return BuildCardComplementoMobile(
                  complementoSelecionado: complementoSelecionado,
                  index: index,
                );
              });
        },
      );
    }

    Widget _buildHeader() {
      return CustomHeaderPopup(text: 'Complemento');
    }

    Widget _buildTextField() {
      return CustomTextFieldFiveLines(
        controller: _pdvController.complementoController,
        maxLines: 3,
        textHint: 'Digite o complemento',
      );
    }

    Widget _buildBody() {
      return SizedBox(
        height: Get.size.height * 0.9,
        width: Get.size.width * 0.9,
        child: Column(children: [
          _buildHeader(),
          Expanded(
            child: _buildComplementos(),
          ),
          _buildTextField(),
          _buildBackAndConfirmButton(),
        ]),
      );
    }

    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: _buildBody(),
    );
  }
}
