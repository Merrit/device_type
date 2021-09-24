library device_type;

import 'package:flutter/widgets.dart';

/// Breakpoints for screen sizes.
abstract class ScreenType {
  static const double desktop = 900;
  static const double tablet = 600;
  static const double handset = 300;
}

enum DeviceType { desktop, tablet, handset, watch }

/// Collection of convenience functions to check the device,
/// for use with adaptive design.
abstract class Device {
  /// Returns a [DeviceType] enum of one of the following:
  /// Desktop, Tablet, Handset, Watch
  static DeviceType type(BuildContext context) {
    // Use .shortestSide to detect device type regardless of orientation
    double deviceWidth = MediaQuery.of(context).size.shortestSide;
    if (deviceWidth > ScreenType.desktop) return DeviceType.desktop;
    if (deviceWidth > ScreenType.tablet) return DeviceType.tablet;
    if (deviceWidth > ScreenType.handset) return DeviceType.handset;
    return DeviceType.watch;
  }

  /// Returns true if the device is larger than a mobile phone.
  static bool isLargeFormFactor(BuildContext context) {
    final formFactor = Device.type(context);
    final isDesktop = (formFactor == DeviceType.desktop);
    final isTablet = (formFactor == DeviceType.tablet);
    return (isDesktop || isTablet) ? true : false;
  }
}
