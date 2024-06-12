// ignore_for_file: public_member_api_docs, sort_constructors_first, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';

import '../../controller/pdv_controller.dart';
import 'service/logic/logic_back_button.dart';
import 'widgets/line_group_widget.dart';
import 'widgets/search_camp_widget.dart';

class PdvPage extends StatelessWidget {
  const PdvPage({super.key});

  @override
  Widget build(BuildContext context) {
    Dependencies.configController();

    // linha de pesquisa e voltar
    Widget lineSearchAndBackButton(PdvController controller) {
      return Row(
        children: [
          // Icone de voltar
          IconButton(
            onPressed: () async {
              await LogicBackButton().back(context: context);
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
                    child: LogicGetResumeType().getResume(controller),
                  ),
                  const SizedBox(height: 10),
                  // Constrói o botão pagamento e o total
                  Flexible(
                    flex: 1,
                    child: PaymentTotalWidget(controller: controller),
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
          body: RawKeyboardListener(
            focusNode: _focusNode,
            onKey: checkoutController.handleKey,
            child: GestureDetector(
              onTap: () {
                _focusNode.requestFocus();
              },
              child: conteudo(controller),
            ),
          ),
        );
      },
    );
  }
}
