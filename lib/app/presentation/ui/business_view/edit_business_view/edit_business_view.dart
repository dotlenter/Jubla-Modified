import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jubla/app/presentation/routes/auto_router.gr.dart';

import '../../../cubits/Main/main_cubit.dart';
import '../../../widgets/navig_drawer.dart';

class EditBusinessView extends StatelessWidget {
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
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
                                Expanded(
                                  child: Text(
                                    ' ${state.currentEditBusiness.businessName}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: 'vb',
                                      fontSize: 36.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (state.business.businessId ==
                              state.currentEditBusiness.businessId) ...[
                            Text(
                              'In Use',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                          ],
                          if (state.business.businessId !=
                              state.currentEditBusiness.businessId) ...[
                            Bounce(
                              onPressed: () {
                                context.read<MainCubit>()..clearCart();
                                context.read<MainCubit>()
                                  ..syncAllData(
                                    state.currentEditBusiness.businessId,
                                    state.user.userId,
                                    onSuccess: () {
                                      context.read<MainCubit>()
                                        ..setBusiness(
                                            state.currentEditBusiness);
                                      context.read<MainCubit>()
                                        ..setPage('checkout');
                                      context.read<MainCubit>()
                                        ..startListeningToBusinessMessages();
                                      ExtendedNavigator.of(context)
                                          .pushAndRemoveUntil(
                                        Routes.checkoutView,
                                        (routes) => false,
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
                              duration: const Duration(milliseconds: 100),
                              child: Text(
                                'Switch',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () => context.read<MainCubit>()
                                ..setActiveBusinessStatus(
                                    !state.isBusinessActive),
                              style: ButtonStyle(
                                enableFeedback: true,
                                animationDuration:
                                    const Duration(microseconds: 1),
                                overlayColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.transparent),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (states) => Colors.transparent),
                                foregroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.hovered) ||
                                      states.contains(MaterialState.pressed)) {
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
                                    'Active',
                                    style: TextStyle(
                                      fontFamily: 'vb',
                                      fontSize: 36.sp,
                                    ),
                                  ),
                                  Switch(
                                    value: state.isBusinessActive,
                                    onChanged: (val) =>
                                        context.read<MainCubit>()
                                          ..setActiveBusinessStatus(val),
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Code: ',
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      fontSize: 26.sp,
                                    ),
                          ),
                          Text(
                            '${state.currentEditBusiness.businessCode}',
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: Theme.of(context).primaryColor,
                                    ),
                          ),
                          const SizedBox(width: 10),
                          Bounce(
                            onPressed: () => ExtendedNavigator.of(context).push(
                              Routes.qrGenerateView,
                              arguments: QrGenerateViewArguments(
                                qrData: state.currentEditBusiness.businessCode,
                              ),
                            ),
                            duration: const Duration(milliseconds: 100),
                            child: const Icon(
                              FontAwesomeIcons.qrcode,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        initialValue: state.currentEditBusiness.businessName,
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
                        initialValue: state.currentEditBusiness.businessPhone,
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
                        initialValue:
                            state.currentEditBusiness.businessAddress1,
                        style: TextStyle(
                          fontSize: 36.sp,
                          fontFamily: 'vb',
                          color: Colors.white,
                        ),
                        cursorColor: const Color(0xFF34495e),
                        maxLines: 2,
                        maxLength: 250,
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
                          onPressed: state.business.businessId ==
                                  state.currentEditBusiness.businessId
                              ? () {
                                  return showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text(
                                        'Editing Error',
                                        style: TextStyle(
                                          fontFamily: 'vb',
                                          fontSize: 36.sp,
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                        ),
                                      ),
                                      content: Text(
                                        'Cannot edit this business, please switch'
                                        ' to other business first before editing this.',
                                        style: TextStyle(
                                          fontFamily: 'vr',
                                          fontSize: 32.sp,
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              ExtendedNavigator.of(context)
                                                  .pop(),
                                          style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty
                                                    .resolveWith((states) {
                                              if (states.contains(
                                                      MaterialState.pressed) ||
                                                  states.contains(
                                                      MaterialState.hovered)) {
                                                return Colors.red[300]
                                                    .withOpacity(0.5);
                                              }
                                              return Colors.red[300];
                                            }),
                                            animationDuration:
                                                const Duration(microseconds: 1),
                                            padding: MaterialStateProperty
                                                .resolveWith((states) =>
                                                    EdgeInsets.zero),
                                          ),
                                          child: Text(
                                            'Okay',
                                            style: TextStyle(
                                              fontFamily: 'vb',
                                              fontSize: 36.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                      actionsPadding: const EdgeInsets.only(
                                        right: 10,
                                        bottom: 5,
                                      ),
                                    ),
                                  );
                                }
                              : state.businessAddressError.isEmpty &&
                                      state.businessNameError.isEmpty &&
                                      state.businessPhoneError.isEmpty
                                  ? () {
                                      context.read<MainCubit>()
                                        ..updateBusinessInfo(
                                          state.currentEditBusiness.businessId,
                                          state.user.userId,
                                          state.businessName,
                                          state.businessPhone,
                                          state.businessAddress,
                                          '#4ecca3',
                                          state.isBusinessActive,
                                          onSuccess: () =>
                                              Fluttertoast.showToast(
                                            msg: 'Saved.',
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 26.sp,
                                          ),
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
                                        );
                                    }
                                  : null,
                          style: Theme.of(context).elevatedButtonTheme.style,
                          child: Text(
                            'Save',
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
              if (state.isLoadingEverything) ...[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D161F).withOpacity(0.8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SpinKitRing(
                        color: Colors.white,
                        size: 32,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Syncing data please wait...',
                            style: TextStyle(
                              fontFamily: 'HNMed',
                              fontSize: 46.sp,
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
