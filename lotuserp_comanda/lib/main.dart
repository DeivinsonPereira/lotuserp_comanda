import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:lotuserp_comanda/core/app_widget.dart';
import 'package:lotuserp_comanda/model/collection/complemento.dart';
import 'package:lotuserp_comanda/model/collection/empresa.dart';
import 'package:lotuserp_comanda/model/collection/empresa_valida.dart';
import 'package:lotuserp_comanda/model/collection/image_path_group.dart';
import 'package:lotuserp_comanda/model/collection/image_path_logo.dart';
import 'package:lotuserp_comanda/model/collection/image_path_product.dart';
import 'package:lotuserp_comanda/model/collection/initial_config.dart';
import 'package:lotuserp_comanda/model/collection/mesa_listada.dart';
import 'package:lotuserp_comanda/model/collection/password_config.dart';
import 'package:lotuserp_comanda/model/collection/produto.dart';
import 'package:lotuserp_comanda/model/collection/produto_grupo.dart';
import 'package:lotuserp_comanda/model/collection/usuario.dart';
import 'package:lotuserp_comanda/model/collection/usuario_logado.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/methods/config/config_features.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  // só deixa inicializar o run depois dos comandos async abaixo estiverem rodando.
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationSupportDirectory();
  //abre o banco de dados e as tabelas
  await Isar.open(
    [
      Password_configSchema,
      Initial_configSchema,
      Empresa_validaSchema,
      EmpresaSchema,
      UsuarioSchema,
      Usuario_logadoSchema,
      ProdutoSchema,
      Produto_grupoSchema,
      ComplementoSchema,
      Image_path_groupSchema,
      Image_path_productSchema,
      Image_path_logoSchema,
      Mesa_listadaSchema,
    ],
    directory: dir.path,
    inspector: true,
  );

  

  Dependencies.configController();
  final configFeatures = ConfigFeatures.instance;
  await configFeatures.loadConfigOnInit();
  await configFeatures.updateImagesLogo();

  Future.delayed(const Duration(milliseconds: 100), () async {
    runApp(
      const AppWidget(),
    );
  });
}
