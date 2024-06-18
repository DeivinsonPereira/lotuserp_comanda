import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/controller/navigation_controller.dart';
import 'package:lotuserp_comanda/page/cart/cart_shopping_page.dart';
import 'package:lotuserp_comanda/page/choose_table/choose_table.dart';
import 'package:lotuserp_comanda/page/order/pages/order_mobile.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Dependencies.navigationController();

    return GetBuilder<NavigationController>(
        init: NavigationController(),
        builder: (_) {
          return Scaffold(
            body: PageView(
              controller: _.pc.value,
              children: const [
                ChooseTable(),
                OrderMobile(),
                CartShoppingPage(),
              ],
              onPageChanged: (page) => _.setPaginaAtual(page),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _.paginaAtual.value,
              items: [
                const BottomNavigationBarItem(
                    icon: Icon(Icons.list), label: 'Pesquisar'),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.table_bar), label: 'Mesas'),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart), label: 'Carrinho')
              ].toList(),
              onTap: (value) => _.changePage(value),
            ),
          );
        });
  }
}
