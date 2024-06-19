// ignore_for_file: constant_identifier_names

enum StatusComandas {
  LIVRE(0),
  OCUPADA(1),
  CONTA(2),
  INATIVADA(3),
  RESERVADA(4),
  BLOQUEADA(5);

  final int value;

  const StatusComandas(this.value);
}

extension ComandasExtension on int {
  int get value => this;
  static StatusComandas fromValue(int value) {
    switch (value) {
      case 0:
        return StatusComandas.LIVRE;
      case 1:
        return StatusComandas.OCUPADA;
      case 2:
        return StatusComandas.CONTA;
      case 3:
        return StatusComandas.INATIVADA;
      case 4:
        return StatusComandas.RESERVADA;
      case 5:
        return StatusComandas.BLOQUEADA;
      default:
        return StatusComandas.LIVRE;
    }
  }
}
