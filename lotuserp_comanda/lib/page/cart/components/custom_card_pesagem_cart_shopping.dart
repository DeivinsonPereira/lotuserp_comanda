// ignore_for_file: public_member_api_docs, sort_constructors_first, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lotuserp_comanda/controller/pdv_controller.dart';
import 'package:lotuserp_comanda/model/collection/produto.dart';
import 'package:lotuserp_comanda/utils/format_numbers.dart';
import 'package:lotuserp_comanda/utils/format_string.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/pdv_features.dart';

class CustomCardPesagemCartShopping extends StatelessWidget {
  final int index;
  final int indexOrderTicketList;
  final produto produtoSelected;
  final PdvController pdvController;
  const CustomCardPesagemCartShopping({
    Key? key,
    required this.index,
    required this.produtoSelected,
    required this.pdvController,
    required this.indexOrderTicketList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pdvFeatures = PdvFeatures.instance;
    final cartShopping = pdvController
        .orderTicketsList[indexOrderTicketList].listItemsCartShopping[index];

    // Constrói os dados do item
    Widget _buildProductsPesagemInformation(int index) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          '${cartShopping.produtoSelected.id_produto} - ${cartShopping.produtoSelected.descricao}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '${FormatString.formatarQuantity(cartShopping.quantidade)} x R\$ ${FormatNumbers.formatNumbertoString(cartShopping.produtoSelected.preco_venda)} ${cartShopping.produtoSelected.unidade}  =  R\$ ${FormatNumbers.formatNumbertoString(cartShopping.produtoSelected.preco_venda! * cartShopping.quantidade)}',
        ),
      ]);
    }

    // Constrói o botão para remover item
    Widget _buildDeletePesagemItem(int index) {
      return Container(
        width: 60,
        height: 70,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
        ),
        child: IconButton(
          onPressed: () {
            _pdvFeatures.deleteItemFromOrderTicket(indexOrderTicketList, index);
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
          _buildDeletePesagemItem(index),
          const SizedBox(width: 10), // Espaço entre o ícone e o texto
          // Título e Subtítulo
          Expanded(
            child: _buildProductsPesagemInformation(index),
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
