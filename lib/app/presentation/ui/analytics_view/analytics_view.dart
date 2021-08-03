import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../cubits/Main/main_cubit.dart';
import '../../widgets/navig_drawer.dart';

class AnalyticsView extends StatelessWidget {
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
              onPressed: () => Scaffold.of(context).openDrawer(),
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
                FontAwesomeIcons.bars,
                size: 22,
              ),
            ),
          ),
          title: Text(
            'Analytics',
            style: TextStyle(
              fontFamily: 'vb',
              fontSize: 36.sp,
              color: Colors.white,
            ),
          ),
          actions: [],
        ),
        drawer: const NavigDrawer(),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColorLight,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            context.read<MainCubit>()
                              ..setAnalyticDates(
                                state.analyticFromDate
                                    .subtract(const Duration(days: 1)),
                                state.analyticToDate
                                    .subtract(const Duration(days: 1)),
                              );
                            // context.read<MainCubit>()
                            //   ..getStatistics(
                            //     state.business.businessId,
                            //     '${DateFormat('yyyy-MM-dd').format(state.analyticFromDate).toString()} 00:00:00',
                            //     '${DateFormat('yyyy-MM-dd').format(state.analyticToDate).toString()} 23:59:00',
                            //     onSuccess: () {},
                            //     onError: (msg) {},
                            //   );
                          },
                          style: ButtonStyle(
                            enableFeedback: true,
                            animationDuration: const Duration(microseconds: 1),
                            overlayColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.transparent),
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.transparent),
                            foregroundColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.hovered) ||
                                  states.contains(MaterialState.pressed)) {
                                return Colors.white.withOpacity(0.5);
                              }
                              return Colors.white;
                            }),
                            padding: MaterialStateProperty.resolveWith(
                              (states) => const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 0,
                              ),
                            ),
                          ),
                          child: const Icon(
                            FontAwesomeIcons.angleLeft,
                            size: 22,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            enableFeedback: true,
                            animationDuration: const Duration(microseconds: 1),
                            overlayColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.transparent),
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.transparent),
                            foregroundColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.hovered) ||
                                  states.contains(MaterialState.pressed)) {
                                return Colors.white.withOpacity(0.5);
                              }
                              return Colors.white;
                            }),
                            padding: MaterialStateProperty.resolveWith(
                              (states) => const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 0,
                              ),
                            ),
                          ),
                          child: Text(
                            '${DateFormat.yMMMMd().format(state.analyticFromDate)}',
                            style: TextStyle(
                              fontFamily: 'vb',
                              fontSize: 36.sp,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day) ==
                                  DateTime(
                                    state.analyticFromDate.year,
                                    state.analyticFromDate.month,
                                    state.analyticFromDate.day,
                                  ))
                              ? null
                              : () {
                                  context.read<MainCubit>()
                                    ..setAnalyticDates(
                                      state.analyticFromDate
                                          .add(const Duration(days: 1)),
                                      state.analyticToDate
                                          .add(const Duration(days: 1)),
                                    );
                                  // context.read<MainCubit>()
                                  //   ..getStatistics(
                                  //     state.business.businessId,
                                  //     '${DateFormat('yyyy-MM-dd').format(state.analyticFromDate).toString()} 00:00:00',
                                  //     '${DateFormat('yyyy-MM-dd').format(state.analyticToDate).toString()} 23:59:00',
                                  //     onSuccess: () {},
                                  //     onError: (msg) {},
                                  //   );
                                },
                          style: ButtonStyle(
                            enableFeedback: true,
                            animationDuration: const Duration(microseconds: 1),
                            overlayColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.transparent),
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.transparent),
                            foregroundColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.hovered) ||
                                  states.contains(MaterialState.pressed) ||
                                  states.contains(MaterialState.disabled)) {
                                return Colors.white.withOpacity(0.5);
                              }
                              return Colors.white;
                            }),
                            padding: MaterialStateProperty.resolveWith(
                              (states) => const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 0,
                              ),
                            ),
                          ),
                          child: const Icon(
                            FontAwesomeIcons.angleRight,
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Row(
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
                                      return Colors.white.withOpacity(0.5);
                                    }
                                    return Colors.white;
                                  }),
                                  padding: MaterialStateProperty.resolveWith(
                                    (states) => const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 0,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Gross',
                                          style: TextStyle(
                                            fontFamily: 'vb',
                                            fontSize: 28.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '${state.currency}${formatter.format(state.businessStatistic.totalGross)}',
                                            style: TextStyle(
                                              fontFamily: 'vb',
                                              fontSize: 62.sp,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 3),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Requested',
                                          style: TextStyle(
                                            fontFamily: 'vr',
                                            fontSize: 24.sp,
                                          ),
                                        ),
                                        const Icon(
                                          FontAwesomeIcons.angleRight,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(color: Color(0xff243e57), thickness: 1),
                        Row(
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
                                      return Colors.white.withOpacity(0.5);
                                    }
                                    return Colors.white;
                                  }),
                                  padding: MaterialStateProperty.resolveWith(
                                    (states) => const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 0,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Revenue',
                                          style: TextStyle(
                                            fontFamily: 'vb',
                                            fontSize: 28.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '${state.currency}${formatter.format(state.businessStatistic.totalRevenue)}',
                                            style: TextStyle(
                                              fontFamily: 'vb',
                                              fontSize: 62.sp,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 3),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Requested',
                                          style: TextStyle(
                                            fontFamily: 'vr',
                                            fontSize: 24.sp,
                                          ),
                                        ),
                                        const Icon(
                                          FontAwesomeIcons.angleRight,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(color: Color(0xff243e57), thickness: 1),
                        Row(
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
                                      return Colors.white.withOpacity(0.5);
                                    }
                                    return Colors.white;
                                  }),
                                  padding: MaterialStateProperty.resolveWith(
                                    (states) => const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 0,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Transactions',
                                          style: TextStyle(
                                            fontFamily: 'vb',
                                            fontSize: 28.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '${state.businessStatistic.totalTransactions}',
                                            style: TextStyle(
                                              fontFamily: 'vb',
                                              fontSize: 62.sp,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 3),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Requested',
                                          style: TextStyle(
                                            fontFamily: 'vr',
                                            fontSize: 24.sp,
                                          ),
                                        ),
                                        const Icon(
                                          FontAwesomeIcons.angleRight,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(color: Color(0xff243e57), thickness: 1),
                        Row(
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
                                      return Colors.white.withOpacity(0.5);
                                    }
                                    return Colors.white;
                                  }),
                                  padding: MaterialStateProperty.resolveWith(
                                    (states) => const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 0,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Profits',
                                          style: TextStyle(
                                            fontFamily: 'vb',
                                            fontSize: 28.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '${state.currency}${formatter.format(state.businessStatistic.totalRevenue)}',
                                            style: TextStyle(
                                              fontFamily: 'vb',
                                              fontSize: 62.sp,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 3),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Requested',
                                          style: TextStyle(
                                            fontFamily: 'vr',
                                            fontSize: 24.sp,
                                          ),
                                        ),
                                        const Icon(
                                          FontAwesomeIcons.angleRight,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(color: Color(0xff243e57), thickness: 1),
                        Row(
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
                                      return Colors.white.withOpacity(0.5);
                                    }
                                    return Colors.white;
                                  }),
                                  padding: MaterialStateProperty.resolveWith(
                                    (states) => const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 0,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Cost',
                                          style: TextStyle(
                                            fontFamily: 'vb',
                                            fontSize: 28.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '${state.currency}${formatter.format(state.businessStatistic.totalCost)}',
                                            style: TextStyle(
                                              fontFamily: 'vb',
                                              fontSize: 62.sp,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 3),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Total costing for the time range selected.',
                                          style: TextStyle(
                                            fontFamily: 'vr',
                                            fontSize: 24.sp,
                                          ),
                                        ),
                                        const Icon(
                                          FontAwesomeIcons.angleRight,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(color: Color(0xff243e57), thickness: 1),
                        if (state.businessStatistic.productStatistics
                            .isNotEmpty) ...[
                          Row(
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
                                        return Colors.white.withOpacity(0.5);
                                      }
                                      return Colors.white;
                                    }),
                                    padding: MaterialStateProperty.resolveWith(
                                      (states) => const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 0,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Most Bought Product',
                                            style: TextStyle(
                                              fontFamily: 'vb',
                                              fontSize: 28.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '${state.businessStatistic.productStatistics.first.productName}',
                                              style: TextStyle(
                                                fontFamily: 'vb',
                                                fontSize: 62.sp,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 3),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Sold ${state.businessStatistic.productStatistics.first.soldQuantity} Pcs',
                                            style: TextStyle(
                                              fontFamily: 'vr',
                                              fontSize: 24.sp,
                                            ),
                                          ),
                                          const Icon(
                                            FontAwesomeIcons.angleRight,
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(color: Color(0xff243e57), thickness: 1),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (state.isLoadingStatistics) ...[
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
}
