import 'package:flutter/material.dart';

import '../common/informations.dart';

class LineInformationsMonitor extends StatelessWidget {
  const LineInformationsMonitor({super.key});

  @override
  Widget build(BuildContext context) {
    final informations = Informations();

    return Row(children: [
      Expanded(child: informations.buildTotalBruto()),
      Expanded(child: informations.buildTotalCouvert()),
      Expanded(child: informations.buildTotalServicos()),
      Expanded(child: informations.buildTotalLiquido()),
    ]);
  }
}
