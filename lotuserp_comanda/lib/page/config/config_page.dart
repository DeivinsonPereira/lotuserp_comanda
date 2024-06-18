import 'package:get/get.dart';
import 'package:lotuserp_comanda/core/size_screen.dart';
import 'package:lotuserp_comanda/page/config/pages/config_monitor.dart';

import 'pages/config_mobile.dart';

class ConfigPage {
  static void selectConfigPage() {
    if (SizeScreen.isMobile) {
      Get.to(() => const ConfigMobile());
      return;
    }
    Get.to(() => const ConfigMonitor());
  }
}
