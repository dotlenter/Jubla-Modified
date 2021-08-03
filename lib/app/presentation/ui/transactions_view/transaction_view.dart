import 'package:flutter/material.dart';

import '../../../../core/plugins/screen_type_builder/screen_type_builder.dart';
import 'transactions_mobile_view.dart';

class TransactionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeBuilder(
      mobile: TransactionsMobileView(),
      tablet: TransactionsMobileView(),
      desktop: TransactionsMobileView(),
    );
  }
}
