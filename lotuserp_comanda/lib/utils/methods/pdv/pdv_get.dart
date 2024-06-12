import 'package:lotuserp_comanda/model/collection/image_path_group.dart';
import 'package:lotuserp_comanda/model/collection/image_path_product.dart';
import 'package:lotuserp_comanda/model/collection/produto.dart';
import 'package:lotuserp_comanda/model/collection/produto_grupo.dart';
import 'package:lotuserp_comanda/model/complement_cart_shopping.dart';
import 'package:lotuserp_comanda/model/item_cart_shopping.dart';
import 'package:lotuserp_comanda/shared/repositories/isar_db/generic_repository_multiple.dart';
import 'package:lotuserp_comanda/shared/repositories/isar_db/isar_service.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';

import '../../../model/collection/complemento.dart';

class PdvGet {
  final _genericRepositoryMultiple = GenericRepositoryMultiple.instance;
  final _pdvController = Dependencies.pdvController();
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

  double getTotalItem(ItemCartShopping itemCartShopping) {
    return itemCartShopping.quantidade *
        itemCartShopping.produtoSelected.preco_venda!;
  }

  double getTotalCart() {
    return _pdvController.cartShopping.fold(
        0.0,
        (previousValue, element) =>
            previousValue +
            (element.produtoSelected.preco_venda! * element.quantidade));
  }

  bool isCartShoppingEmpty() {
    return _pdvController.cartShopping.isEmpty;
  }

  bool isProductWithComplement(produto produtoSelected) {
    complemento? complement = _pdvController.allComplementos.where((element) => element.id_produto == produtoSelected.id_produto).firstOrNull;
    return complement != null;
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
}
