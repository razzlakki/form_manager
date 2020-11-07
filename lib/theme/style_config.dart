import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme/color_config.dart';

class StyleConfig {
  BoxDecoration decoration({color, radius, borderColor}) => BoxDecoration(
        color: color ?? ColorConfig.color_app_bg,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
            color:
                borderColor != null ? ColorConfig.color_bg : Colors.transparent,
            width: 1.0),
        boxShadow: [
          BoxShadow(
            color: Color(0x33000000),
            offset: Offset(0, 1),
            blurRadius: 3,
            spreadRadius: 0,
          ),
        ],
      );

  OutlineInputBorder outlineInputBorder({color, radius}) => OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(radius));
}
