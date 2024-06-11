// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetusuarioCollection on Isar {
  IsarCollection<usuario> get usuarios => this.collection();
}

const UsuarioSchema = CollectionSchema(
  name: r'usuario',
  id: 5509211092415108114,
  properties: {
    r'data_cadastro': PropertySchema(
      id: 0,
      name: r'data_cadastro',
      type: IsarType.string,
    ),
    r'email': PropertySchema(
      id: 1,
      name: r'email',
      type: IsarType.string,
    ),
    r'id_partner_cliente': PropertySchema(
      id: 2,
      name: r'id_partner_cliente',
      type: IsarType.long,
    ),
    r'login': PropertySchema(
      id: 3,
      name: r'login',
      type: IsarType.string,
    ),
    r'perfil': PropertySchema(
      id: 4,
      name: r'perfil',
      type: IsarType.long,
    ),
    r'senha': PropertySchema(
      id: 5,
      name: r'senha',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 6,
      name: r'status',
      type: IsarType.long,
    )
  },
  estimateSize: _usuarioEstimateSize,
  serialize: _usuarioSerialize,
  deserialize: _usuarioDeserialize,
  deserializeProp: _usuarioDeserializeProp,
  idName: r'id_usuario',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _usuarioGetId,
  getLinks: _usuarioGetLinks,
  attach: _usuarioAttach,
  version: '3.1.0+1',
);

int _usuarioEstimateSize(
  usuario object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.data_cadastro;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.login;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.senha;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _usuarioSerialize(
  usuario object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.data_cadastro);
  writer.writeString(offsets[1], object.email);
  writer.writeLong(offsets[2], object.id_partner_cliente);
  writer.writeString(offsets[3], object.login);
  writer.writeLong(offsets[4], object.perfil);
  writer.writeString(offsets[5], object.senha);
  writer.writeLong(offsets[6], object.status);
}

usuario _usuarioDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = usuario(
    data_cadastro: reader.readStringOrNull(offsets[0]),
    email: reader.readStringOrNull(offsets[1]),
    id_partner_cliente: reader.readLongOrNull(offsets[2]),
    id_usuario: id,
    login: reader.readStringOrNull(offsets[3]),
    perfil: reader.readLongOrNull(offsets[4]),
    senha: reader.readStringOrNull(offsets[5]),
    status: reader.readLongOrNull(offsets[6]),
  );
  return object;
}

P _usuarioDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _usuarioGetId(usuario object) {
  return object.id_usuario;
}

List<IsarLinkBase<dynamic>> _usuarioGetLinks(usuario object) {
  return [];
}

void _usuarioAttach(IsarCollection<dynamic> col, Id id, usuario object) {
  object.id_usuario = id;
}

