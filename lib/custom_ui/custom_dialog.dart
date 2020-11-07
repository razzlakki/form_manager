import 'package:flutter/material.dart';
import 'package:my_form_admin/services/navigationservice/navigation_services.dart';
import 'package:my_form_admin/services/navigationservice/route_paths.dart';
import '../services/di/locator.dart';
import '../theme/color_config.dart';
import '../theme/style_config.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class CustomDialog {
  void showOtpDialog() {
    showDialog(
        barrierDismissible: false,
        context: locator<NavigationService>()
            .navigatorKey
            .currentState
            .overlay
            .context, // Using overlay's context
        builder: (context) => Center(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  decoration: StyleConfig()
                      .decoration(color: Colors.white, radius: 15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          'OTP',
                          style: TextStyle(
                              fontSize: 20.0, color: ColorConfig.color_bg),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: CustomTextField(
                          //  onChange: onTextChange,
                          padding: EdgeInsets.zero,
                          isShowDropDown: false,
                          isPasswordField: true,
                          hintText: 'OTP',
                          lable: 'OTP',
                          keyboardType: TextInputType.number,
                          icon: Icon(
                            Icons.lock,
                            color: ColorConfig.color_pre_fix_icon,
                          ),
                          radius: 15.0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: CustomButton(
                          'SUBMIT',
                          padding: EdgeInsets.only(left: 30, right: 30),
                          color: ColorConfig.color_bg,
                          callback: () {
                            locator<NavigationService>().goBack();
                            locator<NavigationService>()
                                .goTo(Routes.LoginRoute);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  void showMessageDialog(bool isError,
      {message = 'Will call you back to get details', Function event}) {
    showDialog(
        context: locator<NavigationService>()
            .navigatorKey
            .currentState
            .overlay
            .context, // Using overlay's context
        builder: (context) => Center(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  decoration: StyleConfig()
                      .decoration(color: Colors.white, radius: 15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.all(10),
                          child: CircleAvatar(
                            minRadius: 30,
                            child: Icon(
                              isError ? Icons.close : Icons.done,
                              color: Colors.white, //Colors.white,
                              size: 35,
                            ),
                            backgroundColor: isError
                                ? ColorConfig.color_danger
                                : ColorConfig.color_bg,
                          )
                          // Text(
                          //   isError ? 'Error Message' : 'Success Message',
                          //   style: TextStyle(
                          //       fontSize: 16.0,
                          //       color: !isError
                          //           ? Colors.green
                          //           : ColorConfig.color_danger),
                          //   textAlign: TextAlign.center,
                          // ),
                          ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          message,
                          style: TextStyle(
                              fontSize: 16.0, color: ColorConfig.color_bg),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: CustomButton(
                          'Close',
                          padding: EdgeInsets.only(left: 30, right: 30),
                          color: !isError
                              ? ColorConfig.color_bg
                              : ColorConfig.color_danger,
                          callback: () {
                            locator<NavigationService>().goBack();
                            if (event != null) event();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  void showRegSuccessDialog() {
    showDialog(
        context: locator<NavigationService>()
            .navigatorKey
            .currentState
            .overlay
            .context, // Using overlay's context
        builder: (context) => Center(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  decoration: StyleConfig()
                      .decoration(color: Colors.white, radius: 15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: ColorConfig.color_bg,
                        radius: 40,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.phone_android,
                            size: 48,
                          ),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          'Registered Successfully ',
                          style: TextStyle(fontSize: 16.0, color: Colors.green),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          'Will call you back to get details',
                          style: TextStyle(
                              fontSize: 16.0, color: ColorConfig.color_bg),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: CustomButton('CLOSE', callback: () {
                          locator<NavigationService>().goBack();
                        },
                            padding: EdgeInsets.only(left: 30, right: 30),
                            color: ColorConfig.color_danger),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

  void showLoader() {
    showDialog(
        barrierDismissible: false,
        context: locator<NavigationService>()
            .navigatorKey
            .currentState
            .overlay
            .context, // Using overlay's context
        builder: (context) => Center(
                child: Material(
              color: Colors.transparent,
              child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: StyleConfig().decoration(
                    color: Colors.white.withOpacity(0.7), radius: 15.0),
                child: CircularProgressIndicator(
                  backgroundColor: ColorConfig.color_bg,
                ),
              ),
            )));
  }

  void showSelectItemDialog(List<String> items) {
    showDialog(
        context: locator<NavigationService>()
            .navigatorKey
            .currentState
            .overlay
            .context, // Using overlay's context
        builder: (context) => Center(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  decoration: StyleConfig()
                      .decoration(color: Colors.white, radius: 15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Select',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: ColorConfig.color_bg,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, position) {
                            return InkWell(
                              onTap: () {
                                print(items[position]);
                              },
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      items[position],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    height: .5,
                                    color: Colors.grey[300],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
