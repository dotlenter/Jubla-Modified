import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../cubits/Main/main_cubit.dart';

class EditProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) => WillPopScope(
        onWillPop: () async => !state.isCreatingCustomer,
        child: Scaffold(
          appBar: AppBar(
            elevation: 5,
            titleSpacing: 0,
            backgroundColor: Theme.of(context).primaryColorLight,
            leading: Builder(
              builder: (context) => TextButton(
                onPressed: () => ExtendedNavigator.of(context).pop(),
                style: ButtonStyle(
                  enableFeedback: true,
                  animationDuration: const Duration(microseconds: 1),
                  overlayColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.transparent),
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.transparent),
                  foregroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.hovered) ||
                        states.contains(MaterialState.pressed)) {
                      return Colors.white.withOpacity(0.5);
                    }
                    return Colors.white;
                  }),
                  padding: MaterialStateProperty.resolveWith(
                    (states) => EdgeInsets.zero,
                  ),
                ),
                child: const Icon(
                  FontAwesomeIcons.angleLeft,
                  size: 22,
                ),
              ),
            ),
            title: Text(
              'New Customer',
              style: TextStyle(
                fontFamily: 'vb',
                fontSize: 36.sp,
                color: Colors.white,
              ),
            ),
            actions: [],
          ),
          body: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                height: ScreenUtil().screenHeight,
                width: ScreenUtil().screenWidth,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                ),
                child: SingleChildScrollView(
                  child: DefaultTabController(
                    length: 2,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 90),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(
                                    fontFamily: 'vb',
                                    fontSize: 36.sp,
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
                                    labelText: 'Name',
                                    labelStyle:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                  onChanged: (value) =>
                                      context.read<MainCubit>()
                                        ..onCustomerNameChanged(value),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(
                                    fontFamily: 'vb',
                                    fontSize: 36.sp,
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
                                    labelText: 'Mobile',
                                    labelStyle:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+\.?\d*')),
                                  ],
                                  onChanged: (value) =>
                                      context.read<MainCubit>()
                                        ..onCustomerPhoneChanged(value),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(
                                    fontFamily: 'vb',
                                    fontSize: 36.sp,
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
                                    labelText: 'Email',
                                    labelStyle:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) =>
                                      context.read<MainCubit>()
                                        ..onCustomerEmailChanged(value),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(
                                    fontFamily: 'vb',
                                    fontSize: 36.sp,
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
                                    labelText: 'Address',
                                    labelStyle:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                  onChanged: (value) =>
                                      context.read<MainCubit>()
                                        ..onCustomerAddressChanged(value),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Bounce(
                          onPressed: () {},
                          duration: const Duration(milliseconds: 100),
                          child: ElevatedButton(
                            onPressed: () => context.read<MainCubit>()
                              ..createCustomer(
                                state.business.businessId,
                                state.customerName,
                                state.customerPhone,
                                state.customerEmail,
                                state.customerAddress,
                                onSuccess: () {
                                  if (ExtendedNavigator.of(context).canPop()) {
                                    ExtendedNavigator.of(context).pop();
                                  }
                                },
                                onError: (msg) => Fluttertoast.showToast(
                                  msg: '$msg',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 32.sp,
                                ),
                              ),
                            style: Theme.of(context).elevatedButtonTheme.style,
                            child: Text(
                              'Save Customer',
                              style: TextStyle(
                                fontFamily: 'vb',
                                fontSize: 42.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (state.isCreatingCustomer) ...[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SpinKitFadingCircle(
                        color: Colors.white,
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
