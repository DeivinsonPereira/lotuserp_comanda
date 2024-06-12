// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lotuserp_comanda/model/collection/produto.dart';

class AddProductArgs {
  produto produtoSelected;
  bool? isBalance;
  String? quantity;
  bool? isReadLabel;
  double? quantityOrWheight;
  double? value;

  AddProductArgs({
    required this.produtoSelected,
    this.isBalance = false,
    this.quantity = '',
    this.isReadLabel = false,
    this.quantityOrWheight = 0.0,
    this.value = 0.0,

  });
}
