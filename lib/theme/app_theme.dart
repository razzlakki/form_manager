import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/color_config.dart';

class AppTheme {
  static getAppTheme({@required BuildContext context}) {
    return ThemeData(
      primarySwatch: ColorConfig.app_color_theme,
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
