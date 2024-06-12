// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, non_constant_identifier_names
import 'dart:convert';

import "package:isar/isar.dart";

part 'usuario_logado.g.dart';

@Collection()
class usuario_logado {
  Id id = Isar.autoIncrement;
  int? id_partner_cliente;
  int? id_usuario;
  String? data_cadastro;
  String? login;
  String? senha;
  String? email;
  int? status;
  int? perfil;

  usuario_logado({
    this.id_partner_cliente,
    this.id_usuario,
    this.data_cadastro,
    this.login,
    this.senha,
    this.email,
    this.status,
    this.perfil,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_partner_cliente': id_partner_cliente,
      'id_usuario': id_usuario,
      'data_cadastro': data_cadastro,
      'login': login,
      'senha': senha,
      'email': email,
      'status': status,
      'perfil': perfil,
    };
  }

  factory usuario_logado.fromMap(Map<String, dynamic> map) {
    return usuario_logado(
      id_partner_cliente: map['id_partner_cliente'] != null
          ? map['id_partner_cliente'] as int
          : null,
      id_usuario: map['id_usuario'] != null ? map['id_usuario'] as int : null,
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

  factory usuario_logado.fromJson(String source) =>
      usuario_logado.fromMap(json.decode(source) as Map<String, dynamic>);
}
