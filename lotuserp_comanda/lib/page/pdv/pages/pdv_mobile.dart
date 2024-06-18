import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/payment_total_widget.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/product_widget.dart';

import '../../../controller/pdv_controller.dart';
import '../../../utils/dependencies.dart';
import '../../../utils/methods/pdv/features/pdv_remove.dart';
import '../widgets/line_group_widget.dart';
import '../widgets/search_camp_widget.dart';

class PdvMobile extends StatelessWidget {
  const PdvMobile({super.key});

  @override
  Widget build(BuildContext context) {
    Dependencies.configController();
    final _pdvRemove = PdvRemove.instance;

    // linha de pesquisa e voltar
    Widget lineSearchAndBackButton(PdvController controller) {
      return Row(
        children: [
          // Icone de voltar
          IconButton(
            onPressed: () {
              Get.back();
              _pdvRemove.clearAllComplementSelected();
              _pdvRemove.removeAllCartShopping();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 70, 70, 70),
            ),
          ),

          // Constrói o campo de busca
          Flexible(
            child: SearchCamp(pdvController: controller),
          ),
        ],
      );
    }

    // divisão da tela
    Widget divisionWidget(PdvController controller) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Column(children: [
                // Constrói a linha de pesquisa e voltar
                lineSearchAndBackButton(controller),
                // Constrói a linha do grupo
                const LineGroup(),
                // Constrói os produtos
                const ProductWidget(),
                // Constrói a linha dos botões e informaçãoes
                const Expanded(
                  child: PaymentTotalWidget(),
                )
              ]),
            ),
          ],
        ),
      );
    }

    //início do conteúdo
    Widget conteudo(PdvController controller) {
      return SingleChildScrollView(
        child: SizedBox(
          height: Get.size.height,
          width: Get.size.width,
          child: divisionWidget(controller),
        ),
      );
    }

    //builder da page
    return GetBuilder<PdvController>(
      init: PdvController(),
      builder: (controller) {
        return Scaffold(
          body: conteudo(controller),
        );
      },
    );
  }
}
