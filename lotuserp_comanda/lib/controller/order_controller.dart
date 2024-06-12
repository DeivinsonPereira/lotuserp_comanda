import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/model/collection/mesa_listada.dart';

class OrderController extends GetxController {
  TextEditingController searchTableController = TextEditingController();

  var buttonSelected = 0.obs;
  var listTables = <mesa_listada>[].obs;
  var filteredListTables = <mesa_listada>[].obs;
  var tableSelected = mesa_listada(id_comanda: 0).obs;
}
