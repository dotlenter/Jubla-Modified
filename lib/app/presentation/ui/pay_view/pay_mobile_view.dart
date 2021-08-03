import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../cubits/Main/main_cubit.dart';
import '../../routes/auto_router.gr.dart';

class PayMobileView extends StatelessWidget {
  final formatter = NumberFormat('#,##0.00', 'en_PH');
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) => Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
              ),
              child: Container(
                margin: const EdgeInsets.only(bottom: 90),
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

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Builder(
                                builder: (context) => Bounce(
                                  onPressed: () =>
                                      ExtendedNavigator.of(context).pop(),
                                  duration: const Duration(milliseconds: 100),
                                  child: const Icon(
                                    FontAwesomeIcons.angleLeft,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Text(
                                'Payment',
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
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: '${state.currency}',
                                      style: TextStyle(
                                        fontFamily: 'vr',
                                        fontSize: 50.sp,
                                        color: Colors.white,
                                      ),
                                      children: [
                                        TextSpan(
                                          text:
                                              '${formatter.format(state.totalAmount)}',
                                          style: TextStyle(
                                            fontFamily: 'vb',
                                            fontSize: 110.sp,
                                            color: Colors.white,
                                          ),
                                        )
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
                    Expanded(
                      flex: 5,
                      child: Container(
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context)
                                              .primaryColorLight,
                                          width: 1,
                                        ),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          context.read<MainCubit>()
                                            ..setTotalCash(
                                                state.totalAmount.toString());
                                          ExtendedNavigator.of(context).push(
                                            Routes.amountInputView,
                                            arguments: AmountInputViewArguments(
                                              paymentMethod: 'Cash',
                                            ),
                                          );
                                        },
                                        style: ButtonStyle(
                                          enableFeedback: true,
                                          animationDuration:
                                              const Duration(microseconds: 1),
                                          overlayColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) =>
                                                      Colors.transparent),
                                          backgroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) =>
                                                      Colors.transparent),
                                          foregroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) {
                                            if (states.contains(
                                                    MaterialState.hovered) ||
                                                states.contains(
                                                    MaterialState.pressed)) {
                                              return Colors.white
                                                  .withOpacity(0.6);
                                            }
                                            return Colors.white;
                                          }),
                                          padding:
                                              MaterialStateProperty.resolveWith(
                                                  (states) => EdgeInsets.zero),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                                FontAwesomeIcons.moneyBill),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Cash',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'vr',
                                                fontSize: 32.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context)
                                              .primaryColorLight,
                                          width: 1,
                                        ),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          context.read<MainCubit>()
                                            ..setTotalCash(
                                                state.totalAmount.toString());
                                          ExtendedNavigator.of(context).push(
                                            Routes.amountInputView,
                                            arguments: AmountInputViewArguments(
                                              paymentMethod: 'Debit Card',
                                            ),
                                          );
                                        },
                                        style: ButtonStyle(
                                          enableFeedback: true,
                                          animationDuration:
                                              const Duration(microseconds: 1),
                                          overlayColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) =>
                                                      Colors.transparent),
                                          backgroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) =>
                                                      Colors.transparent),
                                          foregroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) {
                                            if (states.contains(
                                                    MaterialState.hovered) ||
                                                states.contains(
                                                    MaterialState.pressed) ||
                                                states.contains(
                                                    MaterialState.disabled)) {
                                              return Colors.white
                                                  .withOpacity(0.6);
                                            }
                                            return Colors.white;
                                          }),
                                          padding:
                                              MaterialStateProperty.resolveWith(
                                                  (states) => EdgeInsets.zero),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(FontAwesomeIcons
                                                .solidCreditCard),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Debit Card',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'vr',
                                                fontSize: 32.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context)
                                              .primaryColorLight,
                                          width: 1,
                                        ),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          context.read<MainCubit>()
                                            ..setTotalCash(
                                                state.totalAmount.toString());
                                          ExtendedNavigator.of(context).push(
                                            Routes.amountInputView,
                                            arguments: AmountInputViewArguments(
                                              paymentMethod: 'Credit Card',
                                            ),
                                          );
                                        },
                                        style: ButtonStyle(
                                          enableFeedback: true,
                                          animationDuration:
                                              const Duration(microseconds: 1),
                                          overlayColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) =>
                                                      Colors.transparent),
                                          backgroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) =>
                                                      Colors.transparent),
                                          foregroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) {
                                            if (states.contains(
                                                    MaterialState.hovered) ||
                                                states.contains(
                                                    MaterialState.pressed) ||
                                                states.contains(
                                                    MaterialState.disabled)) {
                                              return Colors.white
                                                  .withOpacity(0.5);
                                            }
                                            return Colors.white;
                                          }),
                                          padding:
                                              MaterialStateProperty.resolveWith(
                                                  (states) => EdgeInsets.zero),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                                FontAwesomeIcons.creditCard),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Credit Card',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'vr',
                                                fontSize: 32.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context)
                                              .primaryColorLight,
                                          width: 1,
                                        ),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          context.read<MainCubit>()
                                            ..setTotalCash(
                                                state.totalAmount.toString());
                                          ExtendedNavigator.of(context).push(
                                            Routes.amountInputView,
                                            arguments: AmountInputViewArguments(
                                              paymentMethod: 'Check',
                                            ),
                                          );
                                        },
                                        style: ButtonStyle(
                                          enableFeedback: true,
                                          animationDuration:
                                              const Duration(microseconds: 1),
                                          overlayColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) =>
                                                      Colors.transparent),
                                          backgroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) =>
                                                      Colors.transparent),
                                          foregroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) {
                                            if (states.contains(
                                                    MaterialState.hovered) ||
                                                states.contains(
                                                    MaterialState.pressed)) {
                                              return Colors.white
                                                  .withOpacity(0.6);
                                            }
                                            return Colors.white;
                                          }),
                                          padding:
                                              MaterialStateProperty.resolveWith(
                                                  (states) => EdgeInsets.zero),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                                FontAwesomeIcons.moneyCheckAlt),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Check',
                                              style: TextStyle(
                                                fontFamily: 'vr',
                                                fontSize: 32.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context)
                                              .primaryColorLight,
                                          width: 1,
                                        ),
                                      ),
                                      child: TextButton(
                                        onPressed: null,
                                        style: ButtonStyle(
                                          enableFeedback: true,
                                          animationDuration:
                                              const Duration(microseconds: 1),
                                          overlayColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) =>
                                                      Colors.transparent),
                                          backgroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) =>
                                                      Colors.transparent),
                                          foregroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) {
                                            if (states.contains(
                                                    MaterialState.hovered) ||
                                                states.contains(
                                                    MaterialState.pressed) ||
                                                states.contains(
                                                    MaterialState.disabled)) {
                                              return Colors.white
                                                  .withOpacity(0.6);
                                            }
                                            return Colors.white;
                                          }),
                                          padding:
                                              MaterialStateProperty.resolveWith(
                                                  (states) => EdgeInsets.zero),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                                FontAwesomeIcons.userTag),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Store Credit',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'vr',
                                                fontSize: 32.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context)
                                              .primaryColorLight,
                                          width: 1,
                                        ),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          context.read<MainCubit>()
                                            ..setTotalCash(
                                                state.totalAmount.toString());
                                          ExtendedNavigator.of(context).push(
                                            Routes.amountInputView,
                                            arguments: AmountInputViewArguments(
                                              paymentMethod: 'Others',
                                            ),
                                          );
                                        },
                                        style: ButtonStyle(
                                          enableFeedback: true,
                                          animationDuration:
                                              const Duration(microseconds: 1),
                                          overlayColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) =>
                                                      Colors.transparent),
                                          backgroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) =>
                                                      Colors.transparent),
                                          foregroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) {
                                            if (states.contains(
                                                    MaterialState.hovered) ||
                                                states.contains(
                                                    MaterialState.pressed)) {
                                              return Colors.white
                                                  .withOpacity(0.6);
                                            }
                                            return Colors.white;
                                          }),
                                          padding:
                                              MaterialStateProperty.resolveWith(
                                                  (states) => EdgeInsets.zero),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                                FontAwesomeIcons.ellipsisH),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Others',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'vr',
                                                fontSize: 32.sp,
                                              ),
                                            ),
                                          ],
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
                  ],
                ),
              ),
            ),
            if (state.isSavingTransaction) ...[
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
    );
  }

  ButtonStyle btnStyle(Color color) {
    return ButtonStyle(
      overlayColor:
          MaterialStateProperty.resolveWith((states) => Colors.transparent),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.hovered) ||
              states.contains(MaterialState.pressed)) {
            return color.withOpacity(0.8);
          }
          return color;
        },
      ),
      padding: MaterialStateProperty.resolveWith(
        (states) => const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      ),
      animationDuration: const Duration(microseconds: 1),
    );
  }
}
