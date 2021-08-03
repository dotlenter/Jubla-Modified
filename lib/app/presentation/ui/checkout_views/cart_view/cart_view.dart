import 'package:flutter/material.dart';

import '../../../../../core/plugins/screen_type_builder/screen_type_builder.dart';
import 'cart_mobile_view.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeBuilder(
      mobile: CartMobileView(),
      tablet: CartMobileView(),
      desktop: CartMobileView(),
    );
  }
}
