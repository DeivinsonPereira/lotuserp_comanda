import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:lotuserp_comanda/model/collection/produto_grupo.dart';
import 'package:lotuserp_comanda/shared/components/header.dart';
import 'package:lotuserp_comanda/shared/repositories/http/download/delete_images_db.dart';
import 'package:path_provider/path_provider.dart';

class DownloadImages {
  final _logger = Logger();

  Future<void> downloadGeneric<T extends FileImagemExtension>(
      String Function(String file) endpoint,
      List<T> files,
      String folderPath) async {
    Directory dir = await getApplicationSupportDirectory();
    List<Uri> uri = [];

    for (var item in files) {
      uri.add(Uri.parse(endpoint(item.file_imagem!)));
    }

    try {
      for (var i = 0; i < uri.length; i++) {
        var response = await http
            .get(uri[i], headers: Header.getBasicHeader())
            .timeout(const Duration(seconds: 10));

        if (response.statusCode == 200) {
          String pathName = '${dir.path}$folderPath${(files[i].file_imagem!)}';

          // Verifica se o arquivo já existe e deleta
          await DeleteImagesDb.deleteFile(pathName);

          await Directory('${dir.path}$folderPath').create(recursive: true);
          File file = File(pathName);
          var result = await file.writeAsBytes(response.bodyBytes);
          _logger.d('Imagem baixada com sucesso $result');
        } else {
          _logger.e('Erro ao baixar imagem ${response.statusCode}');
          continue;
        }
      }
    } catch (e) {
      _logger.e('Erro ao baixar imagem $e');
    }
  }
}
