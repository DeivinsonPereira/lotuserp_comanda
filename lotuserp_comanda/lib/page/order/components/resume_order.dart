// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/controller/pdv_controller.dart';
import '../../../model/collection/produto.dart';
import 'card_resume_order.dart';

class ResumeOrder extends StatelessWidget {
  final PdvController pdvController;
  const ResumeOrder({
    Key? key,
    required this.pdvController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Constrói o cabeçalho do widget
    Widget _buildHeader() {
      return Padding(
        // Cabeçalho, Resumo
        padding: const EdgeInsets.only(top: 15.0, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Resumo',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${pdvController.cartShopping.length} itens',
              style: const TextStyle(fontSize: 20),
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
              return CardResumeOrder(
                index: index,
                produtoSelected: produtos,
                pdvController: pdvController,
              );
            },
          ),
        ),
      );
    }

    // Constrói o corpo do widget
    Widget _buildBody() {
      return Column(
        children: [
          _buildHeader(),
          // lista de pedidos
          Expanded(
            child: _buildContent(),
          ),
        ],
      );
    }

    // Retorna o widget de resumo dos itens no carrinho
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        height: 700,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: _buildBody(),
      ),
    );
  }
}
