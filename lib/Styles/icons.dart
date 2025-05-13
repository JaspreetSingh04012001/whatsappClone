import 'package:flutter/material.dart';

class AppIcons {
  static bool isDarkMode() {
    final Brightness platformBrightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;

    return platformBrightness == Brightness.dark;
  }

  static String appIcon() {
    return isDarkMode()
        ? "assets/icons/darkThemeIcons/darkWhatsAppIcon.png"
        : "assets/icons/lightThemeIcons/lightWhatsAppIcon.png";
  }
  static String communityIcon() {
    return isDarkMode()
        ? "assets/icons/darkThemeIcons/Community.png"
        : "assets/icons/lightThemeIcons/Community.png";
  }
}
