import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Deviceinfo {
 static String getDeviceType(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    // Platform is Web
    if (width >= 1024) {
      return "WEB";
    } else {
      return "MOBILE";
    }
  }
}
