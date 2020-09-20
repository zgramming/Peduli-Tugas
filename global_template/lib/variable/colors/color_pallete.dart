import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

class ColorPallete {
  Color white = const Color(0xFFFFFFFF);
  Color black = const Color(0xFF222831);
  Color red = const Color(0xFFd63447);
  Color blue = const Color(0xFF1b6ca8);
  Color green = const Color(0xFF21bf73);
  Color transparent = const Color(0x00000000);
  Color weekEnd = const Color(0xFFf0134d);
  Color darkGrey = const Color(0xFF121212);
  Color darkGrey12 = const Color(0xFF121212).withOpacity(.12);
  Color darkGrey26 = const Color(0xFF121212).withOpacity(.26);
  Color darkGrey38 = const Color(0xFF121212).withOpacity(.38);
  Color darkGrey45 = const Color(0xFF121212).withOpacity(.45);
  Color darkGrey54 = const Color(0xFF121212).withOpacity(.54);
  Color darkGrey87 = const Color(0xFF121212).withOpacity(.87);
  Color darkGreyAccent = const Color(0xFF222831);
  Color darkGreyAccent2 = const Color(0xFF525252);
  Color darkGreyAccent3 = const Color(0xFF414141);
  Color darkGreyAccent4 = const Color(0xFF313131);

  /// Grey
  Color grey = const Color(0xFF969696);
  Color greyTransparent = const Color(0xFFEAEAEA);

  ///Primary Color
  Color primaryColor = const Color(0xff4361ee);

  ///Monochromatic Color
  Color monochromaticColor = const Color(0xff153AE9);

  ///Accent Color
  Color accentColor = const Color(0xffEED043);

  /// Scaffold Color
  Color backgroundColor = const Color(0xFFf9f9f9);
  Color backgroundColor1 = const Color(0xFFfcfefe);
  Color backgroundColor2 = const Color(0xFFF8FCFF);
  Color backgroundColor3 = const Color(0xFFf6f6f6);
  Color backgroundColor4 = const Color(0xFFfbfbfb);
  Color backgroundColor5 = const Color(0xFFf2f2f2);

  /// Scaffold Dark Color
  Color backgroundDarkColor = const Color(0xFF003545);

  // Color darkModeColor = const Color(0xff121212);
  Color accentDarkModeColor = const Color(0xFFf638dc);

  // Color For Onboarding Screen
  Color ob1Color = const Color(0xFF82B832);
  Color ob2Color = const Color(0xFFB83282);
  Color ob3Color = const Color(0xFF3282B8);

  List<Color> arr_color = [
    Color(0xFFfb5607),
    Color(0xFFff006e),
    Color(0xFF8338ec),
    Color(0xFF3a86ff),
    Color(0xFFe07a5f),
    Color(0xFF3d405b),
    Color(0xFF118ab2),
    Color(0xFF3d5a80),
    Color(0xFF50514f),
    Color(0xFFf25f5c),
    Color(0xFF247ba0),
    Color(0xFFf07167),
  ];

  static ThemeData dynamicTheme(bool isDarkMode, BuildContext context) {
    return ThemeData(
      primaryColor: colorPallete.primaryColor,
      accentColor: colorPallete.accentColor,
      fontFamily: AppConfig.defaultFont,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      buttonTheme:
          ButtonThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      cardTheme: CardTheme(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      scaffoldBackgroundColor: isDarkMode ? colorPallete.darkGrey : colorPallete.backgroundColor2,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: isDarkMode ? colorPallete.darkGreyAccent2 : colorPallete.accentColor,
        foregroundColor: isDarkMode ? colorPallete.white : colorPallete.black,
      ),
    );
  }
}

final colorPallete = ColorPallete();
