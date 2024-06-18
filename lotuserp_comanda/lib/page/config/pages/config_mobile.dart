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

class ConfigMobile extends StatelessWidget {
  const ConfigMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final _loadDataFeatures = LoadDataFeatures.instance;
    final double widthButton = Get.size.width * 0.3;
    final double heightButton = Get.size.height * 0.1;

    Widget _buildCheckbox(ChargeData data, int index) {
      return GestureDetector(
        onTap: () {
          _loadDataFeatures.changeCheckbox(index);
        },
        child: Row(
          children: [
            Transform.scale(
              scale: 1,
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
              height: Get.size.height * 0.02,
            ),
            Text(
              data.name,
              style: CustomTextStyle.blackBoldText(18),
            ),
          ],
        ),
      );
    }

    Widget _buildTitleConfig() {
      return Align(
          alignment: Alignment.centerLeft,
          child:
              Text('Configuração', style: CustomTextStyle.blackBoldText(24)));
    }

    Widget _buildTitleChageData() {
      return Align(
          alignment: Alignment.centerLeft,
          child:
              Text('Carga de Dados', style: CustomTextStyle.blackBoldText(24)));
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
      return CustomImage().getLogoPadrao(width: 100, height: 100);
    }

    Widget _buildChargeButton() {
      return SizedBox(
        height: heightButton,
        child: CustomElevatedButton(
          colorButton: CustomColors.primaryColor,
          text: 'Carga de Dados',
          style: CustomTextStyle.whiteBoldText(18),
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
            style: CustomTextStyle.whiteBoldText(18),
            rounded: 10,
            function: () {
              Get.back();
            }),
      );
    }

    Widget _buildContent() {
      return SizedBox(
        height: Get.size.height,
        child: Column(
          children: [
            _buildLogo(),
            SizedBox(height: Get.size.height * 0.02),
            _buildTitleConfig(),
            SizedBox(height: Get.size.height * 0.02),
            _buildDropBoxColor(),
            SizedBox(height: Get.size.height * 0.02),
            _buildTitleChageData(),
            Expanded(child: _buildItensLoad()),
            SizedBox(height: Get.size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBackButton(),
                SizedBox(width: Get.size.width * 0.02),
                _buildChargeButton(),
              ],
            ),
          ],
        ),
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
