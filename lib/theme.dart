import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Brand Colors: White Background + Purple Primary Accent
const Color kPurple = Color(0xFF7C3AED); // Vibrant Web3 Purple
const Color kPurpleLight = Color(0xFFA78BFA); // Soft Lavender
const Color kPurpleDark = Color(0xFF5B21B6); // Deep Violet
const Color kPurpleSoft = Color(0xFFF3E8FF); // Light Purple Tint

const Color kWhite = Color(0xFFFFFFFF); // Clean White Background
const Color kOffWhite = Color(0xFFF8FAFC); // Subtle Off-White for Sections
const Color kCardBg = Color(0xFFFFFFFF); // Clean White Card Background
const Color kBorderColor = Color(0xFFE2E8F0); // Crisp Neutral Border

const Color kTextDark = Color(0xFF0F172A); // Charcoal Black for Headings
const Color kTextMuted = Color(0xFF475569); // Slate Gray for Body Text
const Color kTextSubtle = Color(0xFF94A3B8); // Muted Gray for Secondary Labels

// Aliases for compatibility
const Color kYellow = kPurple;
const Color kYellowLight = kPurpleLight;
const Color kBlack = kWhite;
const Color kDarkGray = Color(0xFFF8FAFC);
const Color kMidGray = Color(0xFFE2E8F0);

TextStyle headingStyle({
  double size = 42,
  FontWeight weight = FontWeight.w900,
  Color color = kTextDark,
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
  Color color = kTextMuted,
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
  Color color = kPurple,
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
      color: kPurple,
      borderRadius: BorderRadius.circular(4),
    ),
  );
}

Widget sectionLabel(String text) {
  return Text(text.toUpperCase(), style: labelStyle());
}
