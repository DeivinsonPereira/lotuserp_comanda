import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:lotuserp_comanda/model/collection/produto_grupo.dart';
import 'package:lotuserp_comanda/shared/components/header.dart';
import 'package:lotuserp_comanda/shared/repositories/isar_db/interface/i_transactions_multiple_isar_db.dart';
import 'package:lotuserp_comanda/shared/repositories/isar_db/isar_service.dart';

class GenericRepositoryMultiple implements ITransactionsMultipleIsarDb {
  final _isarService = IsarService.instance;
  final _logger = Logger();

  GenericRepositoryMultiple._privateConstructor();

  static final GenericRepositoryMultiple _instance =
      GenericRepositoryMultiple._privateConstructor();

  static GenericRepositoryMultiple get instance => _instance;

  @override
  Future<List<R>> getAll<R>(IsarCollection<R> collection) async {
    try {
      List<R> data = await collection.where().findAll();
      return data;
    } catch (e) {
      _logger.e('Erro ao buscar item: $e');
      return [];
    }
  }

  @override
  Future<void> insert<T>(List<T> item, IsarCollection<T> collection,
      {bool notDelete = false}) async {
    final isar = await _isarService.db;
    try {
      isar.produto_grupos.where().findAll();

      isar.produto_grupos
          .filter()
          .id_grupoEqualTo(1)
          .and()
          .grupo_descricaoStartsWith('imagem')
          .findAll();

      if (notDelete == false) {
        int count = await collection.count();
        if (count > 0) {
          await isar.writeTxn(() async {
            await collection.clear();
          });
        }
      }

      await isar.writeTxn(() async {
        await collection.putAll(item);
      });
    } catch (e) {
      _logger.e('Erro ao inserir item: $e');
    }
  }

  @override
  Future<void> search<R>(
      String endpoint,
      Function(List<R>) handleSuccess,
      Function(String) handleError,
      R Function(Map<String, dynamic>) fromMap) async {
    Uri uri = Uri.parse(endpoint);

    try {
      var response = await http
          .get(uri, headers: Header.getBasicHeader())
          .timeout(const Duration(seconds: 15));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          List<R> itens = [];
          for (var item in data['itens']) {
            itens.add(fromMap(item));
          }

          handleSuccess(itens);
        } else {
          _logger.e(data['message']);
          handleError(data['message']);
        }
      } else {
        _logger.e(response.statusCode);
        handleError('${response.statusCode}');
      }
    } catch (e) {
      _logger.e(e);
      handleError('$e');
    }
  }

  Future<void> deleteAll<T>(IsarCollection<T> collection) async {
    final isar = await _isarService.db;
    try {
      await isar.writeTxn(() async {
        await collection.clear();
      });
    } catch (e) {
      _logger.e('Erro ao deletar item: $e');
    }
  }
}
