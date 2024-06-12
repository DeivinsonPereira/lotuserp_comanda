import 'package:get/get.dart';
import 'package:lotuserp_comanda/model/collection/complemento.dart';
import 'package:lotuserp_comanda/model/collection/image_path_product.dart';
import 'package:lotuserp_comanda/model/collection/produto.dart';
import 'package:lotuserp_comanda/model/collection/produto_grupo.dart';
import 'package:lotuserp_comanda/model/item_cart_shopping.dart';

import '../model/collection/image_path_group.dart';

class PdvController extends GetxController {
  RxList<produto> allProducts = <produto>[].obs;
  RxList<produto_grupo> allGroups = <produto_grupo>[].obs;
  RxList<complemento> allComplementos = <complemento>[].obs;
  RxList<ItemCartShopping> cartShopping = <ItemCartShopping>[].obs;

  RxInt groupSelected = 0.obs;
  RxList<produto> productsByGroup = <produto>[].obs;

  RxList<image_path_group> imagePathGroup = <image_path_group>[].obs;
  RxList<image_path_product> imagePathProduct = <image_path_product>[].obs;
  
}
