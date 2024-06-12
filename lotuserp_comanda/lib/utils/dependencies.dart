import 'package:get/get.dart';
import 'package:lotuserp_comanda/controller/load_data_controller.dart';
import 'package:lotuserp_comanda/controller/order_controller.dart';
import 'package:lotuserp_comanda/controller/pdv_controller.dart';
import 'package:lotuserp_comanda/controller/splash_controller.dart';

import '../controller/config_controller.dart';

class Dependencies {
  static SplashController splashController() {
    if (Get.isRegistered<SplashController>()) {
      return Get.find<SplashController>();
    }
    return Get.put(SplashController());
  }

  static ConfigController configController() {
    if (Get.isRegistered<ConfigController>()) {
      return Get.find<ConfigController>();
    }
    return Get.put(ConfigController(), permanent: true);
  }

  static PdvController pdvController() {
    if (Get.isRegistered<PdvController>()) {
      return Get.find<PdvController>();
    }
    return Get.put(PdvController(), permanent: true);
  }

  static LoadDataController loadDataController() {
    if (Get.isRegistered<LoadDataController>()) {
      return Get.find<LoadDataController>();
    }
    return Get.put(LoadDataController(), permanent: true);
  }

  static OrderController orderController() {
    if (Get.isRegistered<OrderController>()) {
      return Get.find<OrderController>();
    }
    return Get.put(OrderController(), permanent: true);
  }
  
}
