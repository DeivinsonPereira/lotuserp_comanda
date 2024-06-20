import 'package:get/get.dart';
import 'package:lotuserp_comanda/model/charge_data.dart';

class LoadDataController extends GetxController {
  bool isDownloadSuccess = true;

  RxList<ChargeData> listCheckbox = <ChargeData>[
    ChargeData(name: 'Dados Empresa', isMarked: false),
    ChargeData(name: 'Geral', isMarked: false),
    ChargeData(name: 'Usuarios', isMarked: false),
    ChargeData(name: 'Imagens Grupo', isMarked: false),
    ChargeData(name: 'Imagens Produtos', isMarked: false),
    ChargeData(name: 'Deletar Imagens', isMarked: false),
  ].obs;
}
