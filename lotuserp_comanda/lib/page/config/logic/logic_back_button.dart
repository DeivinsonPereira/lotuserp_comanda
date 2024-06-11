import 'package:get/get.dart';
import 'package:lotuserp_comanda/utils/methods/load_data/load_data_features.dart';

class LogicButtonLoadData {
  LogicButtonLoadData._privateConstructor();

  static final LogicButtonLoadData _instance =
      LogicButtonLoadData._privateConstructor();

  static LogicButtonLoadData get instance => _instance;

  final _loadDataFeatures = LoadDataFeatures.instance;

  void backButtonLogic() {
    _loadDataFeatures.clearAllCheckbox();
    Get.back();
  }
}
