// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lotuserp_comanda/model/mesa_extrato.dart';
import '../../../../../utils/custom_text_style.dart';

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
    return Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Item: ${index + 1}'),
              Row(
                children: [
                  Text('${mesaSelected.qtde} - ',
                      style: CustomTextStyle.blackBoldText(16)),
                  Text(
                    mesaSelected.item_descricao ?? '',
                    style: CustomTextStyle.blackBoldText(16),
                  ),
                ],
              ),
              Text(mesaSelected.item_complemento ?? ''),
            ],
          ),
        ));
  }
}
