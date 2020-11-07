import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme/style_config.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String text;
  EdgeInsets padding;
  Color color;

  final VoidCallback callback;

  double fontSize;

  double height;

  double radius;

  Color textColor;

  EdgeInsets margin;

  CustomButton(this.text,
      {this.padding,
      this.color,
      this.callback,
      this.height,
      this.radius,
      this.fontSize,
      this.textColor,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        margin: margin ?? EdgeInsets.zero,
        padding: padding,
        decoration:
            StyleConfig().decoration(color: this.color, radius: radius ?? 30.0),
        height: height ?? 45,
        child: Text(
          text,
          style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: fontSize ?? 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 2),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
