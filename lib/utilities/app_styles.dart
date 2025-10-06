import 'package:flutter/material.dart';
import 'package:skincare_task/utilities/utilities.dart';

class Styles {
  static TextStyle boldtextsTYLE({required double fontsize, Color? color}) {
    return TextStyle(
      fontSize: fontsize,
      fontFamily: "circular",
      color: color,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle getRegulartext({required double fontsize, Color? color}) {
    return TextStyle(
      fontSize: fontsize,
      fontFamily: "circular",
      color: color,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle getsmalltext({
    required double fontsize,
    Color? color,
    required bool underline,
  }) {
    return TextStyle(
      fontSize: fontsize,
      fontFamily: 'circular',
      color: color,
      fontWeight: FontWeight.normal,
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      decorationColor: AppColors.buttoncolor,
    );
  }

  static ButtonStyle outlinedButtonstyle = ButtonStyle(
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
    ),
    backgroundColor: WidgetStateProperty.all(Colors.white),
    foregroundColor: WidgetStateProperty.all(Colors.black),
  );
}
