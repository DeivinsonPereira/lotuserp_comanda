import 'package:lotuserp_comanda/model/collection/produto_grupo.dart';

abstract class IDownloadLogo {
  Future<void> downloadGeneric<T extends FileImagemExtension>(
      String Function(String file) endpoint, List<T> files, String folderPath);
}
