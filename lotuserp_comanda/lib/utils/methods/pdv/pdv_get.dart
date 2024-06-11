import 'package:lotuserp_comanda/model/collection/image_path_group.dart';
import 'package:lotuserp_comanda/model/collection/image_path_product.dart';
import 'package:lotuserp_comanda/model/collection/produto.dart';
import 'package:lotuserp_comanda/model/collection/produto_grupo.dart';
import 'package:lotuserp_comanda/model/item_cart_shopping.dart';
import 'package:lotuserp_comanda/shared/repositories/isar_db/generic_repository_multiple.dart';
import 'package:lotuserp_comanda/shared/repositories/isar_db/isar_service.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';

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
