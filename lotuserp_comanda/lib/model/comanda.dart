// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:convert';

class comanda {
  int? id_partner_cliente;
  int? id_comanda;
  int? id_usuario;
  String? identificador;
  int? enviado;

  comanda({
    this.id_partner_cliente,
    this.id_comanda,
    this.id_usuario,
    this.identificador,
    this.enviado,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_partner_cliente': id_partner_cliente,
      'id_comanda': id_comanda,
      'id_usuario': id_usuario,
      'identificador': identificador,
      'enviado': enviado
    };
  }

  factory comanda.fromMap(Map<String, dynamic> map) {
    return comanda(
      id_partner_cliente: map['id_partner_cliente'] != null
          ? map['id_partner_cliente'] as int
          : null,
      id_comanda: map['id_comanda'] != null ? map['id_comanda'] as int : null,
      id_usuario: map['id_usuario'] != null ? map['id_usuario'] as int : null,
      identificador:
          map['identificador'] != null ? map['identificador'] as String : null,
      enviado: map['enviado'] != null ? map['enviado'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory comanda.fromJson(String source) =>
      comanda.fromMap(json.decode(source) as Map<String, dynamic>);
}
