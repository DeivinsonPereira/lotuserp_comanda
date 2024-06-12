// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/controller/pdv_controller.dart';
import 'package:lotuserp_comanda/page/common/custom_image.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/format_numbers.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/pdv_features.dart';
import '../custom/buttons_widget.dart';

class InformationButtonsWidget extends StatelessWidget {
  final PdvController controllerReactive;
  const InformationButtonsWidget({
    Key? key,
    required this.controllerReactive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _configController = Dependencies.configController();
    final _orderController = Dependencies.orderController();
    final _pdvFeatures = PdvFeatures.instance;
    Color _selectedColor = _configController.selectedColor.value.color;

    double _sizeText = 13;

    // Constrói o conteiner da logo
    Widget _buildContainerLogo() {
      return Container(
        width: 150,
        height: 90,
        decoration: BoxDecoration(
            color: _selectedColor, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: CustomImage().getLogoBranca(),
        ),
      );
    }

    Widget _buildMesaId() {
      return Text(
        'Mesa: ${_orderController.tableSelected.value.id_comanda}',
        style: CustomTextStyle.whiteBoldText(_sizeText),
      );
    }

    Widget _buildvalueMesa() {
      return Text(
        'Valor: ${FormatNumbers.formatNumbertoString(_orderController.tableSelected.value.total_consumo)}',
        style: CustomTextStyle.whiteBoldText(13),
      );
    }

    // Constrói o nome do usuario no conteiner de informações
    Widget _buildClientName() {
      return Text(
        'Cliente: ${_orderController.tableSelected.value.identificador ?? ''}',
        style: CustomTextStyle.whiteBoldText(_sizeText),
      );
    }

    // Constrói o botão CPF/CNPJ
    Widget _buildButtonCpfCnpj() {
      return ButtonsPdv().iconsOptions(
          FontAwesomeIcons.addressCard,
          'CPF/CNPJ',
          () => {
                //TODO fazer dialog de cpf/cnpj
              });
    }

    // Constrói o botão Cancelar
    Widget _buildButtonCancel() {
      return ButtonsPdv().iconsOptions(
        FontAwesomeIcons.solidTrashCan,
        'Cancelar',
        () => _pdvFeatures.removeAllCartShopping(),
      );
    }


    Widget _buildButtonExtract() {
      return ButtonsPdv().iconsOptions(Icons.receipt, 'Extrato', () {
        //TODO trazer o extrato da mesa
      });
    }

    // Constrói o container de informações
    Widget _buildInformationsContainer() {
      return Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: _selectedColor,
              borderRadius: BorderRadius.circular(10),
            ),
            width: 170,
            height: 90,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildMesaId(),
                  _buildvalueMesa(),
                  _buildClientName(),
                ],
              ),
            ),
          ),
        ),
      );
    }

    

    // retorna a linha das informações o botões (parte inferior esquerda da tela pdv)
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            _buildContainerLogo(),
            _buildInformationsContainer(),
            _buildButtonCpfCnpj(),
            _buildButtonCancel(),
            _buildButtonExtract(),
          ],
        ),
      ),
    );
  }
}
