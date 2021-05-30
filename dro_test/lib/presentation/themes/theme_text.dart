import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dro_test/common/constants/device_size/size_constants.dart';
import 'package:dro_test/common/extensions/size_entensions.dart';

import 'theme_color.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _nunitoTextTheme => GoogleFonts.nunitoTextTheme();
  static TextStyle get _headline6 => _nunitoTextTheme.headline6!.copyWith(
        fontSize: Sizes.dimen_20.sp,
        color: AppColor.kwhiteColor,
        fontWeight: FontWeight.bold,
      );
  static getTextTheme() => TextTheme(
        headline6: _headline6,
      );
}
