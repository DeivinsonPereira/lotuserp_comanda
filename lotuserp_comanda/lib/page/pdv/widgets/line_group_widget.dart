// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/custom_colors.dart';
import '../../../utils/dependencies.dart';
import '../../../utils/methods/pdv/features/pdv_update.dart';
import '../custom/get_images.dart';

class LineGroup extends StatelessWidget {
  const LineGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final _pdvController = Dependencies.pdvController();
    final _pdvFeatures = PdvUpdate.instance;

    // Contrói a imagem do grupo
    Widget _buildImageGroup(int index) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: getImageGroup(
            _pdvController.imagePathGroup[index].path_image ?? ''),
      );
    }

    // Constrói o nome no grupo
    Widget _buildNameGroup(dynamic selectedGroup, int index) {
      return Obx(() => Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                  color: _pdvController.groupSelected.value == index
                      ? CustomColors.primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(3),
              child: Text(
                _pdvController.allGroups[index].grupo_descricao ?? '',
                style: TextStyle(
                  fontSize: 12,
                  color: _pdvController.groupSelected.value == index
                      ? Colors.white
                      : Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ));
    }

    // Contrói o card do grupo
    Widget _buildCardGroup(int index, dynamic selectedGroup) {
      return GestureDetector(
        onTap: () async {
          _pdvFeatures.updateIdGroupSelected(index);
          _pdvFeatures.updateFilteredProdutos(index, selectedGroup);
        },
        child: SizedBox(
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildImageGroup(index),
              _buildNameGroup(selectedGroup, index),
            ],
          ),
        ),
      );
    }

    // Constrói o grupo
    Widget _buildGroup() {
      return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _pdvController.allGroups.length,
          itemBuilder: (context, index) {
            var selectedGroup = _pdvController.allGroups[index];
            return _buildCardGroup(index, selectedGroup);
          });
    }

    // Constrói a linha do grupo
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: Get.size.height * 0.15,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(child: _buildGroup()),
            ],
          ),
        ),
      ),
    );
  }
}
