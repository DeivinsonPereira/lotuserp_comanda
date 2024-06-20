import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/controller/config_controller.dart';
import 'package:lotuserp_comanda/controller/load_data_controller.dart';
import 'package:lotuserp_comanda/model/charge_data.dart';
import 'package:lotuserp_comanda/page/common/custom_elevated_button.dart';
import 'package:lotuserp_comanda/page/common/custom_image.dart';
import 'package:lotuserp_comanda/page/config/components/dropbox_color.dart';
import 'package:lotuserp_comanda/utils/custom_colors.dart';
import 'package:lotuserp_comanda/utils/custom_text_style.dart';
import 'package:lotuserp_comanda/utils/methods/load_data/load_data_features.dart';

class ConfigMonitor extends StatelessWidget {
  const ConfigMonitor({super.key});

  @override
  Widget build(BuildContext context) {
    final _loadDataFeatures = LoadDataFeatures.instance;
    final double widthButton = Get.size.width * 0.3;
    final double heightButton = Get.size.height * 0.1;
    final _customImage = CustomImage.instance;

    Widget _buildCheckbox(ChargeData data, int index) {
      return GestureDetector(
        onTap: () {
          _loadDataFeatures.changeCheckbox(index);
        },
        child: Row(
          children: [
            Transform.scale(
              scale: 1.3,
              child: Checkbox(
                shape: const CircleBorder(),
                checkColor: Colors.white,
                activeColor: CustomColors.primaryColor,
                value: data.isMarked,
                onChanged: (value) {
                  _loadDataFeatures.changeCheckbox(index);
                },
              ),
            ),
            SizedBox(
              height: Get.size.height * 0.09,
            ),
            Text(
              data.name,
              style: CustomTextStyle.blackBoldText(30),
            ),
          ],
        ),
      );
    }

    Widget _buildTitleConfig() {
      return Align(
          alignment: Alignment.centerLeft,
          child:
              Text('Configuração', style: CustomTextStyle.blackBoldText(30)));
    }

    Widget _buildTitleChageData() {
      return Align(
          alignment: Alignment.centerLeft,
          child:
              Text('Carga de Dados', style: CustomTextStyle.blackBoldText(30)));
    }

    Widget _buildDropBoxColor() {
      return const Align(
          alignment: Alignment.centerLeft, child: DropboxColor());
    }

    Widget _buildItensLoad() {
      return GetBuilder<LoadDataController>(
        builder: (_) {
          return ListView.builder(
              itemCount: _.listCheckbox.length,
              itemBuilder: (context, index) {
                ChargeData data = _.listCheckbox[index];
                return _buildCheckbox(data, index);
              });
        },
      );
    }

    Widget _buildLogo() {
      return _customImage.getLogoPadrao(width: 150, height: 150);
    }

    Widget _buildChargeButton() {
      return SizedBox(
        width: widthButton,
        height: heightButton,
        child: CustomElevatedButton(
          colorButton: CustomColors.primaryColor,
          text: 'Carga de Dados',
          style: CustomTextStyle.whiteBoldText(24),
          rounded: 10,
          function: () async => await _loadDataFeatures.loadData(context),
        ),
      );
    }

    Widget _buildBackButton() {
      return SizedBox(
        width: widthButton,
        height: heightButton,
        child: CustomElevatedButton(
            colorButton: CustomColors.informationBox,
            text: 'Voltar',
            style: CustomTextStyle.whiteBoldText(24),
            rounded: 10,
            function: () {
              Get.back();
            }),
      );
    }

    Widget _buildContent() {
      return Row(
        children: [
          Expanded(
            child: SizedBox(
              height: Get.size.height,
              child: Column(
                children: [
                  _buildTitleConfig(),
                  SizedBox(height: Get.size.height * 0.05),
                  _buildDropBoxColor(),
                  SizedBox(height: Get.size.height * 0.10),
                  _buildTitleChageData(),
                  SizedBox(height: Get.size.height * 0.05),
                  Expanded(child: _buildItensLoad()),
                ],
              ),
            ),
          ),
          Column(children: [
            _buildLogo(),
            SizedBox(height: Get.size.height * 0.25),
            _buildChargeButton(),
            SizedBox(height: Get.size.height * 0.05),
            _buildBackButton(),
          ])
        ],
      );
    }

    Widget _buildBody() {
      return SizedBox(
        width: Get.size.width,
        height: Get.size.height,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: Get.size.width * 0.95,
            height: Get.size.height * 0.95,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: _buildContent(),
            ),
          ),
        ),
      );
    }

    return GetBuilder<ConfigController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: _.selectedColor.value.color,
          body: _buildBody(),
        );
      },
    );
  }
}
