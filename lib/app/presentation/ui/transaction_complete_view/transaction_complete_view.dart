import 'package:flutter/material.dart';

import '../../../../core/plugins/screen_type_builder/screen_type_builder.dart';
import 'transaction_complete_mobile_view.dart';

class TransactionCompleteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeBuilder(
      mobile: TransactionCompleteMobileView(),
      tablet: TransactionCompleteMobileView(),
      desktop: TransactionCompleteMobileView(),
    );
  }
}
