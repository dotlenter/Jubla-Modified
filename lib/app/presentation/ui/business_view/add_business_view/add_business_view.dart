import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../cubits/Main/main_cubit.dart';
import '../../../widgets/navig_drawer.dart';

class AddBusinessView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) => WillPopScope(
        onWillPop: () async => !state.isCreatingBusiness,
        child: Scaffold(
          drawer: const NavigDrawer(),
          body: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: ScreenUtil().statusBarHeight,
                  right: 5,
                  left: 5,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                ),
                child: Column(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(top: 17, left: 10, right: 10),
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
                                    size: 22,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Text(
                                'Add Business',
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
                          prefixIcon: const Icon(Icons.store, size: 25),
                          labelText: 'Business Name',
                          labelStyle: Theme.of(context).textTheme.subtitle2,
                        ),
                        onChanged: (value) => context.read<MainCubit>()
                          ..onBusinessNameChanged(value),
                        validator: (value) => state.businessNameError.isEmpty
                            ? null
                            : state.businessNameError,
                      ),
                    ),
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
                          labelText: 'Phone',
                          labelStyle: Theme.of(context).textTheme.subtitle2,
                        ),
                        keyboardType: TextInputType.phone,
                        onChanged: (value) => context.read<MainCubit>()
                          ..onBusinessPhoneChanged(value),
                        validator: (value) => state.businessPhoneError.isEmpty
                            ? null
                            : state.businessPhoneError,
                      ),
                    ),
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
                          prefixIcon: const Icon(Icons.location_city, size: 25),
                          labelText: 'Address',
                          labelStyle: Theme.of(context).textTheme.subtitle2,
                        ),
                        onChanged: (value) => context.read<MainCubit>()
                          ..onBusinessAddressChanged(value),
                        validator: (value) => state.businessAddressError.isEmpty
                            ? null
                            : state.businessAddressError,
                      ),
                    ),
                  ],
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
                        child: ElevatedButton(
                          onPressed: state.businessNameError.isEmpty &&
                                  state.businessAddressError.isEmpty &&
                                  state.businessPhoneError.isEmpty
                              ? () => context.read<MainCubit>()
                                ..createBusiness(
                                  state.user.userId,
                                  state.businessName,
                                  state.businessPhone,
                                  state.businessAddress,
                                  '',
                                  onSuccess: () {
                                    if (ExtendedNavigator.of(context)
                                        .canPop()) {
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
                                )
                              : null,
                          style: Theme.of(context).elevatedButtonTheme.style,
                          child: Text(
                            'Create',
                            style: TextStyle(
                              fontFamily: 'vb',
                              fontSize: 42.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (state.isCreatingBusiness) ...[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D161F).withOpacity(0.6),
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
                      //       style: TextStyle(a
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
