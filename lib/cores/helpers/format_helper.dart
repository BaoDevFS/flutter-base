import 'package:easy_localization/easy_localization.dart';

class FormatHelper {
  static const String vietnam = "đ";

  static String formatCurrency(num value, {String name = vietnam, int decimalDigits = 0}) {
    final format = NumberFormat.currency(name: name, decimalDigits: decimalDigits);
    final currency = format.format(value.abs());
    final firstNumber = currency.indexOf(RegExp('[0-9]'));

    return currency.replaceFirst(currency[firstNumber], ' ${value < 0 ? '-' : ''}${currency[firstNumber]}');
  }

  static String formatNumber(num value, {String pattern = "#,###.##"}) {
    final formatter = NumberFormat(pattern);
    return formatter.format(value);
  }

  static String formatDateTime(DateTime dateTime, {String pattern = "E, d MMM yyyy - HH:mm", String? locale}) {
    final dateFormatter = DateFormat(pattern, locale);
    return dateFormatter.format(dateTime);
  }
}
