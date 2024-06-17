import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MesaExtrato {
  int? id_partner_cliente;
  int? id_comanda;
  int? item;
  int? id_produto;
  String? produto_complemento;
  double? vlr_vendido;
  int? qtde;
  double? vlr_liquido;
  int? id_usuario;
  String? usuario_nome;
  String? item_descricao;
  String? item_complemento;
  
  MesaExtrato({
    this.id_partner_cliente,
    this.id_comanda,
    this.item,
    this.id_produto,
    this.produto_complemento,
    this.vlr_vendido,
    this.qtde,
    this.vlr_liquido,
    this.id_usuario,
    this.usuario_nome,
    this.item_descricao,
    this.item_complemento,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_partner_cliente': id_partner_cliente,
      'id_comanda': id_comanda,
      'item': item,
      'id_produto': id_produto,
      'produto_complemento': produto_complemento,
      'vlr_vendido': vlr_vendido,
      'qtde': qtde,
      'vlr_liquido': vlr_liquido,
      'id_usuario': id_usuario,
      'usuario_nome': usuario_nome,
      'item_descricao': item_descricao,
      'item_complemento': item_complemento,
    };
  }

  factory MesaExtrato.fromMap(Map<String, dynamic> map) {
    return MesaExtrato(
      id_partner_cliente: map['id_partner_cliente'] != null ? map['id_partner_cliente'] as int : null,
      id_comanda: map['id_comanda'] != null ? map['id_comanda'] as int : null,
      item: map['item'] != null ? map['item'] as int : null,
      id_produto: map['id_produto'] != null ? map['id_produto'] as int : null,
      produto_complemento: map['produto_complemento'] != null ? map['produto_complemento'] as String : null,
      vlr_vendido: map['vlr_vendido'] != null ? map['vlr_vendido'] is int? (map['vlr_vendido'] as int).toDouble() : map['vlr_vendido'] as double : null,
      qtde: map['qtde'] != null ? map['qtde'] as int : null,
      vlr_liquido: map['vlr_liquido'] != null ? map['vlr_liquido'] is int? (map['vlr_liquido'] as int).toDouble() : map['vlr_liquido'] as double : null,
      id_usuario: map['id_usuario'] != null ? map['id_usuario'] as int : null,
      usuario_nome: map['usuario_nome'] != null ? map['usuario_nome'] as String : null,
      item_descricao: map['item_descricao'] != null ? map['item_descricao'] as String : null,
      item_complemento: map['item_complemento'] != null ? map['item_complemento'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MesaExtrato.fromJson(String source) => MesaExtrato.fromMap(json.decode(source) as Map<String, dynamic>);
}  
