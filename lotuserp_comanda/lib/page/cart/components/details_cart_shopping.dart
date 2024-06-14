import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/model/comanda_selecionada.dart';
import 'package:lotuserp_comanda/page/cart/logic/logic_build_details_order.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/pdv_features.dart';

class DetailsCartShopping extends StatelessWidget {
  const DetailsCartShopping({super.key});

  @override
  Widget build(BuildContext context) {
    final _pdvController = Dependencies.pdvController();
    final _pdvFeatures = PdvFeatures.instance;

    Widget _buildDetailsOrder(
        ComandaSelecionada comandaSelecionada, int index) {
      return LogicBuildDetailsOrder().build(index, comandaSelecionada);
    }

    Widget _buildListComandaSelecionada() {
      return Obx(() => ListView.builder(
          itemCount: _pdvController.orderTicketsList.length,
          itemBuilder: (context, index) {
            ComandaSelecionada comandaSelecionada =
                _pdvController.orderTicketsList[index];
            return _buildDetailsOrder(comandaSelecionada, index);
          }));
    }

    Widget _buildRemoveAllButton() {
      return InkWell(
        onTap: () {
          _pdvFeatures.removeAllOrderToOrderTicketsList();
          Get.back();
        },
        child: Container(
          height: 80,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.red,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Limpar Carrinho', style: CustomTextStyle.whiteBoldText(20)),
              const Icon(
                Icons.delete,
                color: Colors.white,
              )
            ],
          ),
        ),
      );
    }

    Widget _buildContainerDetails() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5.0,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildListComandaSelecionada()),
                const Divider(),
                _buildRemoveAllButton(),
              ],
            ),
          ),
        ),
      );
    }

    Widget _buildTitle() {
      return Center(
        child: Text(
          'Detalhes do carrinho',
          style: CustomTextStyle.blackBoldText(35),
        ),
      );
    }

    Widget _buildBackButton() {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black)),
        ),
      );
    }

    return Column(
      children: [
        _buildBackButton(),
        _buildTitle(),
        Expanded(child: _buildContainerDetails()),
      ],
    );
  }
}
