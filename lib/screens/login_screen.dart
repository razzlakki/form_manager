import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_form_admin/custom_ui/custom_button.dart';
import 'package:my_form_admin/custom_ui/custom_dialog.dart';
import 'package:my_form_admin/custom_ui/custom_text_field.dart';
import 'package:my_form_admin/custom_ui/loading_widget.dart';
import 'package:my_form_admin/models/login_model.dart';
import 'package:my_form_admin/services/api/api_service.dart';
import 'package:my_form_admin/services/di/locator.dart';
import 'package:my_form_admin/services/navigationservice/navigation_services.dart';
import 'package:my_form_admin/services/navigationservice/route_paths.dart';
import 'package:my_form_admin/theme/color_config.dart';
import 'package:my_form_admin/util/Constants.dart';
import 'package:my_form_admin/util/api_constants.dart';
import 'package:my_form_admin/util/shared_pref_utility.dart';
import 'package:my_form_admin/util/toast_util.dart';
import 'package:my_form_admin/widgets/custom_state.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends CustomState<LoginScreen, LoginModel> {
  String userName = '';

  String password = '';


  void onTextChange(lable, text) {
    if (lable == 'Username') {
      userName = text;
    } else {
      password = text;
    }
  }

  @override
  Widget cBuild(BuildContext context, LoginModel model) {
    return _getUi(false, null);
  }

  _getUi(bool showLoading, LoginModel model) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/splash_icon.png',
                  height: 100,
                  width: 100,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorConfig.color_bg),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                  child: CustomTextField(
                    onChange: onTextChange,
                    padding: EdgeInsets.zero,
                    //inputFormat: [FilteringTextInputFormatter.digitsOnly],
                    isShowDropDown: false,
                    isPasswordField: false,
                    hintText: 'Username',
                    lable: 'Username',
                    keyboardType: TextInputType.text,
                    icon: Icon(
                      Icons.phone_android,
                      color: ColorConfig.color_pre_fix_icon,
                    ),
                    radius: 15.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: CustomTextField(
                    onChange: onTextChange,
                    padding: EdgeInsets.zero,
                    isShowDropDown: false,
                    isPasswordField: true,
                    hintText: 'Password',
                    lable: 'Password',
                    icon: Icon(
                      Icons.vpn_key,
                      color: ColorConfig.color_pre_fix_icon,
                    ),
                    radius: 15.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                  child: CustomButton('LOGIN', callback: () async {
                    if (userName == '') {
                      ToastUtil.showToast('Please Enter Username');
                    } else if (password == '') {
                      ToastUtil.showToast('Please Enter Password');
                    } else {
                      ApiService(
                              url: ApiConstants.ADMIN_LOGIN,
                              params: {
                                "username": userName,
                                //"7306161010",
                                "password": password
                                //"zxasqw12"
                              },
                              reqType: ReqType.POST,
                              //route: Routes.DashboardRoute,
                              model: Provider.of<LoginModel>(context,listen: false))
                          .dioReq()
                          .then((value) {
                            print('Login success');
                        LoginModel loginModel = value as LoginModel;
                        if (loginModel.messageCode == 200) {
                          SharedPrefUtility().setStringToSharedPref(
                              Constants.USERNAME,
                              loginModel.resource.username);
                          SharedPrefUtility().setStringToSharedPref(
                              Constants.ROLE,
                              loginModel.resource.role);
                          SharedPrefUtility().setListToSharedPref(
                              Constants.GROUPS,
                              loginModel.resource.groups);

                          locator<NavigationService>()
                              .navigateTo(Routes.DashboardRoute);
                        } else {
                          CustomDialog().showMessageDialog(true,
                              message: loginModel.message);
                        }
                      }).catchError((onError){
                        print('error');
                      });
                    }
                  },
                      padding: EdgeInsets.only(left: 30, right: 30),
                      color: ColorConfig.color_bg),
                ),
              ],
            ),
          ),
        ),
        if (showLoading) LoadingWidget()
      ],
    );
  }

  @override
  Widget cShowLoader(BuildContext context) {
    return _getUi(true, null);
  }
}
