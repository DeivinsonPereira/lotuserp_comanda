import 'package:isar/isar.dart';

abstract class ITransactionsSingleIsarDb {
  Future<void> insert<T>(T item, IsarCollection<T> collection, {bool notDelete = false});
  Future<T?> get<T>(IsarCollection<T> collection);
  Future<void> search<T>(String endpoint, Function(T) handleSuccess,
      Function(String) handleError, T Function(Map<String, dynamic>) fromMap);
}
