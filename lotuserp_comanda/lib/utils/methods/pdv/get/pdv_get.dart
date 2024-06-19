import 'package:get/get.dart';
import 'package:lotuserp_comanda/model/collection/image_path_group.dart';
import 'package:lotuserp_comanda/model/collection/image_path_product.dart';
import 'package:lotuserp_comanda/model/collection/produto.dart';
import 'package:lotuserp_comanda/model/collection/produto_grupo.dart';
import 'package:lotuserp_comanda/model/comanda_selecionada.dart';
import 'package:lotuserp_comanda/model/complement_cart_shopping.dart';
import 'package:lotuserp_comanda/model/item_cart_shopping.dart';
import 'package:lotuserp_comanda/shared/repositories/isar_db/generic_repository_multiple.dart';
import 'package:lotuserp_comanda/shared/repositories/isar_db/isar_service.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/format_numbers.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/get/pdv_bool.dart';

import '../../../../model/collection/complemento.dart';

class PdvGet {
  final _genericRepositoryMultiple = GenericRepositoryMultiple.instance;
  final _pdvController = Dependencies.pdvController();
  final _pdvBool = PdvBool.instance;
  final _isarService = IsarService.instance;

  PdvGet._privateConstructor();

  static final PdvGet _instance = PdvGet._privateConstructor();

  static PdvGet get instance => _instance;

  List<produto> filterProductByGroup(produto_grupo grupo) {
    return _pdvController.allProducts
        .where((element) => element.id_grupo == grupo.id_grupo)
        .toList();
  }

  List<produto> filterProductByDesc() {
    return _pdvController.allProducts
        .where((element) => element.descricao!.toUpperCase().startsWith(
            _pdvController.searchProductController.text.toUpperCase()))
        .toList();
  }

  ComplementCartShopping? hasEqualsComplement(complemento complementoSelected) {
    return _pdvController.listComplementSelected
        .where((element) =>
            element.complementos.id_complemento ==
            complementoSelected.id_complemento)
        .firstOrNull;
  }

  int getQuantidadeComplementos(complemento complementoSelected) {
    return _pdvController.listComplementSelected
        .where((element) =>
            element.complementos.id_complemento ==
            complementoSelected.id_complemento)
        .fold(0, (element, value) => element + value.quantity);
  }

  int getQuantidadeItens(produto produtoSelected) {
    int quantity = 0;

    if (produtoSelected.produto_pesagem == 1) {
      List<ItemCartShopping> itemCartShopping = _pdvController.cartShopping
          .where((element) =>
              element.produtoSelected.id_produto == produtoSelected.id_produto)
          .toList();

      quantity = itemCartShopping.length;

      return quantity;
    }

    quantity = _pdvController.cartShopping
        .where((element) =>
            element.produtoSelected.id_produto == produtoSelected.id_produto)
        .fold(0, (element, value) => element + value.quantidade.floor());

    return quantity;
  }

  Future<List<image_path_group>> getImagemGrupos() async {
    final isar = await _isarService.db;
    return await _genericRepositoryMultiple
        .getAll<image_path_group>(isar.image_path_groups);
  }

  Future<List<image_path_product>> getImagemProdutos() async {
    final isar = await _isarService.db;
    return await _genericRepositoryMultiple
        .getAll<image_path_product>(isar.image_path_products);
  }

  // Busca o valor unitário de um produto especifico que está no carrinho
  double getSellPriceProductCartShopping(int index) {
    return _pdvController.cartShopping[index].produtoSelected.preco_venda ??
        0.0;
  }

  int getIdProductCartShopping(int index) {
    return _pdvController.cartShopping[index].produtoSelected.id_produto;
  }

  // Busca a descricão de um produto especifico que está no carrinho
  String getDescriptionProductCartShopping(int index) {
    return _pdvController.cartShopping[index].produtoSelected.descricao ?? '';
  }

  // Busca a descricão de um complemento especifico que está no carrinho
  String getDescriptionComplementCartShopping(int index, int indexComplement) {
    return _pdvController.cartShopping[index]
        .complementoSelected[indexComplement].complementos.descricao;
  }

  // Busca o valor unitário de um complemento especifico que está no carrinho
  double getPriceComplementCartShopping(int index, int indexComplement) {
    return _pdvController.cartShopping[index]
        .complementoSelected[indexComplement].complementos.valor;
  }

  // Busca a quantidade de um complemento especifico que está no carrinho
  int getQuantityComplementCartShopping(int index, int indexComplement) {
    return _pdvController
        .cartShopping[index].complementoSelected[indexComplement].quantity;
  }

  // Busca o valor total de um complemento especifico que está no carrinho
  double getSpecificTotalValueComplementCartShopping(
      int index, int indexComplement) {
    return _pdvController.cartShopping[index]
            .complementoSelected[indexComplement].complementos.valor *
        _pdvController
            .cartShopping[index].complementoSelected[indexComplement].quantity;
  }

  // Busca o valor total dos complementos de um produto especifico que está no carrinho
  double getTotalValueComplementOnSpecificProductCartShopping(int index) {
    return double.parse(_pdvController.cartShopping[index].complementoSelected
        .fold(
            0.0,
            (previousValue, element) =>
                previousValue + element.complementos.valor * element.quantity)
        .toStringAsFixed(2));
  }

