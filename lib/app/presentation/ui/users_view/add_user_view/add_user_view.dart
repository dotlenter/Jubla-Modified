import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../cubits/Main/main_cubit.dart';

class AddUserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) => WillPopScope(
        onWillPop: () async => !state.isCreatingUser,
        child: Scaffold(
          appBar: AppBar(
            // elevation: 0,
            backgroundColor: Theme.of(context).primaryColorLight,
            leading: IconButton(
              onPressed: () => ExtendedNavigator.of(context).pop(),
              icon: const FaIcon(
                FontAwesomeIcons.angleLeft,
                color: Colors.white,
                size: 25,
              ),
            ),
            title: Text(
              'New User',
              style: TextStyle(
                fontFamily: 'vb',
                fontSize: 36.sp,
                color: Colors.white,
              ),
            ),
          ),
          body: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                height: ScreenUtil().screenHeight,
                width: ScreenUtil().screenWidth,
                padding: const EdgeInsets.only(top: 5),
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColorDark),
                child: SingleChildScrollView(
                  child: Container(
                    margin:
                        const EdgeInsets.only(bottom: 90, right: 15, left: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  FocusScope(
                                    child: Focus(
                                      onFocusChange: (focus) => focus
                                          ? {}
                                          : {
                                              context.read<MainCubit>()
                                                ..onUIDChanged(state.uID)
                                            },
                                      child: TextFormField(
                                        textInputAction: TextInputAction.next,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        style: TextStyle(
                                          fontSize: 36.sp,
                                          fontFamily: 'vb',
                                          color: Colors.white,
                                        ),
                                        cursorColor:
                                            Theme.of(context).accentColor,
                                        decoration: InputDecoration(
                                          focusColor:
                                              Theme.of(context).accentColor,
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                            ),
                                          ),
                                          prefixIcon: const Icon(Icons.person,
                                              size: 25),
                                          labelText: 'Username or email',
                                          labelStyle: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                        // onEditingComplete: () {
                                        //   context.read<MainCubit>()
                                        //     ..onUIDChanged(state.uID);
                                        // },
                                        // onFieldSubmitted: (value) =>
                                        //     context.read<MainCubit>()
                                        //       ..onUIDChanged(value),
                                        onChanged: (value) =>
                                            context.read<MainCubit>()
                                              ..onUsernameChanged(value),
                                        validator: (value) =>
                                            state.uIDError.isEmpty
                                                ? null
                                                : state.uIDError,
                                      ),
                                    ),
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
                        const SizedBox(height: 10),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: true,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(
                            fontSize: 36.sp,
                            fontFamily: 'vb',
                          ),
                          cursorColor: Theme.of(context).accentColor,
                          decoration: InputDecoration(
                            focusColor: Theme.of(context).accentColor,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            prefixIcon:
                                const Icon(Icons.lock_rounded, size: 25),
                            labelText: 'Password',
                            labelStyle: Theme.of(context).textTheme.subtitle2,
                          ),
                          onChanged: (value) => context.read<MainCubit>()
                            ..onUserPasswordChanged(value),
                          validator: (value) => state.userPasswordError.isEmpty
                              ? null
                              : state.userPasswordError,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: TextStyle(
                            fontSize: 36.sp,
                            fontFamily: 'vb',
                          ),
                          cursorColor: Theme.of(context).accentColor,
                          decoration: InputDecoration(
                            focusColor: Theme.of(context).accentColor,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            prefixIcon: const Icon(Icons.sort_by_alpha_rounded,
                                size: 25),
                            labelText: 'Full Name',
                            labelStyle: Theme.of(context).textTheme.subtitle2,
                          ),
                          onChanged: (value) => context.read<MainCubit>()
                            ..onUserFullNameChanged(value),
                          validator: (value) => state.userFullNameError.isEmpty
                              ? null
                              : state.userFullNameError,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: TextStyle(
                            fontSize: 36.sp,
                            fontFamily: 'vb',
                          ),
                          cursorColor: Theme.of(context).accentColor,
                          decoration: InputDecoration(
                            focusColor: Theme.of(context).accentColor,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            prefixIcon:
                                const Icon(FontAwesomeIcons.userTie, size: 25),
                            labelText: 'Position',
                            labelStyle: Theme.of(context).textTheme.subtitle2,
                          ),
                          onChanged: (value) => context.read<MainCubit>()
                            ..onUserPositionChanged(value),
                          validator: (value) => state.userPositionError.isEmpty
                              ? null
                              : state.userPositionError,
                        ),
                        const SizedBox(height: 25),
                        Row(
                          children: [
                            Text(
                              'Previleges',
                              style: TextStyle(
                                fontFamily: 'vb',
                                fontSize: 32.sp,
                                color: Colors.white.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () => context.read<MainCubit>()
                                  ..setCheckoutStatus(
                                      !state.isActivatedCheckout),
                                style: ButtonStyle(
                                  enableFeedback: true,
                                  animationDuration:
                                      const Duration(microseconds: 1),
                                  overlayColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => Colors.transparent),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => Colors.transparent),
                                  foregroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) {
                                    if (states
                                            .contains(MaterialState.hovered) ||
                                        states
                                            .contains(MaterialState.pressed)) {
                                      return Colors.white.withOpacity(0.6);
                                    }
                                    return Colors.white;
                                  }),
                                  padding: MaterialStateProperty.resolveWith(
                                      (states) => EdgeInsets.zero),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Checkout',
                                      style: TextStyle(
                                        fontFamily: 'vb',
                                        fontSize: 36.sp,
                                      ),
                                    ),
                                    Switch(
                                      value: state.isActivatedCheckout,
                                      onChanged: (val) =>
                                          context.read<MainCubit>()
                                            ..setCheckoutStatus(val),
                                      inactiveThumbColor: Colors.white,
                                      inactiveTrackColor:
                                          Colors.white.withOpacity(0.6),
                                      activeColor: Colors.greenAccent,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                            thickness: 0.6,
                            color: Colors.white.withOpacity(0.7)),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () => context.read<MainCubit>()
                                  ..setProductStatus(
                                      !state.isActivatedProducts),
                                style: ButtonStyle(
                                  enableFeedback: true,
                                  animationDuration:
                                      const Duration(microseconds: 1),
                                  overlayColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => Colors.transparent),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => Colors.transparent),
                                  foregroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) {
                                    if (states
                                            .contains(MaterialState.hovered) ||
                                        states
                                            .contains(MaterialState.pressed)) {
                                      return Colors.white.withOpacity(0.6);
                                    }
                                    return Colors.white;
                                  }),
                                  padding: MaterialStateProperty.resolveWith(
                                      (states) => EdgeInsets.zero),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Products',
                                      style: TextStyle(
                                        fontFamily: 'vb',
                                        fontSize: 36.sp,
                                      ),
                                    ),
                                    Switch(
                                      value: state.isActivatedProducts,
                                      onChanged: (val) =>
                                          context.read<MainCubit>()
                                            ..setProductStatus(val),
                                      inactiveThumbColor: Colors.white,
                                      inactiveTrackColor:
                                          Colors.white.withOpacity(0.6),
                                      activeColor: Colors.greenAccent,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                            thickness: 0.6,
                            color: Colors.white.withOpacity(0.7)),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () => context.read<MainCubit>()
                                  ..setCustomerStatus(
                                      !state.isActivatedCustomers),
                                style: ButtonStyle(
                                  enableFeedback: true,
                                  animationDuration:
                                      const Duration(microseconds: 1),
                                  overlayColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => Colors.transparent),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => Colors.transparent),
                                  foregroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) {
                                    if (states
                                            .contains(MaterialState.hovered) ||
                                        states
                                            .contains(MaterialState.pressed)) {
                                      return Colors.white.withOpacity(0.6);
                                    }
                                    return Colors.white;
                                  }),
                                  padding: MaterialStateProperty.resolveWith(
                                      (states) => EdgeInsets.zero),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Customers',
                                      style: TextStyle(
                                        fontFamily: 'vb',
                                        fontSize: 36.sp,
                                      ),
                                    ),
                                    Switch(
                                      value: state.isActivatedCustomers,
                                      onChanged: (val) =>
                                          context.read<MainCubit>()
                                            ..setCustomerStatus(val),
                                      inactiveThumbColor: Colors.white,
                                      inactiveTrackColor:
                                          Colors.white.withOpacity(0.6),
                                      activeColor: Colors.greenAccent,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                            thickness: 0.6,
                            color: Colors.white.withOpacity(0.7)),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () => context.read<MainCubit>()
                                  ..setTransactionStatus(
                                      !state.isActivatedTransactions),
                                style: ButtonStyle(
                                  enableFeedback: true,
                                  animationDuration:
                                      const Duration(microseconds: 1),
                                  overlayColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => Colors.transparent),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => Colors.transparent),
                                  foregroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) {
                                    if (states
                                            .contains(MaterialState.hovered) ||
                                        states
                                            .contains(MaterialState.pressed)) {
                                      return Colors.white.withOpacity(0.6);
                                    }
                                    return Colors.white;
                                  }),
                                  padding: MaterialStateProperty.resolveWith(
                                      (states) => EdgeInsets.zero),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Transactions',
                                      style: TextStyle(
                                        fontFamily: 'vb',
                                        fontSize: 36.sp,
                                      ),
                                    ),
                                    Switch(
                                      value: state.isActivatedTransactions,
                                      onChanged: (val) =>
                                          context.read<MainCubit>()
                                            ..setTransactionStatus(val),
                                      inactiveThumbColor: Colors.white,
                                      inactiveTrackColor:
                                          Colors.white.withOpacity(0.6),
                                      activeColor: Colors.greenAccent,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                            thickness: 0.6,
                            color: Colors.white.withOpacity(0.7)),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () => context.read<MainCubit>()
                                  ..setUserStatus(!state.isActivatedUsers),
                                style: ButtonStyle(
                                  enableFeedback: true,
                                  animationDuration:
                                      const Duration(microseconds: 1),
                                  overlayColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => Colors.transparent),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => Colors.transparent),
                                  foregroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) {
                                    if (states
                                            .contains(MaterialState.hovered) ||
                                        states
                                            .contains(MaterialState.pressed)) {
                                      return Colors.white.withOpacity(0.6);
                                    }
                                    return Colors.white;
                                  }),
                                  padding: MaterialStateProperty.resolveWith(
                                      (states) => EdgeInsets.zero),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Users',
                                      style: TextStyle(
                                        fontFamily: 'vb',
                                        fontSize: 36.sp,
                                      ),
                                    ),
                                    Switch(
                                      value: state.isActivatedUsers,
                                      onChanged: (val) =>
                                          context.read<MainCubit>()
                                            ..setUserStatus(val),
                                      inactiveThumbColor: Colors.white,
                                      inactiveTrackColor:
                                          Colors.white.withOpacity(0.6),
                                      activeColor: Colors.greenAccent,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                            thickness: 0.6,
                            color: Colors.white.withOpacity(0.7)),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () => context.read<MainCubit>()
                                  ..setCalendarStatus(
                                      !state.isActivatedCalendar),
                                style: ButtonStyle(
                                  enableFeedback: true,
                                  animationDuration:
                                      const Duration(microseconds: 1),
                                  overlayColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => Colors.transparent),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => Colors.transparent),
                                  foregroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) {
                                    if (states
                                            .contains(MaterialState.hovered) ||
                                        states
                                            .contains(MaterialState.pressed)) {
                                      return Colors.white.withOpacity(0.6);
                                    }
                                    return Colors.white;
                                  }),
                                  padding: MaterialStateProperty.resolveWith(
                                      (states) => EdgeInsets.zero),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Calendar',
                                      style: TextStyle(
                                        fontFamily: 'vb',
                                        fontSize: 36.sp,
                                      ),
                                    ),
                                    Switch(
                                      value: state.isActivatedCalendar,
                                      onChanged: (val) =>
                                          context.read<MainCubit>()
                                            ..setCalendarStatus(val),
                                      inactiveThumbColor: Colors.white,
                                      inactiveTrackColor:
                                          Colors.white.withOpacity(0.6),
                                      activeColor: Colors.greenAccent,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                            thickness: 0.6,
                            color: Colors.white.withOpacity(0.7)),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () => context.read<MainCubit>()
                                  ..setMakeDiscountStatus(
                                      !state.canMakeDiscounts),
                                style: ButtonStyle(
                                  enableFeedback: true,
                                  animationDuration:
                                      const Duration(microseconds: 1),
                                  overlayColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => Colors.transparent),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => Colors.transparent),
                                  foregroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) {
                                    if (states
                                            .contains(MaterialState.hovered) ||
                                        states
                                            .contains(MaterialState.pressed)) {
                                      return Colors.white.withOpacity(0.6);
                                    }
                                    return Colors.white;
                                  }),
                                  padding: MaterialStateProperty.resolveWith(
                                      (states) => EdgeInsets.zero),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Discounts',
                                      style: TextStyle(
                                        fontFamily: 'vb',
                                        fontSize: 36.sp,
                                      ),
                                    ),
                                    Switch(
                                      value: state.canMakeDiscounts,
                                      onChanged: (val) =>
                                          context.read<MainCubit>()
                                            ..setMakeDiscountStatus(val),
                                      inactiveThumbColor: Colors.white,
                                      inactiveTrackColor:
                                          Colors.white.withOpacity(0.6),
                                      activeColor: Colors.greenAccent,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
                        child: ElevatedButton(
                          onPressed: (state.uIDError.isEmpty &&
                                  state.userFullNameError.isEmpty &&
                                  state.userPasswordError.isEmpty &&
                                  state.userPositionError.isEmpty)
                              ? () => context.read<MainCubit>()
                                ..createBusinessUser(
                                  state.business.businessId,
                                  state.uID,
                                  state.userPassword,
                                  state.userFullName,
                                  state.userPosition,
                                  state.isActivatedCheckout,
                                  state.isActivatedProducts,
                                  state.isActivatedCustomers,
                                  state.isActivatedTransactions,
                                  state.isActivatedUsers,
                                  state.isActivatedCalendar,
                                  state.canMakeDiscounts,
                                  onSuccess: () =>
                                      ExtendedNavigator.of(context).pop(),
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
                            'Create User',
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
              if (state.isCreatingUser) ...[
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
