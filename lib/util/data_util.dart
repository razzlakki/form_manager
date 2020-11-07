import 'Constants.dart';
import 'shared_pref_utility.dart';

class DataUtil {
  static DataUtil _instance;

  static DataUtil get() {
    if (_instance == null) _instance = DataUtil();
    return _instance;
  }

  getUserName({key, Function(String) username}) async {
    await SharedPrefUtility()
        .getStringToSharedPref(
            key != null && key != '' ? key : Constants.USERNAME)
        .then((value) {
      if (username != null) username(value);
    });
  }
}

enum CartHandleType { ADD, REMOVE }
