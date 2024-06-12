import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/model/collection/produto.dart';

class SearchProductPdvController extends GetxController {
  TextEditingController searchController = TextEditingController();

  var search = ''.obs;

  RxList<produto> produtoSelected = <produto>[].obs;
  var quantity = [].obs;

  var listaGrupos = ['TODOS'];

  bool isSearch = false;
  bool isBarCode = false;

  dynamic filteredProducts;

}
