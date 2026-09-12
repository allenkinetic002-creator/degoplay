import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kYellow = Color(0xFFFFD700);
const Color kBlack = Color(0xFF0D0D0D);
const Color kDarkGray = Color(0xFF1A1A1A);
const Color kMidGray = Color(0xFF2A2A2A);
const Color kWhite = Color(0xFFFFFFFF);
const Color kYellowLight = Color(0xFFFFF176);

TextStyle headingStyle({
  double size = 42,
  FontWeight weight = FontWeight.w900,
  Color color = kWhite,
}) {
  return GoogleFonts.inter(
    fontSize: size,
    fontWeight: weight,
    color: color,
    height: 1.1,
  );
}

TextStyle bodyStyle({
  double size = 16,
  FontWeight weight = FontWeight.w400,
  Color color = const Color(0xFFAAAAAA),
}) {
  return GoogleFonts.inter(
    fontSize: size,
    fontWeight: weight,
    color: color,
    height: 1.6,
  );
}

TextStyle labelStyle({
  double size = 13,
  Color color = kYellow,
  FontWeight weight = FontWeight.w700,
  double spacing = 2,
}) {
  return GoogleFonts.inter(
    fontSize: size,
    fontWeight: weight,
    color: color,
    letterSpacing: spacing,
  );
}

Widget yellowDivider() {
  return Container(
    width: 48,
    height: 3,
    margin: const EdgeInsets.only(top: 12, bottom: 20),
    decoration: BoxDecoration(
      color: kYellow,
      borderRadius: BorderRadius.circular(4),
    ),
  );
}

Widget sectionLabel(String text) {
  return Text(text.toUpperCase(), style: labelStyle());
}
