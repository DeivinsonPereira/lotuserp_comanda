import 'package:flutter/material.dart';
import 'package:lotuserp_comanda/model/collection/mesa_listada.dart';
import 'package:lotuserp_comanda/utils/format_string.dart';

class LogicGetUserName {
  LogicGetUserName._privateConstructor();

  static final LogicGetUserName instance =
      LogicGetUserName._privateConstructor();

  Widget build(mesa_listada data) {
    if (data.identificador != null && data.identificador != '') {
      return Text(
        FormatString.limitarTexto(data.identificador ?? '', 20),
        textAlign: TextAlign.center,
      );
    }

    return const SizedBox.shrink();
  }
}
