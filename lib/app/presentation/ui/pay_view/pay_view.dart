import 'package:flutter/material.dart';

import '../../../../core/plugins/screen_type_builder/screen_type_builder.dart';
import 'pay_mobile_view.dart';

class PayView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeBuilder(
      mobile: PayMobileView(),
      tablet: PayMobileView(),
      desktop: PayMobileView(),
    );
  }
}
