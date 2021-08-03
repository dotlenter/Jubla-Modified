import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../cubits/Main/main_cubit.dart';

class InputStockAmountView extends StatelessWidget {
  final formatter = NumberFormat('#,##0.00', 'en_PH');
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) => WillPopScope(
        onWillPop: () async => !state.isAddingStocks,
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
                  size: 24,
                ),
              ),
            ),
            title: Text(
              'On hand',
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
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                ),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 100),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                '${formatter.format(state.stockAmount)}',
                                            style: TextStyle(
                                              fontFamily: 'vb',
                                              fontSize: 106.sp,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 100.sp),
                                child: const Divider(
                                    thickness: 2, color: Colors.white),
                              ),
                              SizedBox(height: 30.h),
                              if (state.stockAmount > 0) ...[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  'On hand: ${formatter.format(state.stockAmount + double.parse(state.activeStockProduct.productQuantity))}',
                                              style: TextStyle(
                                                fontFamily: 'vr',
                                                fontSize: 36.sp,
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
                                        onPressed: () =>
                                            context.read<MainCubit>()
                                              ..onStockAmountChanged('1'),
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
                                        onPressed: () =>
                                            context.read<MainCubit>()
                                              ..onStockAmountChanged('2'),
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
                                        onPressed: () =>
                                            context.read<MainCubit>()
                                              ..onStockAmountChanged('3'),
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
                                        onPressed: () =>
                                            context.read<MainCubit>()
                                              ..onStockAmountChanged('4'),
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
                                        onPressed: () =>
                                            context.read<MainCubit>()
                                              ..onStockAmountChanged('5'),
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
                                        onPressed: () =>
                                            context.read<MainCubit>()
                                              ..onStockAmountChanged('6'),
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
                                        onPressed: () =>
                                            context.read<MainCubit>()
                                              ..onStockAmountChanged('7'),
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
                                        onPressed: () =>
                                            context.read<MainCubit>()
                                              ..onStockAmountChanged('8'),
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
                                        onPressed: () =>
                                            context.read<MainCubit>()
                                              ..onStockAmountChanged('9'),
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
                                          onPressed: () {},
                                          style: ButtonStyle(
                                            enableFeedback: true,
                                            animationDuration:
                                                const Duration(microseconds: 1),
                                            overlayColor: MaterialStateProperty
                                                .resolveWith((states) =>
                                                    Colors.transparent),
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .resolveWith((states) =>
                                                        Colors.transparent),
                                            foregroundColor:
                                                MaterialStateProperty
                                                    .resolveWith((states) {
                                              if (states.contains(
                                                      MaterialState.hovered) ||
                                                  states.contains(
                                                      MaterialState.pressed)) {
                                                return Colors.white
                                                    .withOpacity(0.6);
                                              }
                                              return Colors.white;
                                            }),
                                            padding: MaterialStateProperty
                                                .resolveWith((states) =>
                                                    EdgeInsets.zero),
                                          ),
                                          child: Container()),
                                    ),
                                    Expanded(
                                      child: TextButton(
                                        onPressed: () =>
                                            context.read<MainCubit>()
                                              ..onStockAmountChanged('0'),
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
                                        onPressed: () {
                                          context.read<MainCubit>()
                                            ..stockAmountInitial();
                                          context.read<MainCubit>()
                                            ..setStockAmount(0);
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
                                              return Colors.red
                                                  .withOpacity(0.6);
                                            }
                                            return Colors.red;
                                          }),
                                          padding:
                                              MaterialStateProperty.resolveWith(
                                                  (states) => EdgeInsets.zero),
                                        ),
                                        child: const Icon(
                                          FontAwesomeIcons.backspace,
                                          size: 22,
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
                          onPressed: (state.stockAmount > 0)
                              ? () {
                                  context.read<MainCubit>()
                                    ..addProductStocks(
                                      state.business.businessId,
                                      state.user.userId,
                                      state.activeStockProduct.productId,
                                      state.activeStockProduct.keyId,
                                      state.stockAmount,
                                      onSuccess: () {
                                        context.read<MainCubit>()
                                          ..getBusinessProducts(
                                            state.business.businessId,
                                            onSuccess: (products) {},
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
                                        ExtendedNavigator.of(context).pop();
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
                            'Add Stock',
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
              if (state.isAddingStocks) ...[
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
