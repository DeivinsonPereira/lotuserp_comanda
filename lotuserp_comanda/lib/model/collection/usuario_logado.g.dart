// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_logado.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension Getusuario_logadoCollection on Isar {
  IsarCollection<usuario_logado> get usuario_logados => this.collection();
}

const Usuario_logadoSchema = CollectionSchema(
  name: r'usuario_logado',
  id: 356262191186710369,
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
    r'id_usuario': PropertySchema(
      id: 3,
      name: r'id_usuario',
      type: IsarType.long,
    ),
    r'login': PropertySchema(
      id: 4,
      name: r'login',
      type: IsarType.string,
    ),
    r'perfil': PropertySchema(
      id: 5,
      name: r'perfil',
      type: IsarType.long,
    ),
    r'senha': PropertySchema(
      id: 6,
      name: r'senha',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 7,
      name: r'status',
      type: IsarType.long,
    )
  },
  estimateSize: _usuario_logadoEstimateSize,
  serialize: _usuario_logadoSerialize,
  deserialize: _usuario_logadoDeserialize,
  deserializeProp: _usuario_logadoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _usuario_logadoGetId,
  getLinks: _usuario_logadoGetLinks,
  attach: _usuario_logadoAttach,
  version: '3.1.0+1',
);

int _usuario_logadoEstimateSize(
  usuario_logado object,
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

void _usuario_logadoSerialize(
  usuario_logado object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.data_cadastro);
  writer.writeString(offsets[1], object.email);
  writer.writeLong(offsets[2], object.id_partner_cliente);
  writer.writeLong(offsets[3], object.id_usuario);
  writer.writeString(offsets[4], object.login);
  writer.writeLong(offsets[5], object.perfil);
  writer.writeString(offsets[6], object.senha);
  writer.writeLong(offsets[7], object.status);
}

usuario_logado _usuario_logadoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = usuario_logado(
    data_cadastro: reader.readStringOrNull(offsets[0]),
    email: reader.readStringOrNull(offsets[1]),
    id_partner_cliente: reader.readLongOrNull(offsets[2]),
    id_usuario: reader.readLongOrNull(offsets[3]),
    login: reader.readStringOrNull(offsets[4]),
    perfil: reader.readLongOrNull(offsets[5]),
    senha: reader.readStringOrNull(offsets[6]),
    status: reader.readLongOrNull(offsets[7]),
  );
  object.id = id;
  return object;
}

