import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lotuserp_comanda/controller/pdv_controller.dart';
import 'package:lotuserp_comanda/model/collection/produto.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/format_numbers.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/pdv_features.dart';

class CustomCardProductCartShopping extends StatelessWidget {
  final int index;
  final int indexOrderTicketList;
  final produto produtoSelected;
  final PdvController pdvController;
  const CustomCardProductCartShopping({
    super.key,
    required this.index,
    required this.produtoSelected,
    required this.pdvController,
    required this.indexOrderTicketList,
  });

  @override
  Widget build(BuildContext context) {
    final _pdvFeatures = PdvFeatures.instance;
    final cartShopping = pdvController
        .orderTicketsList[indexOrderTicketList].listItemsCartShopping[index];

    // Constrói o botão para remover item
    Widget _buildDeleteItem(int index) {
      return IconButton(
        onPressed: () {
          _pdvFeatures.removeCartShoppingFromOrderTicketList(
              indexOrderTicketList, cartShopping, index);
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
            '${cartShopping.produtoSelected.id_produto} - ${cartShopping.produtoSelected.descricao}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'R\$ ${FormatNumbers.formatNumbertoString(cartShopping.produtoSelected.preco_venda)} ${cartShopping.produtoSelected.unidade}  =  R\$ ${FormatNumbers.formatNumbertoString(cartShopping.produtoSelected.preco_venda! * cartShopping.quantidade)}',
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
            '${FormatNumbers.formatdoubleToInt(cartShopping.quantidade)}',
            style: CustomTextStyle.whiteBoldText(18),
          ));
    }

    Widget _buildAddItem(int index, produto produtoSelected) {
      return IconButton(
        onPressed: () {
          _pdvFeatures.addCartShoppingProductFromOrderTicket(cartShopping);
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
