import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/model/collection/complemento.dart';
import 'package:lotuserp_comanda/model/collection/image_path_product.dart';
import 'package:lotuserp_comanda/model/collection/produto.dart';
import 'package:lotuserp_comanda/model/collection/produto_grupo.dart';
import 'package:lotuserp_comanda/model/comanda_selecionada.dart';
import 'package:lotuserp_comanda/model/complement_cart_shopping.dart';
import 'package:lotuserp_comanda/model/item_cart_shopping.dart';

import '../model/collection/image_path_group.dart';

class PdvController extends GetxController {
  TextEditingController searchProductController = TextEditingController();
  TextEditingController pesagemController = TextEditingController();
  TextEditingController complementoController = TextEditingController();

  RxList<produto> allProducts = <produto>[].obs;
  RxList<produto_grupo> allGroups = <produto_grupo>[].obs;
  RxList<complemento> allComplementos = <complemento>[].obs;
  RxList<ItemCartShopping> cartShopping = <ItemCartShopping>[].obs;
  RxList<ComplementCartShopping> listComplementSelected = <ComplementCartShopping>[].obs;
  RxList<ComandaSelecionada> orderTicketsList = <ComandaSelecionada>[].obs;

  RxInt groupSelected = 0.obs;

  RxList<image_path_group> imagePathGroup = <image_path_group>[].obs;
  RxList<image_path_product> imagePathProduct = <image_path_product>[].obs;

  RxList<produto> filteredProducts = <produto>[].obs;
  RxList<complemento> filteredComplementos = <complemento>[].obs;

  RxList<image_path_product> filteredImageProduct = <image_path_product>[].obs;
  RxList<image_path_group> filteredImageGroup = <image_path_group>[].obs;
}
