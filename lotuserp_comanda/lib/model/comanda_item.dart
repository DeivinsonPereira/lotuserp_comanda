// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, non_constant_identifier_names
import 'dart:convert';


class comanda_item {
  int id_comanda;
  int id_produto;
  String complemento;
  double vlr_vendido;
  double qtde;

  comanda_item({
    required this.id_comanda,
    required this.id_produto,
    required this.complemento,
    required this.vlr_vendido,
    required this.qtde,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_comanda': id_comanda,
      'id_produto': id_produto,
      'complemento': complemento,
      'vlr_vendido': vlr_vendido,
      'qtde': qtde,
    };
  }

  factory comanda_item.fromMap(Map<String, dynamic> map) {
    return comanda_item(
      id_comanda: map['id_comanda'] as int,
      id_produto: map['id_produto'] as int,
      complemento: map['complemento'] as String,
      vlr_vendido: map['vlr_vendido'] is int
          ? (map['vlr_vendido'] as int).toDouble()
          : map['vlr_vendido'] as double,
      qtde: map['qtde'] is int
          ? (map['qtde'] as int).toDouble()
          : map['qtde'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory comanda_item.fromJson(String source) =>
      comanda_item.fromMap(json.decode(source) as Map<String, dynamic>);
}
