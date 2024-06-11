// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, camel_case_types
import 'dart:convert';

import 'package:isar/isar.dart';

part 'usuario.g.dart';

@Collection()
class usuario {
  Id id_usuario;
  int? id_partner_cliente;
  String? data_cadastro;
  String? login;
  String? senha;
  String? email;
  int? status;
  int? perfil;

  usuario({
    required this.id_usuario,
    this.id_partner_cliente,
    this.data_cadastro,
    this.login,
    this.senha,
    this.email,
    this.status,
    this.perfil,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_usuario': id_usuario,
      'id_partner_cliente': id_partner_cliente,
      'data_cadastro': data_cadastro,
      'login': login,
      'senha': senha,
      'email': email,
      'status': status,
      'perfil': perfil,
    };
  }

  factory usuario.fromMap(Map<String, dynamic> map) {
    return usuario(
      id_usuario: map['id_usuario'] as int,
      id_partner_cliente: map['id_partner_cliente'] != null
          ? map['id_partner_cliente'] as int
          : null,
      data_cadastro:
          map['data_cadastro'] != null ? map['data_cadastro'] as String : null,
      login: map['login'] != null ? map['login'] as String : null,
      senha: map['senha'] != null ? map['senha'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      status: map['status'] != null ? map['status'] as int : null,
      perfil: map['perfil'] != null ? map['perfil'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory usuario.fromJson(String source) =>
      usuario.fromMap(json.decode(source) as Map<String, dynamic>);
}
