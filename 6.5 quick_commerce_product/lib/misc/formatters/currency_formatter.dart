import 'package:intl/intl.dart';

class CurrencyFormatter {
  final NumberFormat _instance;

  CurrencyFormatter({
    String currency = '€',
    int decimalDigits = 2,
    String? locale,
  }) : _instance = NumberFormat.simpleCurrency(
         locale: locale,
         name: currency,
         decimalDigits: decimalDigits,
       );

  String format(num amount) => _instance.format(amount);
}
