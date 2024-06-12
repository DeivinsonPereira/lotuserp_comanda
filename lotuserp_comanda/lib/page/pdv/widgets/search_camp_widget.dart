// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/controller/pdv_controller.dart';
import 'package:lotuserp_comanda/controller/search_product_pdv_controller.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/format_txt.dart';
import 'package:lotuserp_comanda/utils/methods/search_product_pdv/search_product_pdv_features.dart';


class SearchCamp extends StatelessWidget {
  final PdvController pdvController;
  final FocusNode focusNode;
  const SearchCamp({
    Key? key,
    required this.pdvController,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchProductPdvController = Dependencies.searchProductPdvController();
    final _searchProductPdvFeatures = SearchProductPdvFeatures.instance;

    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: GetBuilder<SearchProductPdvController>(
        builder: (_) {
          return TextField(
            controller: searchProductPdvController.searchController,
            inputFormatters: [UpperCaseTxt()],
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: () {
                  _searchProductPdvFeatures.updateIsBarCode();
                },
                icon: const Icon(Icons.barcode_reader),
              ),
              contentPadding:
                  const EdgeInsets.only(left: 10, right: 10, top: 12),
              disabledBorder:
                  const UnderlineInputBorder(borderSide: BorderSide.none),
              border: InputBorder.none,
              hintText: _.isBarCode
                  ? 'Faça a leitura do código de barras'
                  : 'Busque um produto por nome',
              labelStyle: const TextStyle(
                  color: Color.fromARGB(255, 53, 53, 53), fontSize: 18),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: _.isBarCode
                  ? IconButton(
                      onPressed: () {
                        _searchProductPdvFeatures.updateIsBarCode();
                      },
                      icon: const Icon(
                        FontAwesomeIcons.barcode,
                        color: Colors.black,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        _searchProductPdvFeatures.updateIsBarCode();
                      },
                      icon: const Icon(
                        FontAwesomeIcons.keyboard,
                        color: Colors.black,
                      ),
                    ),
            ),
            onSubmitted: (value) => focusNode.requestFocus(),
            onChanged: (value) {
              _searchProductPdvFeatures.updateSearch();
              if (value == '') {
                _searchProductPdvFeatures.updateIsSearch(false);
              } else {
                _searchProductPdvFeatures.updateIsSearch(true);
              }
            },
          );
        },
      ),
    );
  }
}
