class AmountUtil {
  AmountUtil._();
  static String formatAmount(String amount, {bool? withMinus}) {
    bool isNegative = amount.startsWith('-');
    amount = amount.replaceAll('-', '');

    final textParts = amount.replaceAll(',', '').split('.');
    final chars = textParts[0].split('');

    String newString = '';
    int commaCount = 0;
    for (int i = chars.length - 1; i >= 0; i--) {
      newString = chars[i] + newString;
      commaCount++;
      if (commaCount == 3 && i != 0) {
        newString = ",$newString";
        commaCount = 0;
      }
    }

    String suffix = ".00";
    if (textParts.length > 1) {
      String d = textParts[1];
      d = d.length >= 2 ? d.substring(0, 2) : d.padRight(2, '0');
      suffix = ".$d";
    }

    if (newString.isEmpty) {
      newString = "0";
    }

    if (isNegative && (withMinus ?? false)) {
      newString = "-$newString";
    }

    return newString + suffix;
  }

  static String formatDoubleAmount(double amount, {bool? withMinus}) =>
      formatAmount(amount.toString(), withMinus: withMinus);

  static String formattedParts(double amount, {bool decimals = false}) {
    final formattedParts = formatDoubleAmount(amount).split('.');
    return decimals ? formattedParts[1] : formattedParts[0];
  }

  static double formatValidDouble(String amount) {
    return double.tryParse(amount.replaceAll(',', '')) ?? 0;
  }
}
