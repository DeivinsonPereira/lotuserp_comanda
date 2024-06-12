// ignore_for_file: constant_identifier_names

enum Comandas {
  LIVRE(0),
  OCUPADA(1),
  CONTA(2),
  INATIVADA(3),
  RESERVADA(4),
  BLOQUEADA(5);

  final int value;

  const Comandas(this.value);
}

extension ComandasExtension on int {
  int get value => this;
  static Comandas fromValue(int value) {
    switch (value) {
      case 0:
        return Comandas.LIVRE;
      case 1:
        return Comandas.OCUPADA;
      case 2:
        return Comandas.CONTA;
      case 3:
        return Comandas.INATIVADA;
      case 4:
        return Comandas.RESERVADA;
      case 5:
        return Comandas.BLOQUEADA;
      default:
        return Comandas.LIVRE;
    }
  }
}
