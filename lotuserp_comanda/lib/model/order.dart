// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:lotuserp_comanda/model/order_item.dart';

class Order {
  int id_partner_cliente;
  int id_comanda;
  int id_usuario;
  String identificador;
  List<OrderItem> itens;
  
  Order({
    required this.id_partner_cliente,
    required this.id_comanda,
    required this.id_usuario,
    required this.identificador,
    required this.itens,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_partner_cliente': id_partner_cliente,
      'id_comanda': id_comanda,
      'id_usuario': id_usuario,
      'identificador': identificador,
      'itens': itens.map((x) => x.toMap()).toList(),
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id_partner_cliente: map['id_partner_cliente'] as int,
      id_comanda: map['id_comanda'] as int,
      id_usuario: map['id_usuario'] as int,
      identificador: map['identificador'] as String,
      itens: List<OrderItem>.from((map['itens'] as List<int>).map<OrderItem>((x) => OrderItem.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source) as Map<String, dynamic>);
}
