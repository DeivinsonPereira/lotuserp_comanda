// ignore_for_file: use_build_context_synchronously
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:lotuserp_comanda/model/charge_data.dart';
import 'package:lotuserp_comanda/model/collection/complemento.dart';
import 'package:lotuserp_comanda/model/collection/empresa.dart';
import 'package:lotuserp_comanda/model/collection/mesa_listada.dart';
import 'package:lotuserp_comanda/model/collection/produto.dart';
import 'package:lotuserp_comanda/model/collection/produto_grupo.dart';
import 'package:lotuserp_comanda/model/collection/usuario.dart';
import 'package:lotuserp_comanda/page/common/custom_cherry.dart';
import 'package:lotuserp_comanda/page/common/loading_screen.dart';
import 'package:lotuserp_comanda/shared/components/endpoints.dart';
import 'package:lotuserp_comanda/shared/repositories/isar_db/generic_repository_multiple.dart';
import 'package:lotuserp_comanda/shared/repositories/isar_db/generic_repository_single.dart';
import 'package:lotuserp_comanda/shared/repositories/isar_db/isar_service.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/methods/config/config_features.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/pdv_features.dart';

class LoadDataFeatures {
  static final _loadDataController = Dependencies.loadDataController();
  final _pdvFeatures = PdvFeatures.instance;
  final _configFeatures = ConfigFeatures.instance;
  final _genericRepositoryMultiple = GenericRepositoryMultiple.instance;
  final _genericRepositorySingle = GenericRepositorySingle.instance;
  bool success = true;

  LoadDataFeatures._privateConstructor();
  final _isarService = IsarService.instance;
  static final LoadDataFeatures _instance =
      LoadDataFeatures._privateConstructor();

  static LoadDataFeatures get instance => _instance;

  List<ChargeData> listLoadData = _loadDataController.listCheckbox;

  // Atualiza o checkbox selecionado
  void changeCheckbox(int index) {
    if (listLoadData[index].isMarked == false) {
      listLoadData[index].isMarked = true;
      _loadDataController.update();
      return;
    }
    listLoadData[index].isMarked = false;

    _loadDataController.update();
  }

  // Carrega os dados
  Future<void> loadData(BuildContext context) async {
    Get.dialog(const LoadingScreen());
    success = true;
    try {
      if (!success) return;
      if (listLoadData[0].isMarked == true) {
        try {
          await _loadFirstCheckbox(context);
        } catch (e) {
          _handleError(context, 'da empresa');
          return;
        }
      }
      if (listLoadData[1].isMarked == true) {
        if (!success) return;
        try {
          await _loadSecondCheckbox(context);
        } catch (e) {
          _handleError(context, 'dos grupos e produtos!');
          return;
        }
      }

      if (listLoadData[2].isMarked == true) {
        if (!success) return;
        try {
          await _loadThirdCheckbox(context);
        } catch (e) {
          _handleError(context, 'dos Usuarios!');
          return;
        }
      }

      if (listLoadData[3].isMarked == true) {
        if (!success) return;
        try {
          await _loadFourthCheckbox(context);
        } catch (e) {
          _handleError(context, 'das imagens dos Grupos!');
          return;
        }
      }
      if (listLoadData[4].isMarked == true) {
        if (!success) return;
        try {
          await _loadFifthCheckbox(context);
        } catch (e) {
          _handleError(context, 'das imagens dos Produtos!!');
          return;
        }
      }

      if (success) {
        const CustomCherrySuccess(message: 'Dados carregados com sucesso!')
            .show(context);
      }
    } catch (e) {
      _handleError(context, '');
    } finally {
      Get.back();
      clearAllCheckbox();
    }
  }

