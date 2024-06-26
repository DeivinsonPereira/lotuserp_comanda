// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/format_numbers.dart';

class ContainerInformations extends StatelessWidget {
  final String text;
  final double value;
  final Color color;
  bool? isPercentage;
  ContainerInformations({
    Key? key,
    required this.text,
    required this.value,
    required this.color,
    this.isPercentage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildDescription() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: CustomTextStyle.blackText(18),
          )
        ],
      );
    }

    Widget _buildValue() {
      return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Text(
          !isPercentage!
              ? 'R\$ ${FormatNumbers.formatNumbertoString(value)}'
              : '${value.toStringAsFixed(2)}%',
          style: CustomTextStyle.blackBoldText(18),
        )
      ]);
    }

    return Container(
        height: Get.size.height * 0.08,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(children: [
            _buildDescription(),
            const Expanded(child: SizedBox.shrink()),
            _buildValue(),
          ]),
        ));
  }
}
