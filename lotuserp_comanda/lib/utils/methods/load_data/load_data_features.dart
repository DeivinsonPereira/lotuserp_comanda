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
import 'package:lotuserp_comanda/shared/repositories/http/download/delete_images_db.dart';
import 'package:lotuserp_comanda/shared/repositories/isar_db/generic_repository_multiple.dart';
import 'package:lotuserp_comanda/shared/repositories/isar_db/generic_repository_single.dart';
import 'package:lotuserp_comanda/shared/repositories/isar_db/isar_service.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/methods/config/config_features.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/features/pdv_update.dart';

class LoadDataFeatures {
  static final _loadDataController = Dependencies.loadDataController();
  final _pdvFeatures = PdvUpdate.instance;
  final _configFeatures = ConfigFeatures.instance;
  final _genericRepositoryMultiple = GenericRepositoryMultiple.instance;
  final _genericRepositorySingle = GenericRepositorySingle.instance;
  final _loadController = Dependencies.loadDataController();
  final _pdvController = Dependencies.pdvController();
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
    try {
      if (listLoadData[0].isMarked == true) {
        try {
          await _loadFirstCheckbox(context);
        } catch (e) {
          _handleError(context, 'da empresa');
          return;
        }
      }
      if (listLoadData[1].isMarked == true) {
        try {
          await _loadSecondCheckbox(context);
        } catch (e) {
          _handleError(context, 'dos grupos e produtos!');
          return;
        }
      }

      if (listLoadData[2].isMarked == true) {
        try {
          await _loadThirdCheckbox(context);
        } catch (e) {
          _handleError(context, 'dos Usuarios!');
          return;
        }
      }

      if (listLoadData[3].isMarked == true) {
        try {
          await _loadFourthCheckbox(context);
        } catch (e) {
          _handleError(context, 'das imagens dos Grupos!');
          return;
        }
      }
      if (listLoadData[4].isMarked == true) {
        try {
          await _loadFifthCheckbox(context);
        } catch (e) {
          _handleError(context, 'das imagens dos Produtos!!');
          return;
        }
      }

      if (listLoadData[5].isMarked == true) {
        try {
          for (var element in _pdvController.imagePathGroup) {
            await DeleteImagesDb.deleteFile(element.path_image ?? '');
          }
          for (var element in _pdvController.imagePathProduct) {
            await DeleteImagesDb.deleteFile(element.path_image ?? '');
          }

          clearAllCheckbox();

          const CustomCherrySuccess(
            message: 'Imagens apagadas com sucesso!',
          ).show(context);
          return;
        } catch (e) {
          return;
        }
      }

      if (_loadController.isDownloadSuccess) {
        const CustomCherrySuccess(message: 'Dados carregados com sucesso!')
            .show(context);
      }

      if (!_loadController.isDownloadSuccess) {
        _handleError(context, '');
      }
    } catch (e) {
      _handleError(context, '');
    } finally {
      Get.back();
      clearAllCheckbox();
      _loadController.isDownloadSuccess = true;
    }
  }

  // Faz a carga dos dados do checkbox 1
  Future<void> _loadFirstCheckbox(BuildContext context) async {
    final isar = await _isarService.db;

    await _genericRepositorySingle.search(
        Endpoints().searchClientId(),
        (element) => _handleSuccessSingle(
            _configFeatures.updateEmpresa, element, isar.empresas),
        (element) => _loadController.isDownloadSuccess = false,
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
        Endpoints().searchProducts(),
        (element) => _handleSuccessMultiple<produto>(
            _pdvFeatures.updateProdutos, element, isar.produtos),
        (element) => _loadController.isDownloadSuccess = false,
        (element) => produto.fromMap(element));
    await _genericRepositoryMultiple.search<produto_grupo>(
        Endpoints().searchGrupos(),
        (element) => _handleSuccessMultiple<produto_grupo>(
            _pdvFeatures.updateGrupos, element, isar.produto_grupos),
        (element) => _loadController.isDownloadSuccess = false,
        (element) => produto_grupo.fromMap(element));
    await _genericRepositoryMultiple.search<complemento>(
      Endpoints().searchComplementos(),
      (value) => _handleSuccessMultiple<complemento>(
          _pdvFeatures.setComplements, value, isar.complementos),
      (value) => _loadController.isDownloadSuccess = false,
      (value) => complemento.fromMap(value),
    );

    await _genericRepositoryMultiple.getAll(isar.mesa_listadas);
  }

  // Faz a carga dos dados do checkbox 4
  Future<void> _loadThirdCheckbox(BuildContext context) async {
    final isar = await _isarService.db;

    await _genericRepositoryMultiple.search<usuario>(
        Endpoints().searchUsuario(),
        (element) => _handleSuccessMultiple<usuario>(
            _configFeatures.updateUser, element, isar.usuarios),
        (element) => _loadController.isDownloadSuccess = false,
        (element) => usuario.fromMap(element));
  }

  Future<void> _loadFourthCheckbox(BuildContext context) async {
    await _pdvFeatures.downloadImageGrupos();
    Future.delayed(const Duration(seconds: 2), () async {
      await _pdvFeatures.updateImagePathGroup();
    });
  }

  // Faz a carga dos dados do checkbox 5
  Future<void> _loadFifthCheckbox(BuildContext context) async {
    await _pdvFeatures.downloadImageProdutos();
    Future.delayed(const Duration(seconds: 2), () async {
      await _pdvFeatures.updateImagePathProduto();
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
    return;
  }
}
