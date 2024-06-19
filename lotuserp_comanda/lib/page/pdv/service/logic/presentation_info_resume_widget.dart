import 'package:flutter/material.dart';
import 'package:lotuserp_comanda/core/size_screen.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/format_numbers.dart';
import 'package:lotuserp_comanda/utils/format_string.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/get/pdv_get.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/get/pdv_bool.dart';

class PresentationInfoResumeWidget {
  final _pdvController = Dependencies.pdvController();
  final _pdvGet = PdvGet.instance;
  final _pdvBool = PdvBool.instance;

  PresentationInfoResumeWidget._privateConstructor();

  static final PresentationInfoResumeWidget _instance =
      PresentationInfoResumeWidget._privateConstructor();

  static PresentationInfoResumeWidget get instance => _instance;

  Widget build(int index) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizeScreen.isMobile
              ? Text(
                  '${_pdvGet.getIdProductCartShopping(index)} - ${FormatString.limitarTexto(_pdvGet.getDescriptionProductCartShopping(index), 20)}')
              : Text(
                  '${_pdvGet.getIdProductCartShopping(index)} - ${_pdvGet.getDescriptionProductCartShopping(index)}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
          Text(
            'R\$ ${FormatNumbers.formatNumbertoString(_pdvGet.getSellPriceProductCartShopping(index))}',
          ),
        ],
      ),
      ..._buildWidget(index)
    ]);
  }

  List<Widget> _buildWidget(int index) {
    List<Widget> complements = [];
    if (!_pdvBool.isComplementEmpty(index)) {
      complements.addAll(_buildComplements(index));
    }

    if (!_pdvBool.isComplementDescriptionEmpty(index)) {
      complements.add(_buildComplementsDescription(index));
    }

    return complements;
  }

  List<Widget> _buildComplements(int index) {
    List<Widget> complements = [];
    for (var i = 0;
        i < _pdvController.cartShopping[index].complementoSelected.length;
        i++) {
      complements.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizeScreen.isMobile
              ? Text(
                  '+ ${FormatString.limitarTexto(_pdvGet.getDescriptionComplementCartShopping(index, i), 15)}')
              : Text(
                  '+ ${_pdvGet.getDescriptionComplementCartShopping(index, i)}'),
          Text(
              ' ${_pdvGet.getQuantityComplementCartShopping(index, i)} - R\$ ${FormatNumbers.formatNumbertoString(_pdvGet.getPriceComplementCartShopping(index, i))}'),
        ],
      ));
    }
    return complements;
  }

  Widget _buildComplementsDescription(int index) {
    return Text(
        '+ ${_pdvGet.getInformationDescriptionComplementCartShopping(index)}');
  }
}
