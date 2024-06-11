import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lotuserp_comanda/model/collection/image_path_group.dart';
import 'package:lotuserp_comanda/model/collection/image_path_product.dart';
import 'package:lotuserp_comanda/model/collection/produto.dart';
import 'package:lotuserp_comanda/model/collection/produto_grupo.dart';

import '../../utils/dependencies.dart';

class CustomImage {
  var _configController = Dependencies.configController();
  var _pdvController = Dependencies.pdvController();

  Widget getLogoPadrao({double? width, double? height}) {
    return _formatLogo(_configController.imagePathLogoPadrao.path_image,
        width: width, height: height);
  }

  Widget getLogoBranca({double? width, double? height}) {
    return _formatLogo(_configController.imagePathLogoBranca.path_image,
        width: width, height: height);
  }

  Widget getLogoCliente({double? width, double? height}) {
    return _formatLogo(_configController.imagePathLogoCliente.path_image,
        width: width, height: height);
  }

  Widget getImageProduct(produto produtoSelected,
      {double? width, double? height}) {
    image_path_product? file = _filterList<produto, image_path_product>(
        _pdvController.imagePathProduct, produtoSelected);
    return _formatLogo(file?.path_image, width: width, height: height);
  }

  Widget getImageGroup(produto_grupo grupoSelected,
      {double? width, double? height}) {
    image_path_group? file = _filterList<produto_grupo, image_path_group>(
        _pdvController.imagePathGroup, grupoSelected);
    return _formatLogo(file?.path_image, width: width, height: height);
  }

  R? _filterList<T extends FileImagemExtension,
      R extends image_path_product_mixin>(List<R> list, T itemSelected) {
    return list
        .where((element) => element.file_imagem == itemSelected.file_imagem)
        .firstOrNull;
  }

  Widget _formatLogo(String? pathImage, {double? width, double? height}) {
    if (pathImage == null || pathImage.isEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          'assets/images/semimagem.png',
          width: width,
          height: height,
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Image.file(
        File(pathImage),
        width: width,
        height: height,
      ),
    );
  }
}
