// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lotuserp_comanda/model/mesa_extrato.dart';
import '../../../../../utils/custom_text_style.dart';
import '../../../../../utils/format_numbers.dart';

class CardExtrato extends StatelessWidget {
  final MesaExtrato mesaSelected;
  final int index;
  const CardExtrato({
    Key? key,
    required this.mesaSelected,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildItemIndex() {
      return Text('Item: ${index + 1}');
    }

    Widget _buildQuantity() {
      return Text('${mesaSelected.qtde} - ',
          style: CustomTextStyle.blackBoldText(16));
    }

    Widget _buildDescriptionProduct() {
      return Text(mesaSelected.item_descricao ?? '',
          style: CustomTextStyle.blackBoldText(16));
    }

    Widget _buildValueProduct() {
      return Align(
        child: Text(
          'R\$ ${FormatNumbers.formatNumbertoString(mesaSelected.vlr_vendido)}',
          style: CustomTextStyle.blackBoldText(16),
        ),
      );
    }

    Widget _buildLineProduct() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _buildQuantity(),
              _buildDescriptionProduct(),
            ],
          ),
          Row(
            children: [
              _buildValueProduct(),
            ],
          ),
        ],
      );
    }

    Widget _buildComplements() {
      return Text(mesaSelected.item_complemento ?? '');
    }

    Widget _buildNameUser() {
      return Text('Atendente: ${mesaSelected.usuario_nome}');
    }

    return Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildItemIndex(),
              _buildLineProduct(),
              _buildComplements(),
              _buildNameUser(),
            ],
          ),
        ));
  }
}
