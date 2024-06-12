import 'package:get/get.dart';
import 'package:lotuserp_comanda/model/collection/complemento.dart';
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

import '../../../model/complement_cart_shopping.dart';
import '../../../model/complemento_model.dart';

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

  void updateFilteredProdutos(int index, produto_grupo grupo) {
    updateIdGroupSelected(index);
    List<produto> filteredProducts = _pdvGet.filterProductByGroup(grupo);
    _pdvController.filteredProducts.assignAll(filteredProducts);
    _pdvController.update();
  }

  void updateProductByGroupInit(int index) {
    List<produto> filteredProducts =
        _pdvGet.filterProductByGroup(_pdvController.allGroups[index]);
    _pdvController.filteredProducts.assignAll(filteredProducts);
    _pdvController.update();
  }

  //Atualiza a lista de grupos
  void updateGrupos(List<produto_grupo> list) {
    _pdvController.allGroups.assignAll(list);
  }

  Future<void> loadVariablesPdv() async {
    await loadProdutos();
    await loadGrupo();
    updateFilteredProdutos(0, _pdvController.allGroups[0]);
    await loadComplementos();
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

  Future<void> loadComplementos() async {
    final isar = await _isarService.db;
    List<complemento> list =
        await _genericRepositoryMultiple.getAll(isar.complementos);

    _pdvController.allComplementos.assignAll(list);
  }

  // Adiciona produtos no carrinho de compras
  void addCartShoppingProduct(produto produtoSelected, {double weight = 0}) {
    if (produtoSelected.produto_pesagem == 1) {
      _pdvController.cartShopping.add(
        ItemCartShopping(
            produtoSelected: produtoSelected,
            quantidade: weight,
            complementoSelected: [],
            informationComplement: ''),
      );

      _pdvController.update();
      _pdvController.cartShopping.refresh();
      return;
    }

    ItemCartShopping? produtoExists = _hasEqualsProduct(produtoSelected);

    if (produtoExists == null) {
      _pdvController.cartShopping.add(
        ItemCartShopping(
            produtoSelected: produtoSelected,
            quantidade: 1,
            complementoSelected: [],
            informationComplement: ''),
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
      String fileImagem, String nome, String pathImage) {
    return image_path_group(
      file_imagem: fileImagem,
      nome: nome,
      path_image: pathImage,
    );
  }

  image_path_product createModelProduct(
      String fileImagem, String nome, String pathImage) {
    return image_path_product(
      file_imagem: fileImagem,
      nome: nome,
      path_image: pathImage,
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

  void setComplementosFiltered(produto produtoSelected) {
    List<complemento> complementos = [];
    for (var item in _pdvController.allComplementos) {
      if (item.id_produto == produtoSelected.id_produto) {
        complementos.add(item);
      }
    }

    _pdvController.filteredComplementos.assignAll(complementos);
  }

  void addComplementToListSelected(complemento complemento) {
    ComplementCartShopping? complement =
        _pdvGet.hasEqualsComplement(complemento);

    if (complement == null) {
      ComplementCartShopping complementoModel = ComplementCartShopping(
          complementos: ComplementoModel.fromMap(complemento.toMap()),
          quantity: 1);

      _pdvController.listComplementSelected.add(complementoModel);
    }

    complement!.quantity++;
  }

  void addProductWithComplementToCartShopping(produto produtoSelected) {
    ItemCartShopping itemCartShopping = ItemCartShopping(
      produtoSelected: produtoSelected,
      quantidade: 1,
      complementoSelected: _pdvController.listComplementSelected,
      informationComplement: _pdvController.complementoController.text,
    );

    _pdvController.cartShopping.add(itemCartShopping);

    _pdvController.update();
  }

  void setComplements(List<complemento> complementos) async {
    _pdvController.allComplementos.assignAll(complementos);
    _pdvController.update();
  }

  void setGroupSelected(int number) {
    _pdvController.groupSelected.value = number;
    _pdvController.update();
  }

  void updateFilteredProductsByDesc() {
    _pdvController.filteredProducts.assignAll(_pdvGet.filterProductByDesc());
    _pdvController.update();
  }

  void removeComplementSelected(complemento complementoSelected) {
    ComplementCartShopping? complement = _pdvController.listComplementSelected
        .where((element) =>
            element.complementos.id_complemento ==
            complementoSelected.id_complemento)
        .firstOrNull;

    if (complement == null) return;

    if (complement.quantity > 1) {
      complement.quantity--;
      return;
    }

    _pdvController.listComplementSelected.remove(complement);
  }

  void clearAllComplementSelected() {
    _pdvController.listComplementSelected.value = [];
    _pdvController.update();
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
  void deleteItemCartShopping(produto produtoSelected) {
    ItemCartShopping? itemCartShopping = _hasEqualsProduct(produtoSelected);

    if (itemCartShopping == null) return;

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
