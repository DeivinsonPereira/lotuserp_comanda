// ignore_for_file: public_member_api_docs, sort_constructors_first, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/page/order/components/resume_order.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/information_buttons_widget.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/payment_total_widget.dart';
import 'package:lotuserp_comanda/page/pdv/widgets/product_widget.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/features/pdv_remove.dart';

import '../../controller/pdv_controller.dart';
import 'widgets/line_group_widget.dart';
import 'widgets/search_camp_widget.dart';

class PdvPage extends StatelessWidget {
  const PdvPage({super.key});

  @override
  Widget build(BuildContext context) {
    Dependencies.configController();
    final _pdvController = Dependencies.pdvController();
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
                Expanded(
                  child:
                      InformationButtonsWidget(controllerReactive: controller),
                )
              ]),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  //Constrói o resumo dos pedidos
                  Flexible(
                    flex: 6,
                    child: ResumeOrder(pdvController: _pdvController),
                  ),
                  const SizedBox(height: 10),
                  // Constrói o botão pagamento e o total
                  const Flexible(
                    flex: 1,
                    child: PaymentTotalWidget(),
                  ),
                ],
              ),
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
