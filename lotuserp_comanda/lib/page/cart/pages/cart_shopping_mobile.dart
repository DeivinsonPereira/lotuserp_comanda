import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/cart/logic/logic_send_order.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/methods/navigation/navigation_features.dart';
import 'package:lotuserp_comanda/utils/methods/order/order_features.dart';

import '../../../model/comanda_selecionada.dart';
import '../../../utils/custom_text_style.dart';
import '../../../utils/methods/pdv/features/pdv_remove.dart';
import '../../order/service/logic/logic_update_tables.dart';
import '../logic/logic_build_details_order.dart';

class CartShoppingMobile extends StatelessWidget {
  const CartShoppingMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final _pdvController = Dependencies.pdvController();
    final _pdvRemove = PdvRemove.instance;
    final _navigationFeatures = NavigationFeatures.instance;
    final _orderFeatures = OrderFeatures.instance;

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

    Widget _buildButton(
        Function() function, String text, Color color, IconData icon) {
      return InkWell(
        onTap: function,
        child: Container(
          height: 80,
          width: Get.size.width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text, style: CustomTextStyle.whiteBoldText(16)),
              Icon(
                icon,
                color: Colors.white,
              )
            ],
          ),
        ),
      );
    }

    Widget _buildRemoveAllButton() {
      return _buildButton(() {
        _pdvRemove.removeAllOrderToOrderTicketsList();
        LogicUpdateTables().updateTables(context: context);
        _navigationFeatures.changePage(0);
        _navigationFeatures.setPaginaAtual(0);
        _orderFeatures.clearCommandNumberController;
      }, 'Limpar Carrinho', Colors.red, Icons.delete);
    }

    Widget _buildSendOrderButton() {
      return _buildButton(() async {
        await LogicSendOrder().send(context);
      }, 'Enviar Pedido', CustomColors.confirmButtonColor, Icons.send);
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildRemoveAllButton(),
                    SizedBox(width: Get.size.width * 0.02),
                    _buildSendOrderButton(),
                  ],
                ),
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

    Widget _buildBody() {
      return Column(
        children: [
          _buildTitle(),
          Expanded(child: _buildContainerDetails()),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }
}