  // Busca o valor total dos produtos que estão no carrinho
  double getTotalValueProductCartShopping() {
    double newValue = ((_pdvController.cartShopping.fold(
        0.0,
        (previousValue, element) =>
            previousValue +
            (element.produtoSelected.preco_venda! * element.quantidade))));

    return FormatNumbers.truncateToDouble(newValue);
  }

  // Busca o valor total de todos os complementos que estão no carrinho
  double getTotalValueAllComplementsCartShopping() {
    double value = ((_pdvController.cartShopping.fold(
        0.0,
        (previousValue, element) =>
            previousValue +
            element.complementoSelected.fold(
                0.0,
                (previousValue, element) =>
                    previousValue +
                    element.complementos.valor * element.quantity))));

    return FormatNumbers.truncateToDouble(value);
  }

  // Busca o valor total do carrinho
  double getTotalValueCartShopping() {
    return FormatNumbers.truncateToDouble(getTotalValueProductCartShopping() +
        getTotalValueAllComplementsCartShopping());
  }

  String getInformationDescriptionComplementCartShopping(int index) {
    return _pdvController.cartShopping[index].informationComplement;
  }

  int getQuantityOrdersInOrderTicketsList() {
    return _pdvController.orderTicketsList.length;
  }

  RxInt getReactiveQuantityOrdersInOrderTicketsList() {
    _pdvController.orderTicketsList.refresh();
    _pdvController.update();
    return _pdvController.orderTicketsList.length.obs;
  }

  int getQuantityCartShopping() {
    return _pdvController.cartShopping.length;
  }

  RxList<complemento> getAllComplements() {
    return _pdvController.allComplementos;
  }

  RxDouble getTotalValuePerTable(ComandaSelecionada orderTicket) {
    RxDouble totalValue = 0.0.obs;
    for (int i = 0; i < orderTicket.listItemsCartShopping.length; i++) {
      ItemCartShopping itemCartShopping = orderTicket.listItemsCartShopping[i];

      if (itemCartShopping.complementoSelected.isNotEmpty) {
        for (int j = 0; j < itemCartShopping.complementoSelected.length; j++) {
          totalValue.value +=
              itemCartShopping.complementoSelected[j].complementos.valor *
                  itemCartShopping.complementoSelected[j].quantity;
        }
      }
      totalValue.value += itemCartShopping.produtoSelected.preco_venda! *
          itemCartShopping.quantidade;
    }

    return FormatNumbers.truncateToDouble(totalValue.value).obs;
  }

  RxDouble getTotalValueOrder() {
    RxDouble totalValue = 0.0.obs;

    for (int i = 0; i < _pdvController.orderTicketsList.length; i++) {
      ComandaSelecionada orderTicket = _pdvController.orderTicketsList[i];
      for (int j = 0; j < orderTicket.listItemsCartShopping.length; j++) {
        ItemCartShopping itemCartShopping =
            orderTicket.listItemsCartShopping[j];

        if (itemCartShopping.complementoSelected.isNotEmpty) {
          for (int k = 0;
              k < itemCartShopping.complementoSelected.length;
              k++) {
            totalValue.value +=
                itemCartShopping.complementoSelected[k].complementos.valor *
                    itemCartShopping.complementoSelected[k].quantity;
          }
        }
        totalValue.value += itemCartShopping.produtoSelected.preco_venda! *
            itemCartShopping.quantidade;
      }
    }

    return FormatNumbers.truncateToDouble(totalValue.value).obs;
  }

  int getIdProductFromOrderTicketsList(
      int indexOrderTickets, int indexListItemsCartShopping) {
    return _pdvController
        .orderTicketsList[indexOrderTickets]
        .listItemsCartShopping[indexListItemsCartShopping]
        .produtoSelected
        .id_produto;
  }

  String getAllComplementsDescription(
      int indexOrderTickets, int indexItensCartShopping) {
    String complements = '';
    final orderTicket = _pdvController.orderTicketsList[indexOrderTickets]
        .listItemsCartShopping[indexItensCartShopping];

    if (!_pdvBool.isListItemCartShoppingEmpty(orderTicket)) {
      for (int i = 0; i < orderTicket.complementoSelected.length; i++) {
        complements += orderTicket.complementoSelected[i].quantity.toString();
        complements +=
            ' - ${orderTicket.complementoSelected[i].complementos.descricao}\n';
      }
    }

    if (orderTicket.informationComplement.isNotEmpty &&
        orderTicket.informationComplement != '') {
      complements += orderTicket.informationComplement;
    }

    return complements;
  }

  double getValueSold(int indexOrderTickets, int index) {
    double vlr_vendido = 0.0;
    final orderTicket = _pdvController.orderTicketsList[indexOrderTickets];

    ItemCartShopping itemCartShopping =
        orderTicket.listItemsCartShopping[index];

    if (itemCartShopping.complementoSelected.isNotEmpty) {
      for (var j = 0; j < itemCartShopping.complementoSelected.length; j++) {
        vlr_vendido +=
            itemCartShopping.complementoSelected[j].complementos.valor *
                itemCartShopping.complementoSelected[j].quantity;
      }
    }

    vlr_vendido += itemCartShopping.produtoSelected.preco_venda! *
        itemCartShopping.quantidade;

    return FormatNumbers.truncateToDouble(vlr_vendido);
  }

  double getQuantityItemFromOrderTicket(int indexOrderTickets, int index) {
    final orderTicket = _pdvController.orderTicketsList[indexOrderTickets];

    return orderTicket.listItemsCartShopping[index].quantidade;
  }
}
