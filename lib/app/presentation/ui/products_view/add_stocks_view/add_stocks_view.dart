import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jubla/app/presentation/routes/auto_router.gr.dart';

import '../../../cubits/Main/main_cubit.dart';

class AddStocksView extends StatelessWidget {
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
                  size: 24,
                ),
              ),
            ),
            title: Text(
              '${state.activeStockProduct.productName}',
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
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 300.h),
                    TextButton(
                      onPressed: () {
                        context.read<MainCubit>()..stockAmountInitial();
                        context.read<MainCubit>()
                          ..setStockAmount(double.parse(
                              state.activeStockProduct.productMinQty));
                        ExtendedNavigator.of(context)
                            .push(Routes.inputStockAmountView);
                      },
                      style: Theme.of(context).textButtonTheme.style.copyWith(
                        foregroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed) ||
                              states.contains(MaterialState.hovered)) {
                            if (double.parse(
                                    state.activeStockProduct.productQuantity) <
                                double.parse(
                                    state.activeStockProduct.productMinQty)) {
                              return Colors.amber.withOpacity(0.7);
                            }
                            if (double.parse(
                                    state.activeStockProduct.productQuantity) <=
                                0) {
                              return Colors.red.withOpacity(0.7);
                            }
                            return Colors.white.withOpacity(0.7);
                          }
                          if (double.parse(
                                  state.activeStockProduct.productQuantity) <
                              double.parse(
                                  state.activeStockProduct.productMinQty)) {
                            return Colors.amber;
                          }
                          if (double.parse(
                                  state.activeStockProduct.productQuantity) <=
                              0) {
                            return Colors.red;
                          }
                          return Colors.white;
                        }),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'On hand',
                                style: TextStyle(
                                  fontFamily: 'vb',
                                  fontSize: 56.sp,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${state.activeStockProduct.productQuantity}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'vb',
                                    fontSize: 146.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 100.w),
                            child: const Divider(
                                thickness: 2, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        context.read<MainCubit>()
                          ..getProductStockMovements(
                            state.activeStockProduct.productId,
                            onSuccess: () {},
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
                        ExtendedNavigator.of(context)
                            .push(Routes.stockMovementsView);
                      },
                      style:
                          Theme.of(context).elevatedButtonTheme.style.copyWith(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed) ||
                                      states.contains(MaterialState.hovered) ||
                                      states.contains(MaterialState.disabled)) {
                                    return Theme.of(context)
                                        .primaryColorLight
                                        .withOpacity(0.7);
                                  }
                                  return Theme.of(context).primaryColorLight;
                                }),
                                padding: MaterialStateProperty.resolveWith(
                                  (states) => const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                ),
                              ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      FontAwesomeIcons.warehouse,
                                      size: 22,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Stock Movement',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontFamily: 'vr',
                                                  fontSize: 36.sp,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            FontAwesomeIcons.angleRight,
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style:
                          Theme.of(context).elevatedButtonTheme.style.copyWith(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed) ||
                                      states.contains(MaterialState.hovered) ||
                                      states.contains(MaterialState.disabled)) {
                                    return Theme.of(context)
                                        .primaryColorLight
                                        .withOpacity(0.7);
                                  }
                                  return Theme.of(context).primaryColorLight;
                                }),
                                padding: MaterialStateProperty.resolveWith(
                                  (states) => const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                ),
                              ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.orange,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      FontAwesomeIcons.boxes,
                                      size: 22,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Minimum: ${state.activeStockProduct.productMinQty}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontFamily: 'vr',
                                                  fontSize: 36.sp,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            FontAwesomeIcons.angleRight,
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
