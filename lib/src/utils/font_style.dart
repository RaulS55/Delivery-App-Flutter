import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class MyFontStyles {
  static final title =
      GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.bold);

  static final normal = GoogleFonts.nunito(color: Colors.black);
  static final normalGray = GoogleFonts.nunito(color: Colors.black54);

  static final bottom = GoogleFonts.roboto(
      fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white);

  static final regular = GoogleFonts.nunito(
      fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black);

  static final TextTheme textTheme = GoogleFonts.nunitoTextTheme();
}
