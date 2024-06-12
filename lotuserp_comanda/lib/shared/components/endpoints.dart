import 'package:lotuserp_comanda/utils/dependencies.dart';

class Endpoints {
  static final _configController = Dependencies.configController();

  String ipSiagenet = 'http://siage.vistatecnologia.com.br/cgi-bin/siagenet/';

  String? serialNumber = '';

  String ipServer = _configController.ip.endsWith('/')
      ? _configController.ip
      : '${_configController.ip}/';

  int clientId = _configController.clientId;

  Endpoints({this.serialNumber});

  Future<String> endpointEmpresaValida() async {
    return '${ipSiagenet}licenca_ativar?ptipo=0&pchave=${_configController.licencaController.text}&pnserie=${serialNumber!}&pcnpj=${_configController.cnpjController.text}';
  }

  String endpointLicenceSituation() {
    return '${ipSiagenet}licenca_situacao?pchave=${_configController.licenca}&pcnpj=${_configController.cnpj}';
  }

  String endpointSearchClientId() {
    return '${ipServer}partner_clientes_cnpj?cpf_cnpj=${_configController.cnpj}';
  }

  String endpointSearchUsuario() {
    return '${ipServer}users_listar?id_partner_cliente=$clientId';
  }

  String endpointSearchTipoRecebimento() {
    return '${ipServer}tipos_recebe_listar?id_partner_cliente=$clientId';
  }

  String endpointSearchProducts() {
    return '${ipServer}produtos_listar?id_partner_cliente=$clientId';
  }

  String endpointSearchGrupos() {
    return '${ipServer}produtos_grupos?id_partner_cliente=$clientId';
  }

  String endpointSearchComplementos() {
    return '${ipServer}complementos_produtos_listar?id_partner_cliente=$clientId&id_produto=0';
  }

  String endpointUsuarios() {
    return '${ipServer}users_listar?id_partner_cliente=$clientId';
  }

  String endpointSearchImageLogo(String file) {
    return '${ipServer}getimagem?id_partner_cliente=1&categoria=DIV&file=$file&retorno=URL';
  }

  String endpointSearchImageGrupos(String file) {
    return '${ipServer}getimagem?id_partner_cliente=1&categoria=GRU&file=$file&retorno=URL';
  }

  String endpointSearchImageProducts(String file) {
    return '${ipServer}getimagem?id_partner_cliente=1&categoria=PRO&file=$file&retorno=URL';
  }

  String endpointListarMesas() {
    return '${ipServer}comandas_listar?id_partner_cliente=$clientId';
  }
}
