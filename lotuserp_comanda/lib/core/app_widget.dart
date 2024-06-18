import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/splash/splash_page.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Lotus ERP Comanda',
      navigatorObservers: [ImmersiveModeObserver()],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.primaryColor),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}


class ImmersiveModeObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    setImmersiveMode();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    setImmersiveMode();
  }

  void setImmersiveMode() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }
}
