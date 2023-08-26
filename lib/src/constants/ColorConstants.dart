import 'package:flutter/material.dart';

// -- ONBOARDING COLORS

const tOnboardingPage1Color = Color(0xFF639392);
const tOnboardingPage2Color = Color(0xFF9BBBAE);
const tOnboardingPage3Color = Color(0xFFD4E2D7);

const tDarkColor = Color(0xFF000000);
const tWhiteColor = Color(0xFFFFFFFF);

// -- LIST OF ALL COLORS -- //

const tPrimaryColor = Color(0xFFFFE400);
const tSecondaryColor = Color(0xFF272727);
const tAccentColor = Color(0xFF001BFF);

class ColorConstants {
  static Color gray50 = hexToColor('#e9e9e9');
  static Color gray100 = hexToColor('#bdbebe');
  static Color gray200 = hexToColor('#929293');
  static Color gray300 = hexToColor('#666667');
  static Color gray400 = hexToColor('#505151');
  static Color gray500 = hexToColor('#242526');
  static Color gray600 = hexToColor('#202122');
  static Color gray700 = hexToColor('#191a1b');
  static Color gray800 = hexToColor('#121313');
  static Color gray900 = hexToColor('#0e0f0f');
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) +
      (hex.length == 7 ? 0xFF000000 : 0x00000000));
}
