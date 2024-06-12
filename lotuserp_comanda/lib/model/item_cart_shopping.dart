// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lotuserp_comanda/model/collection/produto.dart';
import 'package:lotuserp_comanda/model/complement_cart_shopping.dart';

class ItemCartShopping {
  produto produtoSelected;
  double quantidade;
  List<ComplementCartShopping> complementoSelected;
  String informationComplement;

  ItemCartShopping({
    required this.produtoSelected,
    required this.quantidade,
    required this.complementoSelected,
    required this.informationComplement,
  });
}
