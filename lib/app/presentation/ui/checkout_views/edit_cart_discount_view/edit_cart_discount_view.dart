import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../cubits/Main/main_cubit.dart';

class EditCartDiscountView extends StatelessWidget {
  final TextEditingController _amountTextController = TextEditingController();
  final TextEditingController _percentTextController = TextEditingController();
  final formatter = NumberFormat('#,##0.00', 'en_PH');
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          elevation: 0,
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
            '${state.cartItem.productName}',
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
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Cash Discount',
                          style: TextStyle(
                            fontFamily: 'vb',
                            fontSize: 36.sp,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 100.w,
                            ),
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              textInputAction: TextInputAction.done,
                              style: TextStyle(
                                fontSize: 36.sp,
                                fontFamily: 'vb',
                                color: Colors.white,
                              ),
                              initialValue: state.itemDiscountInCash <= 0
                                  ? ''
                                  : '${formatter.format(state.itemDiscountInCash)}',
                              cursorColor: Theme.of(context).accentColor,
                              decoration: InputDecoration(
                                focusColor: Theme.of(context).accentColor,
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                hintText: state.itemDiscountInCash > 0
                                    ? '${formatter.format(state.itemDiscountInCash)}'
                                    : 'AMOUNT',
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(
                                      fontSize: 36.sp,
                                    ),
                              ),
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^\d+\.?\d*')),
                              ],
                              onChanged: (value) => context.read<MainCubit>()
                                ..onCartItemDiscountInCashChanged(value),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 180.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Percent Discount',
                          style: TextStyle(
                            fontFamily: 'vb',
                            fontSize: 36.sp,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 100.w,
                            ),
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              textInputAction: TextInputAction.done,
                              style: TextStyle(
                                fontSize: 36.sp,
                                fontFamily: 'vb',
                                color: Colors.white,
                              ),
                              initialValue: state.itemDiscountInPercent <= 0
                                  ? ''
                                  : '${formatter.format(state.itemDiscountInPercent)}',
                              cursorColor: Theme.of(context).accentColor,
                              decoration: InputDecoration(
                                focusColor: Theme.of(context).accentColor,
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                hintText: state.itemDiscountInPercent > 0
                                    ? '${formatter.format(state.itemDiscountInPercent)}'
                                    : 'PERCENTAGE',
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(
                                      fontSize: 36.sp,
                                    ),
                              ),
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^\d+\.?\d*')),
                              ],
                              onChanged: (value) => context.read<MainCubit>()
                                ..onCartItemDiscountInPercentChanged(value),
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
                          context.read<MainCubit>()
                            ..editProductCartDiscount(
                              state.cartItem,
                              state.itemDiscountInCash,
                              state.itemDiscountInPercent,
                            );
                          context.read<MainCubit>()
                            ..selectedCartItemIndexInitial();
                          if (ExtendedNavigator.of(context).canPop()) {
                            ExtendedNavigator.of(context).pop();
                          }
                        },
                        style: Theme.of(context).elevatedButtonTheme.style,
                        child: Text(
                          'Apply Discount',
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
