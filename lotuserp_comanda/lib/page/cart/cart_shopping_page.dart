import 'package:flutter/material.dart';
import 'package:lotuserp_comanda/page/cart/components/details_cart_shopping.dart';
import 'package:lotuserp_comanda/page/cart/components/resume_order_ticket_list.dart';

class CartShoppingPage extends StatelessWidget {
  const CartShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _buildBody() {
      return const Row(
        children: [
          Expanded(
            flex: 4,
            child: DetailsCartShopping(),
          ),
          Expanded(
            flex: 3,
            child: ResumeOrderTicketList(),
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }
}
