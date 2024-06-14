// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/controller/pdv_controller.dart';
import 'package:lotuserp_comanda/model/collection/produto.dart';
import 'package:lotuserp_comanda/page/common/custom_image.dart';
import 'package:lotuserp_comanda/page/pdv/service/logic/logic_add_product.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/format_numbers.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/pdv_get.dart';
import '../custom/pdv_colors.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _pdvGet = PdvGet.instance;

    // Constrói o nome do produto
    Widget _buildNameProduct(String nome) {
      return Text(
        nome,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: TextColors.titleColor),
      );
    }

    // Constrói a unidade do produto
    Widget _buildUnitProduct(String unidade) {
      return Text(
        unidade,
        style: const TextStyle(
            fontWeight: FontWeight.w500, color: TextColors.subtitleColor),
      );
    }

    // Constrói o valor do produto
    Widget _buildPriceProduct(String preco) {
      return Text(
        'R\$ $preco ',
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: TextColors.titleColor),
      );
    }

    // Constrói a quantidade do produto que está no carrinho
    Widget _buildContainerQuantity(produto productSelected) {
      return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: CustomColors.primaryColor,
        ),
        child: Text(_pdvGet.getQuantidadeItens(productSelected).toString(),
            style: CustomTextStyle.whiteBoldText(12)),
      );
    }

    Widget _buildImageProduct(produto productSelected) {
      return Stack(
        children: [
          CustomImage().getImageProduct(productSelected, width: 70, height: 70),
          Positioned(
              top: 0,
              right: 0,
              child: _pdvGet.getQuantidadeItens(productSelected) > 0
                  ? _buildContainerQuantity(productSelected)
                  : const SizedBox()),
        ],
      );
    }

    // Constrói o card do produto
    Widget _buildCardProduct(produto productSelected, int index) {
      return GestureDetector(
        onTap: () async {
          LogicAddProduct.instance.addProductToCartShopping(productSelected);
        },
        child: Column(children: [
          _buildImageProduct(productSelected),
          _buildNameProduct(productSelected.descricao ?? ''),
          _buildUnitProduct(productSelected.unidade ?? ''),
          _buildPriceProduct(
              FormatNumbers.formatNumbertoString(productSelected.preco_venda)),
        ]),
      );
    }

    // Constrói o grid do produto
    Widget _buildGrid() {
      return GetBuilder<PdvController>(
        builder: (_) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 5,
              mainAxisSpacing: 30,
            ),
            itemCount: _.filteredProducts.length,
            itemBuilder: (context, index) {
              produto productSelected = _.filteredProducts[index];
              return _buildCardProduct(productSelected, index);
            },
          );
        },
      );
    }

    // Retorna o widget dos produtos
    return Expanded(
      flex: 4,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildGrid(),
          )),
    );
  }
}
