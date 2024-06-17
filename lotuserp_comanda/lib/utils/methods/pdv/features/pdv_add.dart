import 'package:lotuserp_comanda/model/collection/complemento.dart';
import 'package:lotuserp_comanda/model/collection/mesa_listada.dart';
import 'package:lotuserp_comanda/model/collection/produto.dart';
import 'package:lotuserp_comanda/model/comanda_selecionada.dart';
import 'package:lotuserp_comanda/model/complement_cart_shopping.dart';
import 'package:lotuserp_comanda/model/complemento_model.dart';
import 'package:lotuserp_comanda/model/item_cart_shopping.dart';
import 'package:lotuserp_comanda/utils/dependencies.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/features/pdv_common_methods.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/features/pdv_remove.dart';
import 'package:lotuserp_comanda/utils/methods/pdv/get/pdv_get.dart';

class PdvAdd {
  final _pdvController = Dependencies.pdvController();
  final _orderController = Dependencies.orderController();
  final _pdvCommonMethods = PdvCommonMethods.instance;
  final _pdvRemove = PdvRemove.instance;
  final _pdvGet = PdvGet.instance;

  PdvAdd._privateConstructor();

  static final PdvAdd _instance = PdvAdd._privateConstructor();

  static PdvAdd get instance => _instance;

  // Adiciona produtos no carrinho de compras
  void addCartShoppingProduct(produto produtoSelected, {double weight = 0}) {
    if (produtoSelected.produto_pesagem == 1) {
      _pdvController.cartShopping.add(
        ItemCartShopping(
            produtoSelected: produtoSelected,
            quantidade: weight,
            complementoSelected: [],
            informationComplement: ''),
      );

      _pdvController.update();
      _pdvController.cartShopping.refresh();
      return;
    }

    ItemCartShopping? produtoExists = _hasEqualsProduct(produtoSelected);

    if (produtoExists == null) {
      _pdvController.cartShopping.add(
        ItemCartShopping(
            produtoSelected: produtoSelected,
            quantidade: 1,
            complementoSelected: [],
            informationComplement: ''),
      );

      _pdvController.update();
      _pdvController.cartShopping.refresh();
      return;
    }

    produtoExists.quantidade++;
    _pdvController.update();
    _pdvController.cartShopping.refresh();
  }

  // Adiciona produtos no orderTicketList
  void addCartShoppingProductFromOrderTicket(ItemCartShopping cartShopping) {
    cartShopping.quantidade++;

    _pdvCommonMethods.updateOrderTiketList();
    return;
  }

  void addComplementToListSelected(complemento complemento) {
    ComplementCartShopping? complement =
        _pdvGet.hasEqualsComplement(complemento);

    if (complement == null) {
      ComplementCartShopping complementoModel = ComplementCartShopping(
          complementos: ComplementoModel.fromMap(complemento.toMap()),
          quantity: 1);

      _pdvController.listComplementSelected.add(complementoModel);
      _pdvController.update();
      return;
    }

    complement.quantity++;

    _pdvController.update();
  }

  void addProductWithComplementToCartShopping(produto produtoSelected) {
    List<ComplementCartShopping> clonedComplements =
        _pdvController.listComplementSelected
            .map((complement) => ComplementCartShopping(
                  complementos:
                      ComplementoModel.fromMap(complement.complementos.toMap()),
                  quantity: complement.quantity,
                ))
            .toList();

    String informationComplement = _pdvController.complementoController.text;

    ItemCartShopping itemCartShopping = ItemCartShopping(
      produtoSelected: produtoSelected,
      quantidade: 1,
      complementoSelected: clonedComplements,
      informationComplement: informationComplement,
    );

    _pdvController.cartShopping.add(itemCartShopping);
    _pdvController.update();
    _pdvRemove.clearAllComplementSelected();
    _pdvRemove.clearComplementoController();
  }

  void addOrderToOrderTicketsList() {
    ComandaSelecionada? orderTable = _orderTableExists();

    // caso já exista o algum pedido para a mesa selecionada, deve ser apenas acrescentado o novo pedido
    if (orderTable != null) {
      _addNewOrderToExistingOrder(orderTable);
      return;
    }
    _addNewOrderToOrderTicketsList();
  }

  void _addNewOrderToExistingOrder(ComandaSelecionada orderTable) {
    List<ItemCartShopping> clonedList = _pdvController.cartShopping
        .map((item) => ItemCartShopping(
              produtoSelected: item
                  .produtoSelected, // Supondo que produtoSelected seja imutável
              quantidade: item.quantidade,
              complementoSelected: item.complementoSelected
                  .map((complement) => ComplementCartShopping(
                        complementos: ComplementoModel.fromMap(
                            complement.complementos.toMap()),
                        quantity: complement.quantity,
                      ))
                  .toList(),
              informationComplement: item.informationComplement,
            ))
        .toList();

    orderTable.listItemsCartShopping.addAll(clonedList);
  }

  void _addNewOrderToOrderTicketsList() {
    List<ItemCartShopping> clonedList = _pdvController.cartShopping
        .map((item) => ItemCartShopping(
              produtoSelected: item
                  .produtoSelected, // Supondo que produtoSelected seja imutável
              quantidade: item.quantidade,
              complementoSelected: item.complementoSelected
                  .map((complement) => ComplementCartShopping(
                        complementos: ComplementoModel.fromMap(
                            complement.complementos.toMap()),
                        quantity: complement.quantity,
                      ))
                  .toList(),
              informationComplement: item.informationComplement,
            ))
        .toList();
    mesa_listada table = _orderController.tableSelected.value;

    ComandaSelecionada comandaSelecionada = ComandaSelecionada(
      comandaSelecionada: table,
      listItemsCartShopping: clonedList,
    );

    _pdvController.orderTicketsList.add(comandaSelecionada);
  }

  ComandaSelecionada? _orderTableExists() {
    return _pdvController.orderTicketsList
        .where((element) =>
            element.comandaSelecionada.id_comanda ==
            _orderController.tableSelected.value.id_comanda)
        .firstOrNull;
  }

  // Verifica se o produto existe e retorna o index dele no carrinho
  ItemCartShopping? _hasEqualsProduct(produto productSelected) {
    return _pdvController.cartShopping
        .where((element) =>
            element.produtoSelected.id_produto == productSelected.id_produto)
        .firstOrNull;
  }
}
