import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../cubits/Main/main_cubit.dart';
import '../../widgets/navig_drawer.dart';

class TransactionsMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigDrawer(),
      body: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) => Stack(
          fit: StackFit.expand,
          children: [
            Container(
              padding: EdgeInsets.only(top: ScreenUtil().statusBarHeight),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
              ),
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(top: 17, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Builder(
                              builder: (context) => Bounce(
                                onPressed: () =>
                                    Scaffold.of(context).openDrawer(),
                                duration: const Duration(milliseconds: 100),
                                child: const Icon(
                                  FontAwesomeIcons.bars,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Text(
                              'Transactions (${state.filteredTransactionList.length})',
                              style: TextStyle(
                                fontFamily: 'vb',
                                fontSize: 36.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            // TextButton(
                            //   onPressed: () {},
                            //   style: ButtonStyle(
                            //     enableFeedback: true,
                            //     animationDuration:
                            //         const Duration(microseconds: 1),
                            //     overlayColor: MaterialStateProperty.resolveWith(
                            //         (states) => Colors.transparent),
                            //     backgroundColor:
                            //         MaterialStateProperty.resolveWith(
                            //             (states) => Colors.transparent),
                            //     foregroundColor:
                            //         MaterialStateProperty.resolveWith((states) {
                            //       if (states.contains(MaterialState.hovered) ||
                            //           states.contains(MaterialState.pressed)) {
                            //         return Colors.white.withOpacity(0.8);
                            //       }
                            //       return Colors.white;
                            //     }),
                            //   ),
                            //   child: const Icon(
                            //     FontAwesomeIcons.upload,
                            //     size: 22,
                            //   ),
                            // ),
                            Bounce(
                              onPressed: () => context.read<MainCubit>()
                                ..getBusinessTransactions(
                                  state.business.businessId,
                                  onSuccess: () {},
                                  onError: (msg) {},
                                ),
                              duration: const Duration(milliseconds: 100),
                              child: const Icon(
                                FontAwesomeIcons.redoAlt,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(
                            fontFamily: 'vb',
                            fontSize: 36.sp,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              fontFamily: 'vb',
                              fontSize: 36.sp,
                              color: Colors.white.withOpacity(0.5),
                            ),
                            prefixIcon: const Icon(
                              FontAwesomeIcons.search,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Theme.of(context).primaryColorLight,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (value) => context.read<MainCubit>()
                            ..onCategorySearch(value),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: List.generate(
                        state.filteredTransactionList.length,
                        (index) => TextButton(
                          onPressed: () {},
                          style: Theme.of(context).textButtonTheme.style,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'P${state.filteredTransactionList[index].totalAmount.toStringAsFixed(2)}',
                                          style: TextStyle(
                                            fontFamily: 'vb',
                                            fontSize: 46.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '${DateFormat().add_yMd().format(DateTime.parse(state.filteredTransactionList[index].createdAtExternal))}',
                                      style: TextStyle(
                                        fontFamily: 'vb',
                                        fontSize: 32.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      '${makeDoublesEasy(state.filteredTransactionList[index].transactionDetailsList.fold(0, (sum, item) => sum + item.quantity))}',
                                      style: TextStyle(
                                        fontFamily: 'vr',
                                        fontSize: 32.sp,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      'Items',
                                      style: TextStyle(
                                        fontFamily: 'vb',
                                        fontSize: 32.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      'by',
                                      style: TextStyle(
                                        fontFamily: 'vr',
                                        fontSize: 32.sp,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      '${state.filteredTransactionList[index].createdBy}',
                                      style: TextStyle(
                                        fontFamily: 'vr',
                                        fontSize: 32.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // if (state.isLoadingTransactions) ...[
            //   Container(
            //     decoration: BoxDecoration(
            //       color: const Color(0xFF0D161F).withOpacity(0.6),
            //     ),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         const SpinKitFadingCircle(
            //           color: Colors.white,
            //           size: 32,
            //         ),
            //         // const SizedBox(height: 10),
            //         // Row(
            //         //   mainAxisAlignment: MainAxisAlignment.center,
            //         //   children: [
            //         //     Text(
            //         //       'Logging in, please wait...',
            //         //       style: TextStyle(
            //         //         fontFamily: 'HNMed',
            //         //         fontSize: 32.sp,
            //         //       ),
            //         //     ),
            //         //   ],
            //         // ),
            //       ],
            //     ),
            //   ),
            // ],
          ],
        ),
      ),
    );
  }

  String makeDoublesEasy(double n) {
    if (n == n.floor()) {
      return '${n.floor()}';
    }
    if (n == n.round()) {
      return '${n.round()}';
    }
    return '$n';
  }
}
