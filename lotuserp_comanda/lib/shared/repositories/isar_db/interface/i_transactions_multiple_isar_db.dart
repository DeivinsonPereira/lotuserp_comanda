import 'package:isar/isar.dart';

abstract class ITransactionsMultipleIsarDb {
  Future<void> insert<T>(List<T> item, IsarCollection<T> collection, {bool notDelete = false});
  Future<List<R>> getAll<R>(IsarCollection<R> collection);
  Future<void> search<R>(String endpoint, Function(List<R>) handleSuccess,
      Function(String) handleError, R Function(Map<String, dynamic>) fromMap);
}
