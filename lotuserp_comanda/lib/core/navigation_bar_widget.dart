import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/controller/navigation_controller.dart';
import 'package:lotuserp_comanda/controller/pdv_controller.dart';
import 'package:lotuserp_comanda/page/choose_table/choose_table.dart';
import 'package:lotuserp_comanda/page/order/pages/order_mobile.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/get/pdv_get.dart';

import '../page/cart/pages/cart_shopping_mobile.dart';
import '../utils/methods/navigation/navigation_features.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Dependencies.navigationController();
    Dependencies.pdvController();
    final _navigationFeatures = NavigationFeatures.instance;
    final _pdvGet = PdvGet.instance;

    Widget _buildContainerQuantity(PdvController pdvController) {
      return _pdvGet.getQuantityOrdersInOrderTicketsList() > 0
          ? Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                constraints: const BoxConstraints(
                  minWidth: 12,
                  minHeight: 12,
                ),
                child: Text(
                  pdvController.orderTicketsList.length.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : const SizedBox();
    }

    return GetBuilder<NavigationController>(
        init: NavigationController(),
        builder: (_) {
          return Scaffold(
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _.pc.value,
              children: const [
                ChooseTable(),
                OrderMobile(),
                CartShoppingMobile(),
              ],
              onPageChanged: (page) => _navigationFeatures.setPaginaAtual(page),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _.paginaAtual.value,
              items: [
                const BottomNavigationBarItem(
                    icon: Icon(Icons.list), label: 'Pesquisar'),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.table_bar), label: 'Mesas'),
                BottomNavigationBarItem(
                    icon: Stack(
                      children: [
                        const Icon(Icons.shopping_cart),
                        GetBuilder<PdvController>(
                          builder: (pdvController) {
                            return _buildContainerQuantity(pdvController);
                          },
                        ),
                      ],
                    ),
                    label: 'Carrinho')
              ].toList(),
              onTap: (value) => _navigationFeatures.changePage(value),
            ),
          );
        });
  }
}
