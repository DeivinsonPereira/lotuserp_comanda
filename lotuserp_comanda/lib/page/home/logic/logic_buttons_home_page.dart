import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lotuserp_comanda/model/collection/produto.dart';
import 'package:lotuserp_comanda/model/collection/produto_grupo.dart';
import 'package:lotuserp_comanda/model/collection/usuario.dart';
import 'package:lotuserp_comanda/model/collection/usuario_logado.dart';
import 'package:lotuserp_comanda/page/common/custom_cherry.dart';
import 'package:lotuserp_comanda/page/home/logout_dialog.dart';
import 'package:lotuserp_comanda/page/order/order_page.dart';
import 'package:lotuserp_comanda/page/order/service/logic/logic_update_tables.dart';
import 'package:lotuserp_comanda/shared/repositories/isar_db/generic_repository_multiple.dart';
import 'package:lotuserp_comanda/shared/repositories/isar_db/generic_repository_single.dart';
import 'package:lotuserp_comanda/shared/repositories/isar_db/isar_service.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/methods/config/config_features.dart';
import 'package:lotuserp_comanda/utils/methods/config/config_get.dart';

class LogicButtonsHomePage {
  final _configController = Dependencies.configController();
  final _configGet = ConfigGet.instance;
  final _configFeatures = ConfigFeatures.instance;
  final _genericRepositoryMultiple = GenericRepositoryMultiple.instance;
  final _genericRepositorySingle = GenericRepositorySingle.instance;
  final _isarService = IsarService.instance;

  LogicButtonsHomePage._privateConstructor();

  static final LogicButtonsHomePage _instance =
      LogicButtonsHomePage._privateConstructor();

  static LogicButtonsHomePage get instance => _instance;

  Future<void> exitButtonLogic() async {
    Get.dialog(LogoutDialog(
      function: () async => SystemNavigator.pop(),
      title: 'Sair',
      text: 'Deseja sair do sistema?',
    ));
  }

  Future<void> confirmButton() async {
    usuario? user = _configGet.getUser();

    if (!await _isDataCharged()) {
      _handleError('Faça a carga geral nas configurações');
      return;
    }

    if (!_handleLogin()) {
      _handleError('Preencha todos os campos.');
      return;
    }

    if (user == null) {
      _handleError('Usuário não encontrado');
      return;
    }

    if (!_isValidPassword(user)) {
      _handleError('Senha Incorreta');
      return;
    }

    await _handleSuccess(user);
  }

  // Faz a lógica de sucesso
  Future<void> _handleSuccess(usuario user) async {
    final isar = await _isarService.db;
    _configFeatures.updateUsuarioLogado(user);

    if (_configController.isRemember.value) {
      _genericRepositorySingle.insert(
          _configController.usuarioLogado, isar.usuario_logados);
    }
    if (!_configController.isRemember.value) {
      _genericRepositoryMultiple.deleteAll(isar.usuario_logados);
      _configFeatures.clearCredentialsUser();
    }
    _configFeatures.clearPasswordUserController();
    await LogicUpdateTables().updateTables();
    Get.to(() => const OrderPage());
  }

  Future<bool> _isDataCharged() async {
    final isar = await _isarService.db;

    List<produto_grupo> groups =
        await _genericRepositoryMultiple.getAll(isar.produto_grupos);
    List<produto> products =
        await _genericRepositoryMultiple.getAll(isar.produtos);

    return groups.isNotEmpty && products.isNotEmpty;
  }

  // Faz o Toast de erro
  void _handleError(String message) {
    CustomCherryError(message: message).show(Get.context!);
  }

  // Verifica se a senha esta correta
  bool _isValidPassword(usuario user) {
    var bytes = utf8.encode(_configController.passwordUser.text);
    var encriptedPassword = md5.convert(bytes);

    return encriptedPassword.toString().toUpperCase() == user.senha;
  }

  // Verifica se o login e senha foram preenchidos
  bool _handleLogin() {
    return _configController.passwordUser.text.isNotEmpty &&
        _configController.loginUser.text.isNotEmpty;
  }
}
