import 'package:flutter/material.dart';

import '../../../../core/plugins/screen_type_builder/screen_type_builder.dart';
import '../../../domain/entities/User/User.dart';
import 'products_mobile_view.dart';

class ProductsView extends StatelessWidget {
  final User user;
  final bool isQuickAccess;

  const ProductsView({Key key, this.user, this.isQuickAccess = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenTypeBuilder(
      mobile: ProductsMobileView(),
      tablet: ProductsMobileView(),
      desktop: ProductsMobileView(),
    );
  }
}
