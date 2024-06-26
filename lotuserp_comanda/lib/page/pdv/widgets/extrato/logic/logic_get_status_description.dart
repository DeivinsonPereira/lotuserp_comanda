
class LogicGetStatusDescription {
  static String getStatusDescription(int statusComandas) {
    switch (statusComandas) {
      case 0:
        return 'Livre';
      case 1:
        return 'Ocupada';
      case 2:
        return 'Conta';
      case 3:
        return 'Inativada';
      case 4:
        return 'Reservada';
      case 5:
        return 'Bloqueada';
      default:
        return 'Indefinido';
    }
  }
}
