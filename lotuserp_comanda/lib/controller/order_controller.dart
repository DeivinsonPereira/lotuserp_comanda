import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/model/collection/mesa_listada.dart';
import 'package:lotuserp_comanda/model/mesa_extrato.dart';

class OrderController extends GetxController {
  TextEditingController searchTableController = TextEditingController();
  TextEditingController clientNameController = TextEditingController();
  TextEditingController commandNumberController = TextEditingController();
  TextEditingController numberPeopleController = TextEditingController(text: '1');

  RxInt buttonSelected = 0.obs;
  RxList<mesa_listada> listTables = <mesa_listada>[].obs;
  RxList<mesa_listada> filteredListTables = <mesa_listada>[].obs;
  Rx<mesa_listada> tableSelected = mesa_listada(id_comanda: 0).obs;

  RxList<MesaExtrato> mesaExtrato = <MesaExtrato>[].obs;

  String clientName = '';
}
