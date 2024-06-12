// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/model/collection/produto.dart';
import 'package:lotuserp_comanda/model/collection/produto_grupo.dart';
import 'package:lotuserp_comanda/page/common/custom_cherry.dart';
import 'package:lotuserp_comanda/page/common/loading_screen.dart';
import 'package:lotuserp_comanda/page/order/service/interface/i_navigation_pdv.dart';
import 'package:lotuserp_comanda/shared/repositories/isar_db/generic_repository_multiple.dart';
import 'package:lotuserp_comanda/shared/repositories/isar_db/isar_service.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/pdv_features.dart';

import '../../../../model/collection/complemento.dart';
import '../../../pdv/pdv_page.dart';

class NavigationPdv implements INavigationPdv {
  final _pdvFeatures = PdvFeatures.instance;
  final _isarService = IsarService.instance;
  final _genericRepositoryMultiple = GenericRepositoryMultiple.instance;

  @override
  Future<void> navigation({BuildContext? context}) async {
    Get.dialog(const LoadingScreen());
    await _handleNavigation(context);
  }

  Future<void> _handleNavigation(BuildContext? context) async {
    final isar = await _isarService.db;

    List<produto_grupo> groups =
        await _genericRepositoryMultiple.getAll(isar.produto_grupos);
    List<produto> products =
        await _genericRepositoryMultiple.getAll(isar.produtos);
    List<complemento> complements =
        await _genericRepositoryMultiple.getAll(isar.complementos);

    if (groups.isNotEmpty && products.isNotEmpty) {
      await _proceedWithGroupsAndProducts(groups, products, complements);
    } else {
      _handleNoGroupsOrProductsError(context);
    }
  }

  Future<void> _proceedWithGroupsAndProducts(List<produto_grupo> groups,
      List<produto> products, List<complemento> complements) async {
    _pdvFeatures.setGroupSelected(0);
    Future.delayed(const Duration(seconds: 1), () {
      Get.back();
      Get.to(() => const PdvPage());
    });
  }

  void _handleNoGroupsOrProductsError(BuildContext? context) {
    Get.back();
    const CustomCherryError(
      message:
          'Nenhum grupo ou produtos encontrado. Faça a carga geral de dados',
    ).show(context ?? Get.context!);
  }
}
