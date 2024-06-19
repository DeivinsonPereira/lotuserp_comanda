import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:lotuserp_comanda/page/choose_table/logic/logic_navigation_to_pdv.dart';
import 'package:lotuserp_comanda/page/common/custom_cherry.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/methods/order/order_features.dart';

class CodeScannerService {
  final _orderController = Dependencies.orderController();
  final _orderFeatures = OrderFeatures.instance;
  final _logger = Logger();

  CodeScannerService._privateConstructor();

  static final CodeScannerService _instance =
      CodeScannerService._privateConstructor();

  static CodeScannerService get instance => _instance;

  Future<void> readBarCode({bool isQrCode = false}) async {
    try {
      ScanMode scanMode = isQrCode ? ScanMode.QR : ScanMode.BARCODE;

      String code = await FlutterBarcodeScanner.scanBarcode(
        '#FFFFFF',
        'Cancelar',
        true,
        scanMode,
      );

      if (code == '-1') return;

      _orderController.commandNumberController.text = code;
      LogicNavigationToPdv.instance.goToPdv();
      _orderController.update();
    } catch (e) {
      _logger.e('Erro: $e');
      const CustomCherryError(message: 'Erro ao fazer a leitura')
          .show(Get.context!);
      _orderFeatures.clearCommandNumberController();
    }
  }
}
