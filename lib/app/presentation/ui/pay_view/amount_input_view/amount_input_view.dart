import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../../domain/entities/Transaction/Transaction.dart';
import '../../../cubits/Main/main_cubit.dart';
import '../../../routes/auto_router.gr.dart';

class AmountInputView extends StatelessWidget {
  final String paymentMethod;
  final formatter = NumberFormat('#,##0.00', 'en_PH');
  AmountInputView({Key key, this.paymentMethod}) : super(key: key);

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
                margin: const EdgeInsets.only(bottom: 100),
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
                        color: Theme.of(context).primaryColorLight,
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
                                'Payment: $paymentMethod',
                                style: TextStyle(
                                  fontFamily: 'vb',
                                  fontSize: 36.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '${state.currency}${formatter.format(state.totalCash)}',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontFamily: 'vb',
                                      fontSize: 28.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'AMOUNT RECIEVED',
                                  style: TextStyle(
                                    fontFamily: 'vb',
                                    fontSize: 36.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: '${state.currency}',
                                      style: TextStyle(
                                        fontFamily: 'vr',
                                        fontSize: 50.sp,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      children: [
                                        TextSpan(
                                          text:
                                              '${formatter.format(state.totalCash)}',
                                          style: TextStyle(
                                            fontFamily: 'vb',
                                            fontSize: 100.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30.h),
                            if (state.totalCash < state.totalAmount) ...[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        text: 'Balance: ',
                                        style: TextStyle(
                                          fontFamily: 'vr',
                                          fontSize: 32.sp,
                                          color: Colors.white,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                '${state.currency}${formatter.format(state.totalAmount - state.totalCash)}',
                                            style: const TextStyle(
                                              fontFamily: 'vb',
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            if (state.totalCash > state.totalAmount) ...[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        text: 'Change: ',
                                        style: TextStyle(
                                          fontFamily: 'vr',
                                          fontSize: 32.sp,
                                          color: Colors.white,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                '${state.currency}${formatter.format(state.totalChange)}',
                                            style: const TextStyle(
                                              fontFamily: 'vb',
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () => context.read<MainCubit>()
                                        ..onTotalCashChanged('1'),
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
                                      child: Text(
                                        '1',
                                        style: TextStyle(
                                          fontFamily: 'vb',
                                          fontSize: 62.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () => context.read<MainCubit>()
                                        ..onTotalCashChanged('2'),
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
                                      child: Text(
                                        '2',
                                        style: TextStyle(
                                          fontFamily: 'vb',
                                          fontSize: 62.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () => context.read<MainCubit>()
                                        ..onTotalCashChanged('3'),
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
                                      child: Text(
                                        '3',
                                        style: TextStyle(
                                          fontFamily: 'vb',
                                          fontSize: 62.sp,
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
                                    child: TextButton(
                                      onPressed: () => context.read<MainCubit>()
                                        ..onTotalCashChanged('4'),
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
                                      child: Text(
                                        '4',
                                        style: TextStyle(
                                          fontFamily: 'vb',
                                          fontSize: 62.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () => context.read<MainCubit>()
                                        ..onTotalCashChanged('5'),
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
                                      child: Text(
                                        '5',
                                        style: TextStyle(
                                          fontFamily: 'vb',
                                          fontSize: 62.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () => context.read<MainCubit>()
                                        ..onTotalCashChanged('6'),
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
                                      child: Text(
                                        '6',
                                        style: TextStyle(
                                          fontFamily: 'vb',
                                          fontSize: 62.sp,
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
                                    child: TextButton(
                                      onPressed: () => context.read<MainCubit>()
                                        ..onTotalCashChanged('7'),
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
                                      child: Text(
                                        '7',
                                        style: TextStyle(
                                          fontFamily: 'vb',
                                          fontSize: 62.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () => context.read<MainCubit>()
                                        ..onTotalCashChanged('8'),
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
                                      child: Text(
                                        '8',
                                        style: TextStyle(
                                          fontFamily: 'vb',
                                          fontSize: 62.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () => context.read<MainCubit>()
                                        ..onTotalCashChanged('9'),
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
                                      child: Text(
                                        '9',
                                        style: TextStyle(
                                          fontFamily: 'vb',
                                          fontSize: 62.sp,
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
                                    child: TextButton(
                                      onPressed: () => context.read<MainCubit>()
                                        ..onTotalCashChanged('.'),
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
                                      child: Text(
                                        '.',
                                        style: TextStyle(
                                          fontFamily: 'vb',
                                          fontSize: 62.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () => context.read<MainCubit>()
                                        ..onTotalCashChanged('0'),
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
                                      child: Text(
                                        '0',
                                        style: TextStyle(
                                          fontFamily: 'vb',
                                          fontSize: 62.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () => context.read<MainCubit>()
                                        ..cashInitial(),
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
                                          if (states.contains(
                                                  MaterialState.hovered) ||
                                              states.contains(
                                                  MaterialState.pressed)) {
                                            return Colors.red.withOpacity(0.6);
                                          }
                                          return Colors.red;
                                        }),
                                        padding:
                                            MaterialStateProperty.resolveWith(
                                                (states) => EdgeInsets.zero),
                                      ),
                                      child: Text(
                                        'Clear',
                                        style: TextStyle(
                                          fontFamily: 'vb',
                                          fontSize: 36.sp,
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
                        onPressed: state.totalCash >= state.totalAmount
                            ? () {
                                var uuid = Uuid();
                                var keyId = uuid.v4();
                                context.read<MainCubit>()
                                  ..saveTransaction(
                                    Transaction(
                                      businessId: state.business.businessId,
                                      userId: state.user.userId,
                                      keyId: keyId,
                                      customerId: state.customer != null
                                          ? state.customer.customerId
                                          : 0,
                                      totalAmount: state.totalAmount,
                                      totalCash: state.totalCash,
                                      totalChange: state.totalChange,
                                      discountInCash: state.discountInAmount,
                                      discountInPercent:
                                          state.discountInPercent,
                                      isCancelled: false,
                                      paymentMethod: '$paymentMethod',
                                      transactionNote: state.transactionNote,
                                      transactionDetailsList:
                                          state.curTransactionDetails,
                                      cancelledBy: 'N/A',
                                      createdBy: state.user.fullName,
                                    ),
                                    onSuccess: () {
                                      ExtendedNavigator.of(context)
                                          .pushAndRemoveUntil(
                                        Routes.transactionCompleteView,
                                        (routes) => false,
                                      );
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
                                  );
                              }
                            : null,
                        style: Theme.of(context).elevatedButtonTheme.style,
                        child: Text(
                          'Charge',
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
            if (state.isSavingTransaction) ...[
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      height: 200.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: SpinKitCircle(
                          size: 46,
                          color: Color(0xFF0D161F),
                        ),
                      ),
                    ),
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
