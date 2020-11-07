import 'package:intl/intl.dart';

class Utility {
  static roundProductPrice(String price) {
    return 'Rs ' +
        double.parse(price.replaceAll('₹', '').replaceAll(' ', ''))
            .toStringAsFixed(2);
  }

  static convertStringToDate(String mDate) {
    final DateFormat formatter = DateFormat('dd-MMM-yyyy');
    DateTime date = DateFormat('dd-MM-yyyy').parse(mDate);
    return formatter.format(date);
  }

  static getMonth(String mDate) {
    final DateFormat formatter = DateFormat('MMM - yyyy');
    DateTime date = DateFormat('dd-MM-yyyy').parse(mDate);
    return formatter.format(date);
  }

  static DateTime getDateTime(String dateTime, String format) {
    return DateFormat(format).parse(dateTime);
  }

  static double getAmountFloat(String amount) {
    return double.parse(amount.replaceAll('₹', '').trim());
  }
}
