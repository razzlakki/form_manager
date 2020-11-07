import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/color_config.dart';
import '../theme/style_config.dart';

class CustomTextField extends StatefulWidget {
  String hintText;
  Icon icon;
  String lable;
  bool isPasswordField;
  TextInputType keyboardType;
  double radius;

  bool isShowDropDown;

  EdgeInsets padding;

  TextEditingController controller;

  Function(String, String) onChange;

  String value;

  List<TextInputFormatter> inputFormat;

  CustomTextField(
      {@required this.hintText,
      this.lable,
      this.icon,
      this.isShowDropDown,
      this.keyboardType,
      this.value,
      this.padding,
      this.controller,
      @required this.isPasswordField,
      @required this.radius,
      this.inputFormat,
      this.onChange});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String lable;
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    lable = widget.lable ?? '';
    _controller = TextEditingController(text: widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: StyleConfig().decoration(
          color: Colors.white, borderColor: ColorConfig.color_bg, radius: 10.0),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 7,
            child: Padding(
              padding: widget.padding,
              child: TextField(
                controller: _controller,
                enabled: !widget.isShowDropDown,
                onChanged: (text) => widget.onChange(widget.lable, text),
                keyboardType: widget.keyboardType,
                obscureText: widget.isPasswordField,
                inputFormatters: widget.inputFormat,
                decoration: InputDecoration(
                  prefixIcon: widget.icon,
                  border: InputBorder.none,
                  hintText: widget.hintText,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          Spacer(),
          Visibility(
            visible: widget.isShowDropDown,
            child: Flexible(
              flex: 1,
              child: Icon(
                Icons.keyboard_arrow_down,
                color: ColorConfig.color_bg,
              ),
            ),
          )
        ],
      ),
    );
  }
}
