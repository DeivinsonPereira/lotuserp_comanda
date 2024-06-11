import 'package:get/get.dart';
import 'package:lotuserp_comanda/model/collection/image_path_group.dart';
import 'package:lotuserp_comanda/model/collection/image_path_product.dart';
import 'package:lotuserp_comanda/model/collection/produto.dart';
import 'package:lotuserp_comanda/model/collection/produto_grupo.dart';
import 'package:lotuserp_comanda/model/item_cart_shopping.dart';
import 'package:lotuserp_comanda/shared/components/endpoints.dart';
import 'package:lotuserp_comanda/shared/repositories/http/download/donwload_images.dart';
import 'package:lotuserp_comanda/shared/repositories/isar_db/generic_repository_multiple.dart';
import 'package:lotuserp_comanda/shared/repositories/isar_db/generic_save_image.dart';
import 'package:lotuserp_comanda/shared/repositories/isar_db/isar_service.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/pdv_get.dart';

class PdvFeatures {
  final _pdvController = Dependencies.pdvController();
  final _pdvGet = PdvGet.instance;
  final _genericRepositoryMultiple = GenericRepositoryMultiple.instance;
  final _isarService = IsarService.instance;

  PdvFeatures._privateCosntructor();

  static final PdvFeatures _instance = PdvFeatures._privateCosntructor();

  static PdvFeatures get instance => _instance;

  // Atualiza a lista de produtos
  void updateProdutos(List<produto> list) {
    _pdvController.allProducts.assignAll(list);
  }

  void updateIdGroupSelected(int id) {
    _pdvController.groupSelected.value = id;
    _pdvController.update();
  }

  void updateProductByGroup(int index, produto_grupo grupo) {
    updateIdGroupSelected(index);
    List<produto> filteredProducts = _pdvGet.filterProductByGroup(grupo);
    _pdvController.productsByGroup.assignAll(filteredProducts);
    _pdvController.update();
  }

  void updateProductByGroupInit(int index) {
    List<produto> filteredProducts =
        _pdvGet.filterProductByGroup(_pdvController.allGroups[index]);
    _pdvController.productsByGroup.assignAll(filteredProducts);
    _pdvController.update();
  }

  //Atualiza a lista de grupos
  void updateGrupos(List<produto_grupo> list) {
    _pdvController.allGroups.assignAll(list);
  }

  Future<void> loadVariablesPdv() async {
    await loadProdutos();
    await loadGrupo();
    await updateImagePathGroup();
    await updateImagePathProduto();
  }

  // Carrega todos os produtos
  Future<void> loadProdutos() async {
    final isar = await _isarService.db;
    List<produto> list = await _genericRepositoryMultiple.getAll(isar.produtos);

    _pdvController.allProducts.assignAll(list);
  }

  // Carrega todos os grupos
  Future<void> loadGrupo() async {
    final isar = await _isarService.db;
    List<produto_grupo> list =
        await _genericRepositoryMultiple.getAll(isar.produto_grupos);

    _pdvController.allGroups.assignAll(list);
  }

  // Adiciona produtos no carrinho de compras
  void addCartShopping(produto produtoSelected) {
    ItemCartShopping? produtoExists = _hasEqualsProduct(produtoSelected);

    if (produtoExists == null) {
      _pdvController.cartShopping.add(
        ItemCartShopping(produtoSelected: produtoSelected, quantidade: 1),
      );

      _pdvController.update();
      _pdvController.cartShopping.refresh();
      return;
    }

    produtoExists.quantidade++;
    _pdvController.update();
    _pdvController.cartShopping.refresh();
  }

  image_path_group createModelGroup(
      String file_imagem, String nome, String path_image) {
    return image_path_group(
      file_imagem: file_imagem,
      nome: nome,
      path_image: path_image,
    );
  }

  image_path_product createModelProduct(
      String file_imagem, String nome, String path_image) {
    return image_path_product(
      file_imagem: file_imagem,
      nome: nome,
      path_image: path_image,
    );
  }

  Future<void> updateImagePathGroup() async {
    List<image_path_group> list = await _pdvGet.getImagemGrupos();
    _pdvController.imagePathGroup.assignAll(list);
  }

  Future<void> updateImagePathProduto() async {
    List<image_path_product> list = await _pdvGet.getImagemProdutos();
    _pdvController.imagePathProduct.assignAll(list);
  }

  Future<void> downloadImageGrupos() async {
    final isar = await _isarService.db;
    await DownloadImages().downloadGeneric(
        Endpoints().endpointSearchImageGrupos,
        _pdvController.allGroups,
        '/assets/grupos/');

    await GenericSaveImage().saveImagem<produto_grupo, image_path_group>(
        isar.image_path_groups,
        _pdvController.allGroups,
        '/assets/grupos/',
        createModelGroup,
        ((item) => item.file_imagem!),
        (item) => item.grupo_descricao!);
  }

  Future<void> downloadImageProdutos() async {
    final isar = await _isarService.db;
    await DownloadImages().downloadGeneric(
        Endpoints().endpointSearchImageProducts,
        _pdvController.allProducts,
        '/assets/produtos/');

    await GenericSaveImage().saveImagem<produto, image_path_product>(
        isar.image_path_products,
        _pdvController.allProducts,
        '/assets/produtos/',
        createModelProduct,
        ((item) => item.file_imagem!),
        (item) => item.descricao!);
  }

  // Remove produtos do carrinho de compras
  void removeCartShopping(produto produtoSelected) {
    ItemCartShopping? produtoExists = _hasEqualsProduct(produtoSelected);
    if (produtoExists == null) return;

    if (produtoExists.quantidade > 1) {
      produtoExists.quantidade--;
    } else {
      produtoExists.quantidade = 0;
      _pdvController.cartShopping.remove(produtoExists);
    }
    _pdvController.update();
    _pdvController.cartShopping.refresh();
  }

  // Deleta um produto do carrinho de compras
  void deleteItemCartShopping(ItemCartShopping itemCartShopping) {
    _pdvController.cartShopping.remove(itemCartShopping);
    _pdvController.update();
  }

  // Remove todos os produtos do carrinho de compras
  void removeAllCartShopping() {
    _pdvController.cartShopping.clear();
    _pdvController.update();
  }

  // Verifica se o item do carrinho de compras ja existe
  ItemCartShopping? _hasEqualsProduct(produto produtoSelected) {
    return _pdvController.cartShopping
        .where((element) =>
            element.produtoSelected.id_produto == produtoSelected.id_produto)
        .firstOrNull;
  }
}
