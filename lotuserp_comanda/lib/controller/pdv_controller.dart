import 'package:get/get.dart';
import 'package:lotuserp_comanda/model/collection/image_path_product.dart';

import '../model/collection/image_path_group.dart';

class PdvController extends GetxController {

  RxList<image_path_group> imagePathGroup = <image_path_group>[].obs;
  RxList<image_path_product> imagePathProduct = <image_path_product>[].obs;
}