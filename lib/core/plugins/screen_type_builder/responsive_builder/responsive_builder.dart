import 'package:flutter/material.dart';

import '../device_screen_type/util.dart';
import '../sizing_information/sizing_information.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({Key key, this.builder}) : super(key: key);
  final Widget Function(
    BuildContext context,
    SizingInformation sizingInformation,
  ) builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      var mediaQuery = MediaQuery.of(context);
      var sizingInformation = SizingInformation(
        deviceScreenType: getDeviceType(mediaQuery),
        screenSize: mediaQuery.size,
        localWidgetSize:
            Size(boxConstraints.maxWidth, boxConstraints.maxHeight),
      );
      print('${sizingInformation.toString()}');
      return builder(context, sizingInformation);
    });
  }
}
