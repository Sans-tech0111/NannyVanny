import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static const Color primary = Color(0xFFE36DA6);
  static const Color secondary = Color(0xFF262F71);
  static const Color tertiary = Color(0xFF0098D0);
  static const Color alternate = Color(0xFFE0E3E7);
  static const Color primaryText = Color(0xFF5C5C5C);
  static const Color secondaryText = Color(0xFF494949);
  static const Color primaryContainer = Color(0xFFF5B5CF);
  static const Color secondaryContainer = Color(0xFF80ABDB);
}

ThemeData customThemeData() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    textTheme: GoogleFonts.alegreyaSansTextTheme(),
  );
}