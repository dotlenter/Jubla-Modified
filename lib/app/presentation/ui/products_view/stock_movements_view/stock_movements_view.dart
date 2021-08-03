import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../cubits/Main/main_cubit.dart';

class StockMovementsView extends StatelessWidget {
  final formatter = NumberFormat('#,##0.00', 'en_PH');
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) => WillPopScope(
        onWillPop: () async => !state.isLoadingStockMovements,
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
              'Stock Movement: ${state.activeStockProduct.productName}',
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
                      ElevatedButton(
                        onPressed: () {},
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style
                            .copyWith(
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
                            if (state.activeStockProduct.productUint8ListImg !=
                                null) ...[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  child: Image.memory(
                                    state
                                        .activeStockProduct.productUint8ListImg,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: List.generate(
                            state.filteredStockMovementList.length,
                            (index) => ElevatedButton(
                              onPressed: () {},
                              style: Theme.of(context)
                                  .elevatedButtonTheme
                                  .style
                                  .copyWith(
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) {
                                      if (states.contains(
                                              MaterialState.pressed) ||
                                          states.contains(
                                              MaterialState.hovered) ||
                                          states.contains(
                                              MaterialState.disabled)) {
                                        return Theme.of(context)
                                            .primaryColorLight
                                            .withOpacity(0.7);
                                      }
                                      return Theme.of(context)
                                          .primaryColorLight;
                                    }),
                                    padding: MaterialStateProperty.resolveWith(
                                      (states) => const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                    ),
                                  ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  if (state.filteredStockMovementList[index]
                                          .movementType ==
                                      1) ...[
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xff4ecca3),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          FontAwesomeIcons.angleUp,
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                  ],
                                  if (state.filteredStockMovementList[index]
                                          .movementType ==
                                      2) ...[
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xff4ecca3),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          FontAwesomeIcons.coins,
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                  ],
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
                                                  state.filteredStockMovementList[index]
                                                              .movementType ==
                                                          2
                                                      ? 'Sale: ${funWithDouble(state.filteredStockMovementList[index].quantity)}'
                                                      : 'Added: ${funWithDouble(state.filteredStockMovementList[index].quantity)}',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontFamily: 'vb',
                                                    fontSize: 36.sp,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  '${DateFormat().add_yMMMEd().add_jms().format(state.filteredStockMovementList[index].createdAtExternal)}',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontFamily: 'vr',
                                                    fontSize: 32.sp,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  '${state.filteredStockMovementList[index].fullName}',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontFamily: 'vr',
                                                    fontSize: 32.sp,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Stock',
                                            style: TextStyle(
                                              fontFamily: 'vb',
                                              fontSize: 36.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '${state.filteredStockMovementList[index].currentQuantity}',
                                            style: TextStyle(
                                              fontFamily: 'vr',
                                              fontSize: 32.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (state.isLoadingStockMovements) ...[
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

  String funWithDouble(double n) {
    return n.toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '');
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
