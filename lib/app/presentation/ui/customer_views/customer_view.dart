import 'package:flutter/material.dart';

import '../../../../core/plugins/screen_type_builder/screen_type_builder.dart';
import 'customer_mobile_view.dart';

class CustomerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeBuilder(
      mobile: CustomerMobileView(),
      tablet: CustomerMobileView(),
      desktop: CustomerMobileView(),
    );
  }
}
