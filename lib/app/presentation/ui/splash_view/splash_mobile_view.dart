import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../cubits/Auth/auth_cubit.dart';
import '../../cubits/Main/main_cubit.dart';
import '../../routes/auto_router.gr.dart';

class SplashMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<AuthCubit>()
      ..checkActiveUser(
        onActiveUser: (user) {
          context.read<MainCubit>()..mainInitial();
          context.read<MainCubit>()..setUser(user);
          context.read<MainCubit>()..setBusiness(user.businesses.first);
          // context.read<MainCubit>()..startListeningToBusinessMessages();
          context.read<MainCubit>()
            ..syncAllData(
              user.businesses.first.businessId,
              user.userId,
              onSuccess: () => context.read<MainCubit>()
                ..navigateView(
                  onCalendar: () =>
                      ExtendedNavigator.of(context).pushAndRemoveUntil(
                    Routes.calendarView,
                    (route) => false,
                  ),
                  onCheckout: () =>
                      ExtendedNavigator.of(context).pushAndRemoveUntil(
                    Routes.checkoutView,
                    (route) => false,
                  ),
                  onCustomers: () =>
                      ExtendedNavigator.of(context).pushAndRemoveUntil(
                    Routes.customerView,
                    (route) => false,
                  ),
                  onProducts: () =>
                      ExtendedNavigator.of(context).pushAndRemoveUntil(
                    Routes.productsView,
                    (route) => false,
                  ),
                  onTransactions: () =>
                      ExtendedNavigator.of(context).pushAndRemoveUntil(
                    Routes.transactionsView,
                    (route) => false,
                  ),
                  onUsers: () =>
                      ExtendedNavigator.of(context).pushAndRemoveUntil(
                    Routes.usersView,
                    (route) => false,
                  ),
                  onNone: () =>
                      ExtendedNavigator.of(context).pushAndRemoveUntil(
                    Routes.settingsView,
                    (route) => false,
                  ),
                ),
              onErrorProducts: (msg) => Fluttertoast.showToast(
                msg: '$msg',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 32.sp,
              ),
              onErrorCategories: (msg) => Fluttertoast.showToast(
                msg: '$msg',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 32.sp,
              ),
              onErrorCustomers: (msg) => Fluttertoast.showToast(
                msg: '$msg',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 32.sp,
              ),
              onErrorTransactions: (msg) => Fluttertoast.showToast(
                msg: '$msg',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 32.sp,
              ),
              onErrorUsers: (msg) => Fluttertoast.showToast(
                msg: '$msg',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 32.sp,
              ),
              onErrorBusinesses: (msg) => Fluttertoast.showToast(
                msg: '$msg',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 32.sp,
              ),
              onErrorStatistics: (msg) => Fluttertoast.showToast(
                msg: '$msg',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 32.sp,
              ),
              onError: (msg) => context.read<MainCubit>()
                ..navigateView(
                  onCalendar: () =>
                      ExtendedNavigator.of(context).pushAndRemoveUntil(
                    Routes.calendarView,
                    (route) => false,
                  ),
                  onCheckout: () =>
                      ExtendedNavigator.of(context).pushAndRemoveUntil(
                    Routes.checkoutView,
                    (route) => false,
                  ),
                  onCustomers: () =>
                      ExtendedNavigator.of(context).pushAndRemoveUntil(
                    Routes.customerView,
                    (route) => false,
                  ),
                  onProducts: () =>
                      ExtendedNavigator.of(context).pushAndRemoveUntil(
                    Routes.productsView,
                    (route) => false,
                  ),
                  onTransactions: () =>
                      ExtendedNavigator.of(context).pushAndRemoveUntil(
                    Routes.transactionsView,
                    (route) => false,
                  ),
                  onUsers: () =>
                      ExtendedNavigator.of(context).pushAndRemoveUntil(
                    Routes.usersView,
                    (route) => false,
                  ),
                  onNone: () =>
                      ExtendedNavigator.of(context).pushAndRemoveUntil(
                    Routes.settingsView,
                    (route) => false,
                  ),
                ),
            );
        },
        empty: () => ExtendedNavigator.of(context).pushAndRemoveUntil(
          Routes.loginView,
          (route) => false,
        ),
      );
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorDark,
          ),
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          padding: EdgeInsets.only(top: ScreenUtil().statusBarHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Jubla',
                    style: Theme.of(context).textTheme.headline3.copyWith(
                          fontSize: 72.sp,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (state.isLoadingEverything) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SpinKitFoldingCube(
                      color: Theme.of(context).accentColor,
                      size: 26,
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
