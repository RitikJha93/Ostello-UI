import 'package:flutter/material.dart';

class DeviceUtils {
  /// Gets the width of the device screen
  static double getDeviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Gets the height of the device screen
  static double getDeviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
