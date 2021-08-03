import 'package:flutter/material.dart';

import 'device_screen_type.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  var deviceWidth = mediaQuery.size.longestSide;

  if (deviceWidth > 1280) {
    return DeviceScreenType.Desktop;
  }

  if (deviceWidth > 750) {
    return DeviceScreenType.Tablet;
  }

  return DeviceScreenType.Mobile;
}
