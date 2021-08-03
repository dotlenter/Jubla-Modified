import 'package:flutter/material.dart';

class LoginDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
      ),
    );
  }

  // Row _buildRegistrationButton(BuildContext context) {
  //   return Row(
  //     children: [
  //       Expanded(
  //         child: FlatButton(
  //           onPressed: () =>
  //               ExtendedNavigator.of(context).push(Routes.registrationView),
  //           color: Colors.blueGrey,
  //           child: Padding(
  //             padding: const EdgeInsets.all(15.0),
  //             child: Text(
  //               'Apply for an account',
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontFamily: 'HNMed',
  //                 fontSize: 12.sp,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Row _buildCheckoutDemoButton(BuildContext context) {
  //   return Row(
  //     children: [
  //       Expanded(
  //         child: OutlineButton(
  //           onPressed: () => context.read<AuthCubit>()
  //             ..checkoutDemoAccount(
  //               onSuccess: (loginDetails) {
  //                 context.read<RegisterCubit>()
  //                   ..getUserProducts(
  //                     loginDetails.user.warehouseId,
  //                     loginDetails.user.clientId,
  //                     loginDetails.settings.first.inventoryType,
  //                   )
  //                   ..getHistoryOfTransactionsByCashierId(
  //                     loginDetails.user.id,
  //                     loginDetails.user.clientId,
  //                   );
  //                 context.read<TransactionsCubit>()..getUserPreferences();
  //                 context.read<AuthCubit>()..resetAuthStates();
  //                 ExtendedNavigator.of(context).pushAndRemoveUntil(
  //                   Routes.registerView,
  //                   (route) => false,
  //                   arguments:
  //                       RegisterViewArguments(loginDetails: loginDetails),
  //                 );
  //               },
  //             ),
  //           color: Colors.purple,
  //           borderSide: const BorderSide(
  //             color: Colors.purple,
  //             width: 2,
  //           ),
  //           child: Padding(
  //             padding: const EdgeInsets.all(15.0),
  //             child: Text(
  //               'Try it out',
  //               style: TextStyle(
  //                 color: Colors.purple,
  //                 fontFamily: 'HNMed',
  //                 fontSize: 12.sp,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Row _buildLoginButton(BuildContext context) {
  //   return Row(
  //     children: [
  //       Expanded(
  //         child: FlatButton(
  //           onPressed: () => context.read<AuthCubit>()
  //             ..loginWithUsernameAndPassword(
  //               ifLoginSuccess: (loginDetails) {
  //                 context.read<RegisterCubit>()
  //                   ..getUserProducts(
  //                     loginDetails.user.warehouseId,
  //                     loginDetails.user.clientId,
  //                     loginDetails.settings.first.inventoryType,
  //                   )
  //                   ..getHistoryOfTransactionsByCashierId(
  //                     loginDetails.user.id,
  //                     loginDetails.user.clientId,
  //                   );
  //                 context.read<TransactionsCubit>()..getUserPreferences();
  //                 context.read<AuthCubit>()..resetAuthStates();
  //                 ExtendedNavigator.of(context).pushAndRemoveUntil(
  //                   Routes.registerView,
  //                   (route) => false,
  //                   arguments: RegisterViewArguments(
  //                     loginDetails: loginDetails,
  //                   ),
  //                 );
  //               },
  //             ),
  //           color: Colors.purple,
  //           child: Padding(
  //             padding: const EdgeInsets.all(15.0),
  //             child: Text(
  //               'Login',
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontFamily: 'HNMed',
  //                 fontSize: 12.sp,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
