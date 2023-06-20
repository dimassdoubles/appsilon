import 'package:intl/intl.dart';

class Utils {
  // - getCurrentEpoch
  // - formatToIdr
  // - epochToDisplayDate

  // formatToIdr
  static String formatToIdr(num? amount) {
    if (amount == null) {
      return "";
    }

    // Create an instance of NumberFormat for IDR currency
    NumberFormat currencyFormat =
        NumberFormat.currency(locale: 'id_IDR', symbol: 'Rp ');

    // Format the numeric value as IDR currency
    String formattedAmount = currencyFormat.format(amount);

    return formattedAmount;
  }

  // getCurrentEpoch
  static int getCurrentEpoch() {
    DateTime now = DateTime.now();
    int epoch = now.millisecondsSinceEpoch ~/ 1000;
    return epoch;
  }

  // epochToDisplayDate
  static String epochToDisplayDate(int epochTime) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(epochTime * 1000);

    String formattedDate = DateFormat('yyyy-MM-dd').format(date);

    return formattedDate;
  }
}
