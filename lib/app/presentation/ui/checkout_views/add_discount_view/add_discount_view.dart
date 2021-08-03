import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../cubits/Main/main_cubit.dart';

class AddDiscountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF0D161F),
          leading: IconButton(
            onPressed: () => ExtendedNavigator.of(context).pop(),
            icon: const FaIcon(
              FontAwesomeIcons.angleLeft,
              color: Colors.white,
              size: 25,
            ),
          ),
          title: Text(
            'Add Discount',
            style: TextStyle(
              fontFamily: 'vb',
              fontSize: 36.sp,
              color: Colors.white,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => context.read<MainCubit>()..discountInitial(),
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
                    return Colors.red.withOpacity(0.5);
                  }
                  return Colors.red;
                }),
              ),
              child: Text(
                'Clear',
                style: TextStyle(
                  fontFamily: 'vb',
                  fontSize: 28.sp,
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              height: ScreenUtil().screenHeight,
              width: ScreenUtil().screenWidth,
              decoration: const BoxDecoration(
                color: Color(0xFF0D161F),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 500.w,
                          child: TextButton(
                            onPressed: () {
                              return showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                    'Enter Amount',
                                    style: TextStyle(
                                      fontFamily: 'vb',
                                      fontSize: 42.sp,
                                    ),
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              initialValue:
                                                  '${state.discountInAmount}',
                                              style: TextStyle(
                                                fontFamily: 'vb',
                                                fontSize: 36.sp,
                                                color: Colors.black,
                                              ),
                                              decoration: InputDecoration(
                                                hintText: 'e.g 10',
                                                hintStyle: TextStyle(
                                                  fontFamily: 'vr',
                                                  fontSize: 36.sp,
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                ),
                                                prefixIcon: const Icon(
                                                  FontAwesomeIcons.moneyBill,
                                                  color: Colors.blueGrey,
                                                  size: 15,
                                                ),
                                                border:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.blueGrey,
                                                  ),
                                                ),
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.blueGrey,
                                                  ),
                                                ),
                                                disabledBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.blueGrey,
                                                  ),
                                                ),
                                              ),
                                              keyboardType: const TextInputType
                                                      .numberWithOptions(
                                                  decimal: true),
                                              inputFormatters: <
                                                  TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .allow(
                                                        RegExp(r'^\d+\.?\d*')),
                                              ],
                                              onChanged: (value) =>
                                                  context.read<MainCubit>()
                                                    ..onDiscountInAmountChanged(
                                                        value),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
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
                                  return Colors.white.withOpacity(0.5);
                                }
                                return Colors.white;
                              }),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    'Tap discount in Cash',
                                    style: TextStyle(
                                      fontFamily: 'vb',
                                      fontSize: 36.sp,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    'P${state.discountInAmount.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontFamily: 'vb',
                                      fontSize: 100.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 180.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 500.w,
                          child: TextButton(
                            onPressed: () {
                              return showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                    'Enter Percent',
                                    style: TextStyle(
                                      fontFamily: 'vb',
                                      fontSize: 42.sp,
                                    ),
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              initialValue:
                                                  '${state.discountInPercent.toStringAsFixed(2)}',
                                              style: TextStyle(
                                                fontFamily: 'vb',
                                                fontSize: 36.sp,
                                                color: Colors.black,
                                              ),
                                              decoration: InputDecoration(
                                                hintText: 'e.g 0.10%',
                                                hintStyle: TextStyle(
                                                  fontFamily: 'vr',
                                                  fontSize: 36.sp,
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                ),
                                                prefixIcon: const Icon(
                                                  FontAwesomeIcons.percentage,
                                                  color: Colors.blueGrey,
                                                  size: 15,
                                                ),
                                                border:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.blueGrey,
                                                  ),
                                                ),
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.blueGrey,
                                                  ),
                                                ),
                                                disabledBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.blueGrey,
                                                  ),
                                                ),
                                              ),
                                              keyboardType: const TextInputType
                                                      .numberWithOptions(
                                                  decimal: true),
                                              inputFormatters: <
                                                  TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .allow(
                                                        RegExp(r'^\d+\.?\d*')),
                                              ],
                                              onChanged: (value) =>
                                                  context.read<MainCubit>()
                                                    ..onDiscountInPercentChanged(
                                                        value),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
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
                                  return Colors.white.withOpacity(0.5);
                                }
                                return Colors.white;
                              }),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    'Tap discount in Percent',
                                    style: TextStyle(
                                      fontFamily: 'vb',
                                      fontSize: 36.sp,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    '${state.discountInPercent}%',
                                    style: TextStyle(
                                      fontFamily: 'vb',
                                      fontSize: 100.sp,
                                    ),
                                  ),
                                  // TextFormField(
                                  //   style: TextStyle(
                                  //     fontFamily: 'vb',
                                  //     fontSize: 36.sp,
                                  //     color: Colors.white,
                                  //   ),
                                  //   decoration: InputDecoration(
                                  //     labelText: 'Amount',
                                  //     labelStyle: TextStyle(
                                  //       fontFamily: 'vb',
                                  //       color: Colors.white.withOpacity(0.5),
                                  //       fontSize: 36.sp,
                                  //     ),
                                  //     // hintText: 'Sell by',
                                  //     // hintStyle: TextStyle(
                                  //     //   fontFamily: 'vr',
                                  //     //   fontSize: 36.sp,
                                  //     //   color: Colors.white.withOpacity(0.5),
                                  //     // ),
                                  //     prefixIcon: const Icon(
                                  //       FontAwesomeIcons.moneyBill,
                                  //       color: Colors.blueGrey,
                                  //       size: 12,
                                  //     ),
                                  //     border: const OutlineInputBorder(
                                  //       borderSide: BorderSide(
                                  //         color: Colors.blueGrey,
                                  //       ),
                                  //     ),
                                  //     enabledBorder: const OutlineInputBorder(
                                  //       borderSide: BorderSide(
                                  //         color: Colors.blueGrey,
                                  //       ),
                                  //     ),
                                  //     disabledBorder: const OutlineInputBorder(
                                  //       borderSide: BorderSide(
                                  //         color: Colors.blueGrey,
                                  //       ),
                                  //     ),
                                  //   ),
                                  //   keyboardType:
                                  //       const TextInputType.numberWithOptions(
                                  //           decimal: true),
                                  //   inputFormatters: <TextInputFormatter>[
                                  //     FilteringTextInputFormatter.allow(
                                  //         RegExp(r'^\d+\.?\d*')),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Color(0xFF0D161F),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<MainCubit>()..computeTotalAmount();
                          ExtendedNavigator.of(context).pop();
                        },
                        style: ButtonStyle(
                          enableFeedback: true,
                          animationDuration: const Duration(microseconds: 1),
                          overlayColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.transparent),
                          backgroundColor: MaterialStateProperty.resolveWith(
                            (states) {
                              if (states.contains(MaterialState.hovered) ||
                                  states.contains(MaterialState.pressed)) {
                                return Colors.blue[600];
                              }
                              return Colors.blue;
                            },
                          ),
                          padding: MaterialStateProperty.resolveWith(
                            (states) =>
                                const EdgeInsets.symmetric(vertical: 15),
                          ),
                        ),
                        child: Text(
                          'Done',
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
          ],
        ),
      ),
    );
  }
}