extension usuarioQueryWhereSort on QueryBuilder<usuario, usuario, QWhere> {
  QueryBuilder<usuario, usuario, QAfterWhere> anyId_usuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension usuarioQueryWhere on QueryBuilder<usuario, usuario, QWhereClause> {
  QueryBuilder<usuario, usuario, QAfterWhereClause> id_usuarioEqualTo(
      Id id_usuario) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id_usuario,
        upper: id_usuario,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterWhereClause> id_usuarioNotEqualTo(
      Id id_usuario) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id_usuario, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id_usuario, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id_usuario, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id_usuario, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<usuario, usuario, QAfterWhereClause> id_usuarioGreaterThan(
      Id id_usuario,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id_usuario, includeLower: include),
      );
    });
  }

  QueryBuilder<usuario, usuario, QAfterWhereClause> id_usuarioLessThan(
      Id id_usuario,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id_usuario, includeUpper: include),
      );
    });
  }

  QueryBuilder<usuario, usuario, QAfterWhereClause> id_usuarioBetween(
    Id lowerId_usuario,
    Id upperId_usuario, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId_usuario,
        includeLower: includeLower,
        upper: upperId_usuario,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension usuarioQueryFilter
    on QueryBuilder<usuario, usuario, QFilterCondition> {
  QueryBuilder<usuario, usuario, QAfterFilterCondition> data_cadastroIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'data_cadastro',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      data_cadastroIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'data_cadastro',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> data_cadastroEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'data_cadastro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      data_cadastroGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'data_cadastro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> data_cadastroLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'data_cadastro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> data_cadastroBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'data_cadastro',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> data_cadastroStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'data_cadastro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> data_cadastroEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'data_cadastro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> data_cadastroContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'data_cadastro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> data_cadastroMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'data_cadastro',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> data_cadastroIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'data_cadastro',
        value: '',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      data_cadastroIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'data_cadastro',
        value: '',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> emailContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> emailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      id_partner_clienteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id_partner_cliente',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      id_partner_clienteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id_partner_cliente',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      id_partner_clienteEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_partner_cliente',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      id_partner_clienteGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_partner_cliente',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      id_partner_clienteLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_partner_cliente',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition>
      id_partner_clienteBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_partner_cliente',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> id_usuarioEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_usuario',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> id_usuarioGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_usuario',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> id_usuarioLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_usuario',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> id_usuarioBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_usuario',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> loginIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'login',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> loginIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'login',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> loginEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'login',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> loginGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'login',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> loginLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'login',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> loginBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'login',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> loginStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'login',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> loginEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'login',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> loginContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'login',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> loginMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'login',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> loginIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'login',
        value: '',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> loginIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'login',
        value: '',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> perfilIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'perfil',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> perfilIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'perfil',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> perfilEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'perfil',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> perfilGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'perfil',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> perfilLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'perfil',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> perfilBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'perfil',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> senhaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'senha',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> senhaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'senha',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> senhaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> senhaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'senha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> senhaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'senha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> senhaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'senha',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> senhaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'senha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> senhaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'senha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> senhaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'senha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> senhaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'senha',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> senhaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senha',
        value: '',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> senhaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'senha',
        value: '',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> statusEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> statusGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> statusLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario, usuario, QAfterFilterCondition> statusBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension usuarioQueryObject
    on QueryBuilder<usuario, usuario, QFilterCondition> {}

extension usuarioQueryLinks
    on QueryBuilder<usuario, usuario, QFilterCondition> {}

extension usuarioQuerySortBy on QueryBuilder<usuario, usuario, QSortBy> {
  QueryBuilder<usuario, usuario, QAfterSortBy> sortByData_cadastro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data_cadastro', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByData_cadastroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data_cadastro', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortById_partner_cliente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_partner_cliente', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortById_partner_clienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_partner_cliente', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByLogin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByLoginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByPerfil() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perfil', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByPerfilDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perfil', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortBySenha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senha', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortBySenhaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senha', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension usuarioQuerySortThenBy
    on QueryBuilder<usuario, usuario, QSortThenBy> {
  QueryBuilder<usuario, usuario, QAfterSortBy> thenByData_cadastro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data_cadastro', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByData_cadastroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data_cadastro', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenById_partner_cliente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_partner_cliente', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenById_partner_clienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_partner_cliente', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenById_usuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_usuario', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenById_usuarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_usuario', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByLogin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByLoginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByPerfil() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perfil', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByPerfilDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perfil', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenBySenha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senha', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenBySenhaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senha', Sort.desc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<usuario, usuario, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension usuarioQueryWhereDistinct
    on QueryBuilder<usuario, usuario, QDistinct> {
  QueryBuilder<usuario, usuario, QDistinct> distinctByData_cadastro(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'data_cadastro',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<usuario, usuario, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<usuario, usuario, QDistinct> distinctById_partner_cliente() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_partner_cliente');
    });
  }

  QueryBuilder<usuario, usuario, QDistinct> distinctByLogin(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'login', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<usuario, usuario, QDistinct> distinctByPerfil() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'perfil');
    });
  }

  QueryBuilder<usuario, usuario, QDistinct> distinctBySenha(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'senha', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<usuario, usuario, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }
}

extension usuarioQueryProperty
    on QueryBuilder<usuario, usuario, QQueryProperty> {
  QueryBuilder<usuario, int, QQueryOperations> id_usuarioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_usuario');
    });
  }

  QueryBuilder<usuario, String?, QQueryOperations> data_cadastroProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'data_cadastro');
    });
  }

  QueryBuilder<usuario, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<usuario, int?, QQueryOperations> id_partner_clienteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_partner_cliente');
    });
  }

  QueryBuilder<usuario, String?, QQueryOperations> loginProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'login');
    });
  }

  QueryBuilder<usuario, int?, QQueryOperations> perfilProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'perfil');
    });
  }

  QueryBuilder<usuario, String?, QQueryOperations> senhaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'senha');
    });
  }

  QueryBuilder<usuario, int?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
