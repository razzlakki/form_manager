import 'package:flutter/cupertino.dart';

abstract class BaseResModel with ChangeNotifier {
  APIError error = APIError.NON;
  APIStatus status = APIStatus.DONE;

  fromJson(Map<String, dynamic> map);
  rootFromJson(Map<String, dynamic> map) {
    fromJson(map);
    updatedData();
  }

  updatedData() {
    notifyListeners();
  }
}

enum APIError { NON, ON_API_ERROR, NON_200 }
enum APIStatus { INPROGRES, DONE }
