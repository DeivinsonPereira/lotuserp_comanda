import 'package:get/get.dart';
import 'package:lotuserp_comanda/core/navigation_bar_widget.dart';
import 'package:lotuserp_comanda/core/size_screen.dart';
import 'package:lotuserp_comanda/page/order/pages/order_monitor.dart';

class OrderPage {
  static void selectOrderPage() {
    if (SizeScreen.isMobile) {
      Get.to(() => const NavigationBarWidget());
      return;
    }
    Get.to(() => const OrderMonitor());
  }
}
