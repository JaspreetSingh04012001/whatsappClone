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

  static String addcallIcon() {
    return isDarkMode()
        ? "assets/icons/lightThemeIcons/icons8-call-50.png"
        : "assets/icons/darkThemeIcons/icons8-call-50.png";
  }

  static String addmicIcon() {
    return isDarkMode()
        ? "assets/icons/lightThemeIcons/icons8-mic-24.png"
        : "assets/icons/darkThemeIcons/cons8-mic-24.png";
  }

  static String addcameraIcon() {
    return isDarkMode()
        ? "assets/icons/darkThemeIcons/icons8-camera-32.png"
        : "assets/icons/lightThemeIcons/icons8-camera-32.png";
  }

  static String addplusIcon() {
    return isDarkMode()
        ? "assets/icons/darkThemeIcons/icons8-plus-math-50.png"
        : "assets/icons/lightThemeIcons/icons8-plus-math-50.png";
  }

  static String addStickerIcon() {
    return isDarkMode()
        ? "assets/icons/darkThemeIcons/stickerdark,.png"
        : "assets/icons/lightThemeIcons/stickerslight.png";
  }

  static String addvideoicallIcon() {
    return isDarkMode()
        ? "assets/icons/darkThemeIcons/icons8-video-call-25 (1).png"
        : "assets/icons/lightThemeIcons/icons8-video-call-24.png";
  }

  static String addstatuseditIcon() {
    return isDarkMode()
        ? "assets/icons/darkThemeIcons/icons8-edit-50.png"
        : "assets/icons/lightThemeIcons/icons8-edit-50.png";
  }

  static String addStatuscameraIcon() {
    return isDarkMode()
        ? "assets/icons/darkThemeIcons/icons8-add-camera-48.png"
        : "assets/icons/lightThemeIcons/icons8-add-camera-48.png";
  }

  static String addplusIco() {
    return isDarkMode()
        ? "assets/icons/darkThemeIcons/icons8-plus-48.png"
        : "assets/icons/lightThemeIcons/icons8-plus-48.png";
  }

  static String addpaymentIcon() {
    return isDarkMode()
        ? "assets/icons/darkThemeIcons/icons8-exchange-rupee-50.png"
        : "assets/icons/lightThemeIcons/rupeeslight.png";
  }

  static String addArchieveIcon() {
    return isDarkMode()
        ? "assets/icons/darkThemeIcons/icons8-archive-folder-50.png"
        : "assets/icons/ightThemeIcons/icons8-archive-50.png";
  }

  static String addMissedcallIcon() {
    return isDarkMode()
        ? "assets/icons/darkThemeIcons/icons8-missed-call-50 (1).png"
        : "assets/icons/lightThemeIcons/icons8-missed-call-50.png";
  }

  static String addIncommingcallIcon() {
    return isDarkMode()
        ? "assets/icons/darkThemeIcons/icons8-incoming-call-50 (1).png"
        : "assets/icons/lightThemeIcons/icons8-incoming-call-50 (2).png";
  }

  static String addDisconnecctallIcon() {
    return isDarkMode()
        ? "assets/icons/darkThemeIcons/icons8-call-disconnected-50.png"
        : "assets/icons/lightThemeIcons/icons8-call-disconnected-32.png";
  }
}
