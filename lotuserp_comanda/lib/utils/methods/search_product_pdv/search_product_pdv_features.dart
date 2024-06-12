import 'package:lotuserp_comanda/utils/dependencies.dart';

import '../../../model/collection/produto.dart';

class SearchProductPdvFeatures {
  final _searchProductPdvController = Dependencies.searchProductPdvController();

  SearchProductPdvFeatures._privateConstructor();

  static final SearchProductPdvFeatures _instance =
      SearchProductPdvFeatures._privateConstructor();

  static SearchProductPdvFeatures get instance => _instance;

  //atualizar isBarCode
  void updateIsBarCode() {
    _searchProductPdvController.isBarCode = !_searchProductPdvController.isBarCode;
    _searchProductPdvController.update();
  }

  //atualizar isSearch
  void updateIsSearch(bool decision) {
    _searchProductPdvController.isSearch = decision;
    _searchProductPdvController.update();
  }

  //atualizar file
  void updateProduto(produto produto) {
    _searchProductPdvController.produtoSelected.add(produto);
  }

  //atualizar campo de pesquisa
  void updateSearch() {
    _searchProductPdvController.search.value = _searchProductPdvController.searchController.text;
    _searchProductPdvController.update();
  }

  // ** limpar ***

  //limpar todos os campos
  void clearAll() {
    _searchProductPdvController.listaGrupos.clear();
  }

  void clearSearch() {
    _searchProductPdvController.searchController.clear();
    _searchProductPdvController.search.value = '';
    _searchProductPdvController.update();
  }
}
