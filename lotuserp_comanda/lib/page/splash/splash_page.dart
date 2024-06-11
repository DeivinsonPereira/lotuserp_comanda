import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/common/custom_image.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _splashController = Dependencies.splashController();

    return Scaffold(
      body: Obx(() => DecoratedBox(
            decoration: BoxDecoration(
              color: CustomColors.primaryColor, // Definir cor witheLabel
            ),
            child: Center(
              child: AnimatedOpacity(
                duration: const Duration(seconds: 3),
                curve: Curves.ease,
                opacity: _splashController.animationOpacityLogo.value,
                child: AnimatedContainer(
                  width: _splashController.logoAnimationWidth,
                  duration: const Duration(seconds: 3),
                  curve: Curves.linearToEaseOut,
                  child: SizedBox(
                      height: 500, child: CustomImage().getLogoBranca()),
                ),
              ),
            ),
          )),
    );
  }
  
}
