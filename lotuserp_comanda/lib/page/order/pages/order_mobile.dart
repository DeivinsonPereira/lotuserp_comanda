import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/common/custom_elevated_button.dart';
import 'package:lotuserp_comanda/page/order/components/card_table_order.dart';
import 'package:lotuserp_comanda/page/order/service/logic/list_filter_tables.dart';
import 'package:lotuserp_comanda/page/order/service/logic/logic_colors.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';

import '../../../utils/custom_text_style.dart';

class OrderMobile extends StatelessWidget {
  const OrderMobile({super.key});

  @override
  Widget build(BuildContext context) {
    // Constrói os botões
    Widget _buildButtonBody(String text, Function() function, int indexButton) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: Obx(() => CustomElevatedButton(
            function: function,
            colorButton: LogicColors().getColorsButton(indexButton),
            text: text,
            style: LogicColors().getColorsTextButton(indexButton),
            rounded: 10)),
      );
    }

    Widget _buildFilters() {
      return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: ListFilterTables.listTables.length,
          itemBuilder: (context, index) {
            String text = ListFilterTables.listTables[index]['mesas'];
            Function() function = ListFilterTables.listTables[index]['logica'];
            int indexButton = ListFilterTables.listTables[index]['index'];

            return _buildButtonBody(text, function, indexButton);
          });
    }

    // Constrói a linha dos botões
    Widget _buildLineFilterButtons() {
      return Container(
        height: 60,
        width: Get.size.width,
        color: CustomColors.primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _buildFilters(),
            ),
          ],
        ),
      );
    }

    Widget _buildTitle() {
      return Text('Mesas', style: CustomTextStyle.blackBoldText(30));
    }

    // Constrói o corpo do popUp
    Widget _buildBody() {
      return Column(
        children: [
          _buildTitle(),
          const SizedBox(height: 10),
          const Expanded(
            child: CardTableOrder(
              count: 3,
              sizeNumberCard: 28,
            ),
          ),
          _buildLineFilterButtons(),
        ],
      );
    }

    // Constrói o popUp
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }
}
