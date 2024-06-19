// ignore_for_file: public_member_api_docs, sort_constructors_first, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:lotuserp_comanda/model/collection/complemento.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/features/pdv_add.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/features/pdv_remove.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/get/pdv_get.dart';

import '../../../../../utils/format_numbers.dart';

class BuildCardComplementoMonitor extends StatelessWidget {
  final complemento complementoSelecionado;
  final int index;
  const BuildCardComplementoMonitor({
    Key? key,
    required this.complementoSelecionado,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pdvAdd = PdvAdd.instance;
    final _pdvRemove = PdvRemove.instance;
    final _pdvGet = PdvGet.instance;
    double sizeIcons = 45;

    // Constrói o icone de adiconar complemento
    Widget _buildIconPlus() {
      return IconButton(
        onPressed: () {
          _pdvAdd.addComplementToListSelected(complementoSelecionado);
        },
        icon: Icon(
          Icons.add_circle,
          color: CustomColors.confirmButtonColor,
          size: sizeIcons,
        ),
      );
    }

    // Constrói a quantidade do produto
    Widget _buildQuantity() {
      return Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: CustomColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          _pdvGet.getQuantidadeComplementos(complementoSelecionado).toString(),
          style: CustomTextStyle.whiteText(14),
        ),
      );
    }

    // Constrói o icone de adiconar complemento
    Widget _buildIconRemove() {
      return IconButton(
        onPressed: () {
          _pdvRemove.removeComplementSelected(complementoSelecionado);
        },
        icon: Icon(
          Icons.remove_circle,
          color: Colors.red,
          size: sizeIcons,
        ),
      );
    }

    // Constrói o valor do complemento
    Widget _buildValue() {
      return Text(
        FormatNumbers.formatNumbertoString(complementoSelecionado.valor),
        style: CustomTextStyle.blackText(20),
      );
    }

    // Constrói o nome do complemento no card
    Widget _buildName() {
      return Text(complementoSelecionado.descricao ?? '');
    }

    // Constrói o corpo do card
    Widget _buildBody() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildName(),
            Row(
              children: [
                _buildValue(),
                const SizedBox(
                  width: 10,
                ),
                _buildIconPlus(),
                _buildQuantity(),
                _buildIconRemove(),
              ],
            ),
          ],
        ),
      );
    }

    // Constrói o card
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Container(
        constraints: const BoxConstraints(minHeight: 70),
        child: Material(
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: _buildBody(),
        ),
      ),
    );
  }
}
