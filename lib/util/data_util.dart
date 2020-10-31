import 'Constants.dart';
import 'shared_pref_utility.dart';

class DataUtil {
  static DataUtil _instance;

  static DataUtil get() {
    if (_instance == null) _instance = DataUtil();
    return _instance;
  }

  getCustomerId({Function(String) customer}) async {
    await SharedPrefUtility()
        .getStringToSharedPref(Constants.CUSTOMER_ID)
        .then((value) {
      if (customer != null) customer(value);
    });
  }
}

enum CartHandleType { ADD, REMOVE }
