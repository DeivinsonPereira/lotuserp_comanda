// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:lotuserp_comanda/controller/pdv_controller.dart';
import 'package:lotuserp_comanda/model/collection/produto.dart';
import 'package:lotuserp_comanda/page/pdv/service/logic/presentation_info_resume_widget.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/pdv_features.dart';

class CustomCardComplement extends StatelessWidget {
  final int index;
  final produto produtoSelected;
  final PdvController pdvController;
  const CustomCardComplement({
    Key? key,
    required this.index,
    required this.produtoSelected,
    required this.pdvController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pdvFeatures = PdvFeatures.instance;

    // Constrói os dados do item
    Widget _buildProductsInformation(int index) {
      return PresentationInfoResumeWidget.instance.build(index);
    }

    // Constrói o botão para remover item
    Widget _buildDeletePesagemItem(int index) {
      return IconButton(
        onPressed: () {
          _pdvFeatures.deleteItemCartShopping(index);
        },
        icon: const Icon(
          FontAwesomeIcons.trash,
          size: 25,
          color: Color.fromARGB(255, 170, 46, 37),
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
