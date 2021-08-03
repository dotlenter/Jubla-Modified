import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../cubits/Auth/auth_cubit.dart';
import '../../cubits/Main/main_cubit.dart';
import '../../routes/auto_router.gr.dart';

class LoginMobileView extends StatefulWidget {
  @override
  _LoginMobileViewState createState() => _LoginMobileViewState();
}

class _LoginMobileViewState extends State<LoginMobileView> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) => BlocBuilder<MainCubit, MainState>(
          builder: (cMain, sMain) => Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                ),
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
                padding: EdgeInsets.only(top: ScreenUtil().statusBarHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Jubla',
                            style: TextStyle(
                              color: const Color(0xff4ecca3),
                              fontFamily: 'vb',
                              fontSize: 102.sp,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Beta',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'vr',
                              fontSize: 36.sp,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Syncronize all your businesses.',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'vr',
                                fontSize: 28.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        style: TextStyle(
                          fontSize: 36.sp,
                          fontFamily: 'vb',
                          color: Colors.white,
                        ),
                        cursorColor: Theme.of(context).accentColor,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).accentColor,
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          prefixIcon: const Icon(Icons.person, size: 25),
                          labelText: 'Username',
                          labelStyle: Theme.of(context).textTheme.subtitle2,
                        ),
                        onChanged: (value) =>
                            context.read<AuthCubit>()..onUserNameChanged(value),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        textInputAction: TextInputAction.done,
                        style: TextStyle(
                          fontSize: 36.sp,
                          fontFamily: 'vb',
                          color: Colors.white,
                        ),
                        cursorColor: Theme.of(context).accentColor,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).accentColor,
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          prefixIcon: const Icon(Icons.lock_rounded, size: 25),
                          labelText: 'Password',
                          labelStyle: Theme.of(context).textTheme.subtitle2,
                        ),
                        onChanged: (value) =>
                            context.read<AuthCubit>()..onPassWordChanged(value),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => context.read<AuthCubit>()
                                ..loginWithEmailAndPassword(
                                  state.userName,
                                  state.passWord,
                                  onSuccess: (user) {
                                    context.read<MainCubit>()..clearCart();
                                    context.read<MainCubit>()..setUser(user);
                                    context.read<MainCubit>()
                                      ..setBusiness(user.businesses.first);
                                    context.read<MainCubit>()
                                      ..syncAllData(
                                        user.businesses.first.businessId,
                                        user.userId,
                                        onSuccess: () => context.read<
                                            MainCubit>()
                                          ..navigateView(
                                            onCalendar: () =>
                                                ExtendedNavigator.of(context)
                                                    .pushAndRemoveUntil(
                                              Routes.calendarView,
                                              (route) => false,
                                            ),
                                            onCheckout: () =>
                                                ExtendedNavigator.of(context)
                                                    .pushAndRemoveUntil(
                                              Routes.checkoutView,
                                              (route) => false,
                                            ),
                                            onCustomers: () =>
                                                ExtendedNavigator.of(context)
                                                    .pushAndRemoveUntil(
                                              Routes.customerView,
                                              (route) => false,
                                            ),
                                            onProducts: () =>
                                                ExtendedNavigator.of(context)
                                                    .pushAndRemoveUntil(
                                              Routes.productsView,
                                              (route) => false,
                                            ),
                                            onTransactions: () =>
                                                ExtendedNavigator.of(context)
                                                    .pushAndRemoveUntil(
                                              Routes.transactionsView,
                                              (route) => false,
                                            ),
                                            onUsers: () =>
                                                ExtendedNavigator.of(context)
                                                    .pushAndRemoveUntil(
                                              Routes.usersView,
                                              (route) => false,
                                            ),
                                            onNone: () =>
                                                ExtendedNavigator.of(context)
                                                    .pushAndRemoveUntil(
                                              Routes.settingsView,
                                              (route) => false,
                                            ),
                                          ),
                                        onErrorProducts: (msg) =>
                                            Fluttertoast.showToast(
                                          msg: '$msg',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 32.sp,
                                        ),
                                        onErrorCategories: (msg) =>
                                            Fluttertoast.showToast(
                                          msg: '$msg',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 32.sp,
                                        ),
                                        onErrorCustomers: (msg) =>
                                            Fluttertoast.showToast(
                                          msg: '$msg',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 32.sp,
                                        ),
                                        onErrorTransactions: (msg) =>
                                            Fluttertoast.showToast(
                                          msg: '$msg',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 32.sp,
                                        ),
                                        onErrorUsers: (msg) =>
                                            Fluttertoast.showToast(
                                          msg: '$msg',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 32.sp,
                                        ),
                                        onErrorBusinesses: (msg) =>
                                            Fluttertoast.showToast(
                                          msg: '$msg',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 32.sp,
                                        ),
                                        onErrorStatistics: (msg) =>
                                            Fluttertoast.showToast(
                                          msg: '$msg',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 32.sp,
                                        ),
                                      );
                                  },
                                  onError: (msg) {
                                    Fluttertoast.showToast(
                                      msg: '$msg',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 32.sp,
                                    );
                                  },
                                ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.resolveWith(
                                  (states) => RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                elevation: MaterialStateProperty.resolveWith(
                                    (states) => 0),
                                padding: MaterialStateProperty.resolveWith(
                                    (states) => const EdgeInsets.all(15)),
                                overlayColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.transparent),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) {
                                    if (states
                                            .contains(MaterialState.pressed) ||
                                        states
                                            .contains(MaterialState.hovered)) {
                                      return const Color(0xff4ecca3)
                                          .withOpacity(0.8);
                                    }
                                    return const Color(0xff4ecca3);
                                  },
                                ),
                                animationDuration:
                                    const Duration(microseconds: 1),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontFamily: 'vb',
                                  fontSize: 38.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => ExtendedNavigator.of(context)
                                  .push(Routes.registrationView),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.resolveWith(
                                  (states) => RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                elevation: MaterialStateProperty.resolveWith(
                                    (states) => 0),
                                padding: MaterialStateProperty.resolveWith(
                                    (states) => const EdgeInsets.all(15)),
                                overlayColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.transparent),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) {
                                    if (states
                                            .contains(MaterialState.pressed) ||
                                        states
                                            .contains(MaterialState.hovered)) {
                                      return const Color(0xffEEEEEE)
                                          .withOpacity(0.8);
                                    }
                                    return const Color(0xffEEEEEE);
                                  },
                                ),
                                animationDuration:
                                    const Duration(microseconds: 1),
                              ),
                              child: Text(
                                'Create Account',
                                style: TextStyle(
                                  fontFamily: 'vb',
                                  fontSize: 36.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontFamily: 'vr',
                                fontSize: 26.sp,
                                color: const Color(0xff4ecca3),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // s
                    ],
                  ),
                ),
              ),
              if (state.isLoggingIn || sMain.isLoadingEverything) ...[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SpinKitFoldingCube(
                        color: Color(0xff4ecca3),
                        size: 32,
                      ),
                      // const SizedBox(height: 10),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text(
                      //       'Logging in, please wait...',
                      //       style: TextStyle(
                      //         fontFamily: 'HNMed',
                      //         fontSize: 32.sp,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
