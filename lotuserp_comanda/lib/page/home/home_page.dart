import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/home/pages/home_mobile.dart';
import 'package:lotuserp_comanda/page/home/pages/home_monitor.dart';

class HomePage {
  void selectHomePage() {
    print(Get.size.width);
    if (Get.size.width < 400) {
      Get.off(() => const HomeMobile());
      return;
    }

    Get.off(() => const HomeMonitor());
  }
}
