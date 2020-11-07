import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_form_admin/util/api_constants.dart';
import '../../custom_ui/custom_dialog.dart';
import '../../models/base_res_model.dart';


class ApiService {
  Map params = {};
  BaseResModel model;
  ReqType reqType;
  String url;

  //bool isShowLoader;
  FormData formData;

  ApiService(
      {@required this.url,
      @required this.reqType,
      @required this.model,
      //  this.isShowLoader = true,
      this.params,
      this.formData});

  Dio getDio() {
    var dio = Dio();
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      // dynamic apiToken =
      //     await SharedPrefUtility().getStringToSharedPref(Constants.API_TOKEN);
      // print('TOKEN ==> $apiToken');
      // if (apiToken != null) {
      //   options.headers["Authorization"] = apiToken;
      //   print('REQ OPTIONS ${options.headers['Authorization']}');
      //   return options; //continue
      // }
    }, onResponse: (Response response) async {
      print('RES OPTIONS');
      return response; // continue
    }, onError: (DioError dioError) async {
      print('ON ERROR');
      if (dioError.response?.statusCode == 401) {}
      return dioError;
    }));
    return dio;
  }

  Future<dynamic> dioReq() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    print('CONNECTION STATE ==> $connectivityResult');
    if (connectivityResult == ConnectivityResult.none) {
      CustomDialog().showMessageDialog(true,
          message: 'Please check your internet connection');
    } else {
      Response response;
      try {
        print('URL ==> ${ApiConstants.BASE_URL}$url');
        print('REQUEST TYPE ==> $reqType');
        print('PARAMS ==> $params');

        model.status = APIStatus.INPROGRES;
        model.updatedData();

        response = reqType == ReqType.POST
            ? await getDio().post('${ApiConstants.BASE_URL}$url',
                data: params != null ? params : formData)
            : await getDio().get('${ApiConstants.BASE_URL}$url');

        print('RESPONSE  ==> ${response.data}');

        if (response.statusCode == 200) {
          model.status = APIStatus.DONE;
          model.rootFromJson(response.data);
        }
        return model;
      } catch (e) {
        // print('HEADERS ==> ${response.headers}');
        if (e is DioError) {
          print('ERROR ==> $e');
          model.status = APIStatus.DONE;
          model.updatedData();
          if (e.message.contains('Network is unreachable')) {
            CustomDialog().showMessageDialog(true,
                message: 'Please check your internet connection');
          } else {
            CustomDialog().showMessageDialog(true, message: 'Something went wrong!\nplease try again after some time');
          }

          return model;
        }
      }
    }
  }
}
