// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:lotuserp_comanda/controller/pdv_controller.dart';
import 'package:lotuserp_comanda/model/collection/produto.dart';
import 'package:lotuserp_comanda/page/cart/components/presentation_info_resume_cart_shopping.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/features/pdv_remove.dart';

class CustomCardComplementCartShopping extends StatelessWidget {
  final int index;
  final int indexOrderTicketList;
  final produto produtoSelected;
  final PdvController pdvController;
  const CustomCardComplementCartShopping({
    Key? key,
    required this.index,
    required this.produtoSelected,
    required this.pdvController,
    required this.indexOrderTicketList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pdvRemove = PdvRemove.instance;

    // Constrói os dados do item
    Widget _buildProductsInformation(int index) {
      return PresentationInfoResumeCartShopping.instance
          .build(index, indexOrderTicketList);
    }

    // Constrói o botão para remover item
    Widget _buildDeletePesagemItem(int index) {
      return SizedBox(
        width: 60,
        child: IconButton(
          onPressed: () {
            _pdvRemove.deleteItemFromOrderTicket(indexOrderTicketList, index);
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
          _buildDeletePesagemItem(index),
          const SizedBox(width: 10),
          Expanded(child: _buildProductsInformation(index)),
          const Text(' ', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