  // Faz a carga dos dados do checkbox 1
  Future<void> _loadFirstCheckbox(BuildContext context) async {
    final isar = await _isarService.db;

    await _genericRepositorySingle.search(
        Endpoints().endpointSearchClientId(),
        (element) => _handleSuccessSingle(
            _configFeatures.updateEmpresa, element, isar.empresas),
        (element) =>
            _handleError(context, 'Erro ao buscar os dados da empresa!'),
        (element) => empresa.fromMap(element));
    empresa? empresaSelected =
        await _genericRepositorySingle.get(isar.empresas);

    if (empresaSelected == null) return;

    Future.delayed(const Duration(milliseconds: 100), () async {
      _configFeatures.updateEmpresa(empresaSelected);
      _configFeatures.updateClientIdWithParam(empresaSelected.id_cliente!);
    });
  }

  // Faz a carga dos dados do checkbox 3
  Future<void> _loadSecondCheckbox(BuildContext context) async {
    final isar = await _isarService.db;

    await _genericRepositoryMultiple.search<produto>(
        Endpoints().endpointSearchProducts(),
        (element) => _handleSuccessMultiple<produto>(
            _pdvFeatures.updateProdutos, element, isar.produtos),
        (element) => _handleError(context, 'Erro ao buscar os produtos!'),
        (element) => produto.fromMap(element));
    await _genericRepositoryMultiple.search<produto_grupo>(
        Endpoints().endpointSearchGrupos(),
        (element) => _handleSuccessMultiple<produto_grupo>(
            _pdvFeatures.updateGrupos, element, isar.produto_grupos),
        (element) => _handleError(context, 'Erro ao buscar os grupos'),
        (element) => produto_grupo.fromMap(element));
    await _genericRepositoryMultiple.search<complemento>(
      Endpoints().endpointSearchComplementos(),
      (value) => _handleSuccessMultiple<complemento>(
          _pdvFeatures.setComplements, value, isar.complementos),
      (value) => _handleError(context, 'Erro ao buscar os complementos!'),
      (value) => complemento.fromMap(value),
    );

    await _genericRepositoryMultiple.getAll(isar.mesa_listadas);
  }

  // Faz a carga dos dados do checkbox 4
  Future<void> _loadThirdCheckbox(BuildContext context) async {
    final isar = await _isarService.db;

    await _genericRepositoryMultiple.search<usuario>(
        Endpoints().endpointSearchUsuario(),
        (element) => _handleSuccessMultiple<usuario>(
            _configFeatures.updateUser, element, isar.usuarios),
        (element) => _handleError(context, 'Erro ao buscar os usuarios!'),
        (element) => usuario.fromMap(element));
  }

  // Faz a carga dos dados do checkbox 5
  Future<void> _loadFourthCheckbox(BuildContext context) async {
    await _pdvFeatures.downloadImageProdutos();
    Future.delayed(const Duration(seconds: 2), () async {
      await _pdvFeatures.updateImagePathProduto();
    });
  }

  Future<void> _loadFifthCheckbox(BuildContext context) async {
    await _pdvFeatures.downloadImageGrupos();
    Future.delayed(const Duration(seconds: 2), () async {
      await _pdvFeatures.updateImagePathGroup();
    });
  }

  // Funções de tratamento para sucesso na carga dos dados (unicos)
  void _handleSuccessSingle<T>(
      Function function, T element, IsarCollection<dynamic> collection) {
    _genericRepositorySingle.insert(element, collection);
    function(element);

    return;
  }

  // Limpa todos os campos dos checkbox
  void clearAllCheckbox() {
    for (var element in _loadDataController.listCheckbox) {
      element.isMarked = false;
    }
    _loadDataController.update();
  }

  // Funções de tratamento para sucesso na carga dos dados (Listas)
  void _handleSuccessMultiple<T>(
      Function function, List<T> element, IsarCollection<dynamic> collection) {
    _genericRepositoryMultiple.insert(element, collection);
    function(element);
    return;
  }

  // Funções de tratamento para erro na carga dos dados
  void _handleError(BuildContext context, String message) {
    CustomCherryError(message: 'Erro ao carregar os dados $message!')
        .show(context);
    success = false;
    return;
  }
}
