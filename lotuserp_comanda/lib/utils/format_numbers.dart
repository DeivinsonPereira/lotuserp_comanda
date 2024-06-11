import 'package:intl/intl.dart';

class FormatNumbers {
  static String formatNumbertoString(double? number) {
    return NumberFormat('###,###,###,##0.00', 'pt_BR').format(number);
  }

  static double formatStringToDouble(String number) {
    return double.parse(number.replaceAll('.', '').replaceAll(',', '.'));
  }

  static int formatdoubleToInt(double number) {
    return number.toInt();
  }

  static String intToString(int number) {
    if (number < 10) {
      return number.toString().padLeft(1, '0');
    }
    return number.toString();
  }

  static int stringToInt(String value) {
    if (value.isEmpty || value == '') return 0;

    return int.parse(value.replaceAll('.', '').replaceAll(',', ''));
  }
}
