import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../cubits/Main/main_cubit.dart';

class EditCartQuantityView extends StatelessWidget {
  // final TextEditingController customQuantityCtrlr = TextEditingController();
  final formatter = NumberFormat('#,##0.00', 'en_PH');
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) => Scaffold(
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
            '${state.cartItem.productName} Quantity',
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
                                Text(
                                  'Quantity',
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
                                      children: [
                                        TextSpan(
                                          text:
                                              '${formatter.format(state.itemQuantity)}',
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
                                        ..onCartItemQtyChanged('1'),
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
                                        ..onCartItemQtyChanged('2'),
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
                                        ..onCartItemQtyChanged('3'),
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
                                        ..onCartItemQtyChanged('4'),
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
                                        ..onCartItemQtyChanged('5'),
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
                                        ..onCartItemQtyChanged('6'),
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
                                        ..onCartItemQtyChanged('7'),
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
                                        ..onCartItemQtyChanged('8'),
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
                                        ..onCartItemQtyChanged('9'),
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
                                        onPressed: () {},
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
                                        child: Container()),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () => context.read<MainCubit>()
                                        ..onCartItemQtyChanged('0'),
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
                                      onPressed: () {
                                        context.read<MainCubit>()
                                          ..cartItemQtyInitial();
                                        context.read<MainCubit>()
                                          ..setCartItemQty(
                                              state.cartItem.quantity);
                                      },
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
                                        'Reset',
                                        textAlign: TextAlign.center,
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
                        onPressed: (state.itemQuantity > 0)
                            ? () {
                                context.read<MainCubit>()
                                  ..editProductCartQty(
                                    state.cartItem,
                                    state.itemQuantity,
                                  );
                                context.read<MainCubit>()
                                  ..selectedCartItemIndexInitial();
                                if (ExtendedNavigator.of(context).canPop()) {
                                  ExtendedNavigator.of(context).pop();
                                }
                              }
                            : null,
                        style: Theme.of(context).elevatedButtonTheme.style,
                        child: Text(
                          'Apply Quantity',
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
