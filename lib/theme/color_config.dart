import 'package:flutter/material.dart';

class ColorConfig {
  static const Color color_bg = Color(0xff2d616c);
  static const Color app_color_dark = Color(0xff0e1f22);
  static const Color color_pre_fix_icon = Color(0xff919191);
  static const Color color_danger = Color(0xffff6e6e);
  static const Color color_app_bg = Color(0xffE5E5E5);
  static const Color color_white = Color(0xFFFFFFFF);
  static const Color color_transparent = Color(0x00000000);

  static const int _app_color = 0xff2d616c;
  static const MaterialColor app_color_theme =
      MaterialColor(_app_color, theme_data);

  static const Map<int, Color> theme_data = <int, Color>{
    50: Color(0xffe5faff),
    100: Color(0xff5cbace),
    200: Color(0xff4997a8),
    300: Color(0xff3d8190),
    400: Color(0xff2d616c),
    500: Color(_app_color),
    600: Color(0xff27555d),
    700: Color(0xff173338),
    800: Color(0xff173338),
    900: Color(0xff0e1f22),
  };

}
