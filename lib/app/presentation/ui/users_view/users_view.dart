import 'package:flutter/material.dart';

import '../../../../core/plugins/screen_type_builder/screen_type_builder.dart';
import 'users_mobile_view.dart';

class UsersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeBuilder(
      mobile: UsersMobileView(),
      tablet: UsersMobileView(),
      desktop: UsersMobileView(),
    );
  }
}
