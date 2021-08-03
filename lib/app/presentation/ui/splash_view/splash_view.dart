import 'package:flutter/material.dart';

import '../../../../core/plugins/screen_type_builder/screen_type_builder.dart';
import 'splash_desktop_view.dart';
import 'splash_mobile_view.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeBuilder(
      mobile: SplashMobileView(),
      desktop: SplashDesktopView(),
      tablet: SplashMobileView(),
    );
  }
}
