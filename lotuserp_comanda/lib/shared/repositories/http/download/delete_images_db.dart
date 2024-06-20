import 'dart:io';

import 'package:flutter/foundation.dart';

class DeleteImagesDb {
  
  static Future<void> deleteExistingFiles(String folderPath) async {
  final directory = Directory(folderPath);
  if (await directory.exists()) {
    final entities = directory.listSync();
  
    for (final entity in entities) {
      if (entity is File) {
        await entity.delete();
        if (kDebugMode) {
          print('Arquivo excluído: ${entity.path}');
        }
      } else if (entity is Directory) {
        await deleteExistingFiles(entity.path);
      }
    }
  } else {
    if (kDebugMode) {
      print('A pasta não existe: $folderPath');
    }
  }
}
}