P _usuario_logadoDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _usuario_logadoGetId(usuario_logado object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _usuario_logadoGetLinks(usuario_logado object) {
  return [];
}

void _usuario_logadoAttach(
    IsarCollection<dynamic> col, Id id, usuario_logado object) {
  object.id = id;
}

extension usuario_logadoQueryWhereSort
    on QueryBuilder<usuario_logado, usuario_logado, QWhere> {
  QueryBuilder<usuario_logado, usuario_logado, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension usuario_logadoQueryWhere
    on QueryBuilder<usuario_logado, usuario_logado, QWhereClause> {
  QueryBuilder<usuario_logado, usuario_logado, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension usuario_logadoQueryFilter
    on QueryBuilder<usuario_logado, usuario_logado, QFilterCondition> {
  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      data_cadastroIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'data_cadastro',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      data_cadastroIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'data_cadastro',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      data_cadastroEqualTo(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      data_cadastroLessThan(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      data_cadastroBetween(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      data_cadastroStartsWith(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      data_cadastroEndsWith(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      data_cadastroContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'data_cadastro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      data_cadastroMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'data_cadastro',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      data_cadastroIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'data_cadastro',
        value: '',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      data_cadastroIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'data_cadastro',
        value: '',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      emailEqualTo(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      emailGreaterThan(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      emailLessThan(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      emailBetween(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      emailStartsWith(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      emailEndsWith(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      emailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      emailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      id_partner_clienteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id_partner_cliente',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      id_partner_clienteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id_partner_cliente',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      id_partner_clienteEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_partner_cliente',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      id_usuarioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id_usuario',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      id_usuarioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id_usuario',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      id_usuarioEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_usuario',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      id_usuarioGreaterThan(
    int? value, {
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      id_usuarioLessThan(
    int? value, {
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      id_usuarioBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      loginIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'login',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      loginIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'login',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      loginEqualTo(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      loginGreaterThan(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      loginLessThan(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      loginBetween(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      loginStartsWith(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      loginEndsWith(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      loginContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'login',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      loginMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'login',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      loginIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'login',
        value: '',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      loginIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'login',
        value: '',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      perfilIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'perfil',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      perfilIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'perfil',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      perfilEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'perfil',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      perfilGreaterThan(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      perfilLessThan(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      perfilBetween(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      senhaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'senha',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      senhaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'senha',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      senhaEqualTo(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      senhaGreaterThan(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      senhaLessThan(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      senhaBetween(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      senhaStartsWith(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      senhaEndsWith(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      senhaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'senha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      senhaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'senha',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      senhaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senha',
        value: '',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      senhaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'senha',
        value: '',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      statusEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      statusGreaterThan(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      statusLessThan(
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

  QueryBuilder<usuario_logado, usuario_logado, QAfterFilterCondition>
      statusBetween(
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

extension usuario_logadoQueryObject
    on QueryBuilder<usuario_logado, usuario_logado, QFilterCondition> {}

extension usuario_logadoQueryLinks
    on QueryBuilder<usuario_logado, usuario_logado, QFilterCondition> {}

extension usuario_logadoQuerySortBy
    on QueryBuilder<usuario_logado, usuario_logado, QSortBy> {
  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy>
      sortByData_cadastro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data_cadastro', Sort.asc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy>
      sortByData_cadastroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data_cadastro', Sort.desc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy>
      sortById_partner_cliente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_partner_cliente', Sort.asc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy>
      sortById_partner_clienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_partner_cliente', Sort.desc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy>
      sortById_usuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_usuario', Sort.asc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy>
      sortById_usuarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_usuario', Sort.desc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy> sortByLogin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.asc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy> sortByLoginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.desc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy> sortByPerfil() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perfil', Sort.asc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy>
      sortByPerfilDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perfil', Sort.desc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy> sortBySenha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senha', Sort.asc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy> sortBySenhaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senha', Sort.desc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension usuario_logadoQuerySortThenBy
    on QueryBuilder<usuario_logado, usuario_logado, QSortThenBy> {
  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy>
      thenByData_cadastro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data_cadastro', Sort.asc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy>
      thenByData_cadastroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data_cadastro', Sort.desc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy>
      thenById_partner_cliente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_partner_cliente', Sort.asc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy>
      thenById_partner_clienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_partner_cliente', Sort.desc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy>
      thenById_usuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_usuario', Sort.asc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy>
      thenById_usuarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_usuario', Sort.desc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy> thenByLogin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.asc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy> thenByLoginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.desc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy> thenByPerfil() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perfil', Sort.asc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy>
      thenByPerfilDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perfil', Sort.desc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy> thenBySenha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senha', Sort.asc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy> thenBySenhaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senha', Sort.desc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension usuario_logadoQueryWhereDistinct
    on QueryBuilder<usuario_logado, usuario_logado, QDistinct> {
  QueryBuilder<usuario_logado, usuario_logado, QDistinct>
      distinctByData_cadastro({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'data_cadastro',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QDistinct>
      distinctById_partner_cliente() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_partner_cliente');
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QDistinct>
      distinctById_usuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_usuario');
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QDistinct> distinctByLogin(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'login', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QDistinct> distinctByPerfil() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'perfil');
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QDistinct> distinctBySenha(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'senha', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<usuario_logado, usuario_logado, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }
}

extension usuario_logadoQueryProperty
    on QueryBuilder<usuario_logado, usuario_logado, QQueryProperty> {
  QueryBuilder<usuario_logado, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<usuario_logado, String?, QQueryOperations>
      data_cadastroProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'data_cadastro');
    });
  }

  QueryBuilder<usuario_logado, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<usuario_logado, int?, QQueryOperations>
      id_partner_clienteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_partner_cliente');
    });
  }

  QueryBuilder<usuario_logado, int?, QQueryOperations> id_usuarioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_usuario');
    });
  }

  QueryBuilder<usuario_logado, String?, QQueryOperations> loginProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'login');
    });
  }

  QueryBuilder<usuario_logado, int?, QQueryOperations> perfilProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'perfil');
    });
  }

  QueryBuilder<usuario_logado, String?, QQueryOperations> senhaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'senha');
    });
  }

  QueryBuilder<usuario_logado, int?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
