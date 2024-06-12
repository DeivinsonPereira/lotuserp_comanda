// busca produtos pela descrição no campo de pesquisa
// ignore_for_file: unused_element, must_be_immutable

import 'package:flutter/material.dart';
import 'package:lotuserp_comanda/controller/pdv_controller.dart';
import 'package:lotuserp_comanda/controller/search_product_pdv_controller.dart';
import 'package:lotuserp_comanda/shared/repositories/isar_db/isar_service.dart';

class SearchProductPresentation extends StatelessWidget {
  final String ip;
  final IsarService service;
  final SearchProductPdvController controller;
  final PdvController pdvController;

  bool? isBarCode;
  SearchProductPresentation({
    Key? key,
    required this.ip,
    required this.service,
    required this.controller,
    required this.pdvController,
    this.isBarCode = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
