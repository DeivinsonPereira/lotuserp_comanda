// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lotuserp_comanda/controller/pdv_controller.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/format_txt.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/features/pdv_update.dart';

class SearchCamp extends StatelessWidget {
  final PdvController pdvController;
  const SearchCamp({
    Key? key,
    required this.pdvController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pdvFeatures = PdvUpdate.instance;
    final _pdvController = Dependencies.pdvController();

    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextField(
        controller: _pdvController.searchProductController,
        inputFormatters: [UpperCaseTxt()],
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(left: 10, right: 10, top: 12),
          disabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
          border: InputBorder.none,
          hintText: 'Busque um produto por nome',
          labelStyle:
              TextStyle(color: Color.fromARGB(255, 53, 53, 53), fontSize: 18),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: Icon(
            FontAwesomeIcons.magnifyingGlass,
          ),
        ),
        onChanged: (value) {
          if (value.isEmpty) {
            _pdvFeatures.updateFilteredProdutos(0, _pdvController.allGroups[0]);
            return;
          }
          _pdvFeatures.updateFilteredProductsByDesc();
        },
      ),
    );
  }
}
