import 'package:flutter/material.dart';

import '../../../../core/plugins/screen_type_builder/screen_type_builder.dart';
import 'login_desktop_view.dart';
import 'login_mobile_view.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeBuilder(
      desktop: LoginDesktopView(),
      tablet: LoginMobileView(),
      mobile: LoginMobileView(),
    );
  }
}
