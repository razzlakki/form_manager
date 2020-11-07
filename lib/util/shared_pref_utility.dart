import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtility {
  setStringToSharedPref(String key, String val) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(key, val);
  }

  isKeyAvailable(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.containsKey(key));
    return pref.containsKey(key);
  }

  Future<dynamic> getStringToSharedPref(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }


  setIntToSharedPref(String key, int val) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt(key, val);
  }

  setListToSharedPref(String key, List val) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList(key, val);
  }

  getListToSharedPref(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getStringList(key);
  }

  getIntToSharedPref(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt(key);
  }


  setBoolToSharedPref(String key, bool val) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(key, val);
  }

  removeKey(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(key);
  }

  removeAll() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  Future<bool> getBoolToSharedPref(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(key);
  }
}
