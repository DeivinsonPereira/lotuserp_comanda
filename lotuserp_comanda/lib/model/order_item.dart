import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderItem {
  int id_produto;
  String complemento;
  double vlr_vendido;
  double qtde;
  
  OrderItem({
    required this.id_produto,
    required this.complemento,
    required this.vlr_vendido,
    required this.qtde,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_produto': id_produto,
      'complemento': complemento,
      'vlr_vendido': vlr_vendido,
      'qtde': qtde,
    };
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      id_produto: map['id_produto'] as int,
      complemento: map['complemento'] as String,
      vlr_vendido: map['vlr_vendido'] is int? (map['vlr_vendido'] as int).toDouble() : map['vlr_vendido'] as double,
      qtde: map['qtde'] is int? (map['qtde'] as int).toDouble() : map['qtde'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderItem.fromJson(String source) => OrderItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
