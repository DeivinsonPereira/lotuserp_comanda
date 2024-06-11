import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/splash/splash_page.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Lotus ERP Comanda',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.primaryColor),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}
