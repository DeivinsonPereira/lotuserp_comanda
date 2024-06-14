// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:lotuserp_comanda/model/collection/mesa_listada.dart';
import 'package:lotuserp_comanda/model/item_cart_shopping.dart';

class ComandaSelecionada {
  mesa_listada comandaSelecionada;
  List<ItemCartShopping> listItemsCartShopping;
  
  ComandaSelecionada({
    required this.comandaSelecionada,
    required this.listItemsCartShopping,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'comandaSelecionada': comandaSelecionada.toMap(),
      'listItemsCartShopping': listItemsCartShopping.map((x) => x.toMap()).toList(),
    };
  }

  factory ComandaSelecionada.fromMap(Map<String, dynamic> map) {
    return ComandaSelecionada(
      comandaSelecionada: mesa_listada.fromMap(map['comandaSelecionada'] as Map<String,dynamic>),
      listItemsCartShopping: List<ItemCartShopping>.from((map['listItemsCartShopping'] as List<int>).map<ItemCartShopping>((x) => ItemCartShopping.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory ComandaSelecionada.fromJson(String source) => ComandaSelecionada.fromMap(json.decode(source) as Map<String, dynamic>);
}
