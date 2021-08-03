import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../cubits/Auth/auth_cubit.dart';
import '../../cubits/Main/main_cubit.dart';
import '../../routes/auto_router.gr.dart';

class RegistrationMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) => BlocBuilder<MainCubit, MainState>(
          builder: (mCt, mSt) => Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                ),
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: ScreenUtil().statusBarHeight + 15,
                          bottom: 15,
                          right: 10,
                          left: 10,
                        ),
                        // margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          // color: Theme.of(context).primaryColorDark,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                0,
                                3,
                              ), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Builder(
                                  builder: (context) => Bounce(
                                    onPressed: () {
                                      if (ExtendedNavigator.of(context)
                                          .canPop()) {
                                        ExtendedNavigator.of(context).pop();
                                      }
                                    },
                                    duration: const Duration(milliseconds: 100),
                                    child: const Icon(
                                      FontAwesomeIcons.angleLeft,
                                      color: Colors.white,
                                      size: 26,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Text(
                                  'Register',
                                  style: TextStyle(
                                    fontFamily: 'vb',
                                    fontSize: 36.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    style: TextStyle(
                                      fontSize: 36.sp,
                                      fontFamily: 'vb',
                                      color: Colors.white,
                                    ),
                                    cursorColor: const Color(0xFF34495e),
                                    decoration: InputDecoration(
                                      focusColor: Theme.of(context).accentColor,
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      errorStyle: TextStyle(
                                        color: Colors.red[200],
                                        fontFamily: 'vr',
                                      ),
                                      prefixIcon:
                                          const Icon(Icons.person, size: 25),
                                      labelText: 'Email',
                                      labelStyle:
                                          Theme.of(context).textTheme.subtitle2,
                                    ),
                                    onChanged: (value) =>
                                        context.read<AuthCubit>()
                                          ..onRegUsernameChanged(value),
                                    validator: (value) =>
                                        state.regUserNameError.isEmpty
                                            ? null
                                            : state.regUserNameError,
                                  ),
                                  Positioned(
                                    top: 5,
                                    right: 5,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: state.isCheckingUid
                                          ? const SpinKitRing(
                                              size: 22,
                                              color: Colors.grey,
                                            )
                                          : null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: TextStyle(
                            fontSize: 36.sp,
                            fontFamily: 'vb',
                            color: Colors.white,
                          ),
                          cursorColor: const Color(0xFF34495e),
                          decoration: InputDecoration(
                            focusColor: Theme.of(context).accentColor,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            errorStyle: TextStyle(
                              color: Colors.red[200],
                              fontFamily: 'vr',
                            ),
                            prefixIcon: const Icon(Icons.phone, size: 25),
                            labelText: 'Phone Number',
                            labelStyle: Theme.of(context).textTheme.subtitle2,
                          ),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (value) => context.read<AuthCubit>()
                            ..onRegPhoneChanged(value),
                          validator: (value) => state.regPhoneError.isEmpty
                              ? null
                              : state.regPhoneError,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          obscureText: true,
                          obscuringCharacter: '*',
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: TextStyle(
                            fontSize: 36.sp,
                            fontFamily: 'vb',
                            color: Colors.white,
                          ),
                          cursorColor: const Color(0xFF34495e),
                          decoration: InputDecoration(
                            focusColor: Theme.of(context).accentColor,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            errorStyle: TextStyle(
                              color: Colors.red[200],
                              fontFamily: 'vr',
                            ),
                            prefixIcon:
                                const Icon(Icons.lock_outline, size: 25),
                            labelText: 'Password',
                            labelStyle: Theme.of(context).textTheme.subtitle2,
                          ),
                          onChanged: (value) => context.read<AuthCubit>()
                            ..onRegPasswordChanged(value),
                          validator: (value) => state.regPasswordError.isEmpty
                              ? null
                              : state.regPasswordError,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: TextStyle(
                            fontSize: 36.sp,
                            fontFamily: 'vb',
                            color: Colors.white,
                          ),
                          cursorColor: const Color(0xFF34495e),
                          decoration: InputDecoration(
                            focusColor: Theme.of(context).accentColor,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            errorStyle: TextStyle(
                              color: Colors.red[200],
                              fontFamily: 'vr',
                            ),
                            prefixIcon: const Icon(Icons.sort_by_alpha_outlined,
                                size: 25),
                            labelText: 'Full Name',
                            labelStyle: Theme.of(context).textTheme.subtitle2,
                          ),
                          onChanged: (value) => context.read<AuthCubit>()
                            ..onRegFullNameChanged(value),
                          validator: (value) => state.regFullNameError.isEmpty
                              ? null
                              : state.regFullNameError,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: (state.regFullNameError.isEmpty &&
                                        state.regPasswordError.isEmpty &&
                                        state.regPhoneError.isEmpty &&
                                        state.regUserNameError.isEmpty)
                                    ? () => context.read<AuthCubit>()
                                      ..registerSimple(
                                        state.regUserName,
                                        state.regPhone,
                                        state.regPassword,
                                        state.regFullName,
                                        onSuccess: (user) {
                                          context.read<MainCubit>()
                                            ..setUser(user);
                                          context.read<MainCubit>()
                                            ..setBusiness(
                                                user.businesses.first);
                                          context.read<MainCubit>()
                                            ..syncAllData(
                                              user.businesses.first.businessId,
                                              user.userId,
                                              onSuccess: () {
                                                context.read<MainCubit>()
                                                  ..setPage('checkout');
                                                context.read<MainCubit>()
                                                  ..checkoutInitial();
                                                context.read<MainCubit>()
                                                  ..removeCustomer();
                                                ExtendedNavigator.of(context)
                                                    .pushAndRemoveUntil(
                                                  Routes.checkoutView,
                                                  (route) => false,
                                                  arguments:
                                                      CheckoutViewArguments(
                                                    user: user,
                                                  ),
                                                );
                                              },
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
                                            );
                                        },
                                        onError: (msg) =>
                                            Fluttertoast.showToast(
                                          msg: '$msg',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 32.sp,
                                        ),
                                      )
                                    : () {
                                        return showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text(
                                              'Some fields are invalid.',
                                              style: TextStyle(
                                                fontFamily: 'vb',
                                                fontSize: 36.sp,
                                                color: Colors.black,
                                              ),
                                            ),
                                            content: Text(
                                              'Please check your information for invalid data.',
                                              style: TextStyle(
                                                fontFamily: 'vr',
                                                fontSize: 32.sp,
                                                color: Colors.black,
                                              ),
                                            ),
                                            actions: [
                                              Bounce(
                                                onPressed: () =>
                                                    ExtendedNavigator.of(
                                                            context)
                                                        .pop(),
                                                duration: const Duration(
                                                    milliseconds: 100),
                                                child: Text(
                                                  'Okay',
                                                  style: TextStyle(
                                                    fontFamily: 'vb',
                                                    fontSize: 36.sp,
                                                    color:
                                                        const Color(0xff4ecca3),
                                                  ),
                                                ),
                                              ),
                                            ],
                                            actionsPadding:
                                                const EdgeInsets.only(
                                              right: 10,
                                              bottom: 10,
                                            ),
                                          ),
                                        );
                                      },
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
                                  overlayColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => Colors.transparent),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                    (states) {
                                      if (states.contains(
                                              MaterialState.pressed) ||
                                          states.contains(
                                              MaterialState.hovered)) {
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
                                  'Create',
                                  style: TextStyle(
                                    fontFamily: 'vb',
                                    fontSize: 36.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (state.isCreatingAcct || mSt.isLoadingEverything) ...[
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark.withOpacity(0.7),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SpinKitFadingCircle(
                        color: Colors.white,
                        size: 32,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Creating your account...',
                            style: TextStyle(
                              fontFamily: 'vb',
                              fontSize: 32.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
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
