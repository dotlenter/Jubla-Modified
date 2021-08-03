import 'package:flutter/material.dart';

import '../../../../core/plugins/screen_type_builder/screen_type_builder.dart';
import 'registration_mobile_view.dart';

class RegistrationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeBuilder(
      mobile: RegistrationMobileView(),
      desktop: RegistrationMobileView(),
      tablet: RegistrationMobileView(),
    );
  }
}