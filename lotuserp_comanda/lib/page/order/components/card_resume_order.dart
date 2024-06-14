// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lotuserp_comanda/controller/pdv_controller.dart';
import 'package:lotuserp_comanda/utils/format_string.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/pdv_features.dart';

import '../../../model/collection/produto.dart';
import '../../../utils/format_numbers.dart';

class CardResumeOrder extends StatelessWidget {
  final int index;
  final produto produtoSelected;
  final PdvController pdvController;
  const CardResumeOrder({
    Key? key,
    required this.index,
    required this.produtoSelected,
    required this.pdvController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pdvFeatures = PdvFeatures.instance;
    // Constrói os dados do item
    Widget _buildProductsPesagemInformation() {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          '${pdvController.cartShopping[index].produtoSelected.id_produto} - ${pdvController.cartShopping[index].produtoSelected.descricao}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '${FormatString.formatarQuantity(pdvController.cartShopping[index].quantidade)} x R\$ ${FormatNumbers.formatNumbertoString(pdvController.cartShopping[index].produtoSelected.preco_venda)} ${pdvController.cartShopping[index].produtoSelected.unidade}  =  R\$ ${FormatNumbers.formatNumbertoString(pdvController.cartShopping[index].produtoSelected.preco_venda! * pdvController.cartShopping[index].quantidade)}',
        ),
      ]);
    }

    // Constrói o botão para remover item
    Widget _buildDeletePesagemItem() {
      return Container(
        width: 60,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
          color: Colors.grey[400],
        ),
        child: IconButton(
          onPressed: () {
            _pdvFeatures.removeCartShopping(index);
          },
          icon: const Icon(
            FontAwesomeIcons.trash,
            size: 20,
            color: Color.fromARGB(255, 170, 46, 37),
          ),
        ),
      );
    }

    return Card(
      elevation: 2,
      child: Row(
        children: [
          // Ícone para remover item
          _buildDeletePesagemItem(),
          const SizedBox(width: 10), // Espaço entre o ícone e o texto
          // Título e Subtítulo
          Expanded(
            child: _buildProductsPesagemInformation(),
          ),
          // Trailing widget - Espaço ou outro widget, se necessário
          const Text(
            ' ',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
