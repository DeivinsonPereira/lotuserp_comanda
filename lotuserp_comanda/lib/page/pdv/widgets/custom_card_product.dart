// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lotuserp_comanda/model/collection/produto.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/format_numbers.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/pdv_features.dart';

import '../../../controller/pdv_controller.dart';

class CustomCardProduct extends StatelessWidget {
  final int index;
  final produto produtoSelected;
  final PdvController pdvController;
  const CustomCardProduct({
    super.key,
    required this.index,
    required this.produtoSelected,
    required this.pdvController,
  });

  @override
  Widget build(BuildContext context) {
    final _pdvFeatures = PdvFeatures.instance;
    // Constrói o botão para remover item
    Widget _buildDeleteItem(int index) {
      return IconButton(
        onPressed: () {
          _pdvFeatures.removeCartShopping(produtoSelected);
        },
        icon: const Icon(
          FontAwesomeIcons.circleMinus,
          size: 35,
          color: Color.fromARGB(255, 170, 46, 37),
        ),
      );
    }

    // Constrói os dados do item
    Widget _buildProductsInformation(int index) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            '${pdvController.cartShopping[index].produtoSelected.id_produto} - ${pdvController.cartShopping[index].produtoSelected.descricao}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'R\$ ${FormatNumbers.formatNumbertoString(pdvController.cartShopping[index].produtoSelected.preco_venda)} ${pdvController.cartShopping[index].produtoSelected.unidade}  =  R\$ ${FormatNumbers.formatNumbertoString(pdvController.cartShopping[index].produtoSelected.preco_venda! * pdvController.cartShopping[index].quantidade)}',
          ),
        ]),
      );
    }

    Widget _buildQuantity(index) {
      return Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: CustomColors.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '${FormatNumbers.formatdoubleToInt(pdvController.cartShopping[index].quantidade)}',
            style: CustomTextStyle.whiteBoldText(18),
          ));
    }

    Widget _buildAddItem(int index, produto produtoSelected) {
      return IconButton(
        onPressed: () {
          _pdvFeatures.addCartShoppingProduct(produtoSelected);
        },
        icon: Icon(
          FontAwesomeIcons.circlePlus,
          size: 35,
          color: CustomColors.confirmButtonColor,
        ),
      );
    }

    // Constrói os cards dos itens no carrinho
    return Card(
      elevation: 2,
      child: Row(
        children: [
          // Ícone para remover item

          // Título e Subtítulo
          Expanded(
            child: _buildProductsInformation(index),
          ),
          // Trailing widget - Espaço ou outro widget, se necessário
          const Text(
            ' ',
            style: TextStyle(fontSize: 16),
          ),
          _buildDeleteItem(index),
          _buildQuantity(index),
          _buildAddItem(index, produtoSelected),
        ],
      ),
    );
  }
}
