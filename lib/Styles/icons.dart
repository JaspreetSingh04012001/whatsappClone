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

  static String callIcon() {
    return isDarkMode()
        ? "assets\icons\darkThemeIcons\callicon(1)(1).png"
        : "assets\icons\lightThemeIcons\callicon(1)(1).png";
  }

  static String micIcon() {
    return isDarkMode()
        ? "assets\icons\lightThemeIcons\icons8-mic-24.png"
        : "assets\icons\darkThemeIcons\icons8-mic-24.png";
  }

  static String cameraIcon() {
    return isDarkMode()
        ? "assets\icons\darkThemeIcons\icons8-camera-32.png"
        : "assets\icons\lightThemeIcons\icons8-camera-32.png";
  }

  static String plusIcon() {
    return isDarkMode()
        ? "assets\icons\darkThemeIcons\icons8-plus-math-50.png"
        : "assets\icons\lightThemeIcons\icons8-plus-math-50.png";
  }

  static String StickerIcon() {
    return isDarkMode()
        ? "assets\icons\darkThemeIcons\icons8-sticker-32.png"
        : "assets\icons\lightThemeIcons\icons8-sticker-32.png";
  }

  static String videoicallIcon() {
    return isDarkMode()
        ? "assets\icons\darkThemeIcons\icons8-video-call-25.png"
        : "assets\icons\lightThemeIcons\icons8-video-call-25.png";
  }
}
//this is icons