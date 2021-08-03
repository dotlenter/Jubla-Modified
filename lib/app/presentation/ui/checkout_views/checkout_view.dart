import 'package:flutter/material.dart';

import '../../../../core/plugins/screen_type_builder/screen_type_builder.dart';
import '../../../domain/entities/User/User.dart';
import 'checkout_mobile_view.dart';

class CheckoutView extends StatelessWidget {
  final User user;

  const CheckoutView({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const ScreenTypeBuilder(
      mobile: CheckoutMobile(),
      tablet: CheckoutMobile(),
      desktop: CheckoutMobile(),
    );
  }
}
