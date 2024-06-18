import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/core/size_screen.dart';
import 'package:lotuserp_comanda/page/home/home_page.dart';

class SplashController extends GetxController {
  var scale = 5.0.obs;
  var animationOpacityLogo = 0.0.obs;

  double get logoAnimationWidth => 800 / scale.value;

  @override
  void onInit() {
    super.onInit();

    if (SizeScreen.isMobile) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    } else {
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    }

    Future.delayed(const Duration(milliseconds: 100), () {
      animationOpacityLogo.value = 1.0;
      scale.value = 2;
    });
    Future.delayed(const Duration(seconds: 3), () async {
      HomePage().selectHomePage();
    });
  }
}
