import 'package:flutter/material.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/extrato/common/informations.dart';

class LineInformationsMobile extends StatelessWidget {
  const LineInformationsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final informations = Informations();

    return Column(
      children: [
        Row(children: [
          Expanded(child: informations.buildTotalBruto()),
          Expanded(child: informations.buildTotalCouvert()),
        ]),
        Row(
          children: [
            Expanded(child: informations.buildTotalServicos()),
            Expanded(child: informations.buildTotalLiquido()),
          ],
        )
      ],
    );
  }
}
