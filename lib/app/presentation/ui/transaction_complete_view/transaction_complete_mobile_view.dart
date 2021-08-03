import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:jubla/app/presentation/routes/auto_router.gr.dart';

import '../../cubits/Main/main_cubit.dart';

class TransactionCompleteMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) => Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Transaction Complete',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'vr',
                                    fontSize: 32.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Icon(
                            FontAwesomeIcons.checkCircle,
                            color: Colors.greenAccent,
                            size: 122,
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'P${state.totalAmount.toStringAsFixed(2)}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'vb',
                                    fontSize: 72.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${DateFormat().add_yMEd().add_jm().format(DateTime.now())}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'vr',
                                    fontSize: 26.sp,
                                    color: Colors.white,
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
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    overlayColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) => Colors.transparent),
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith(
                                      (states) {
                                        if (states.contains(
                                                MaterialState.hovered) ||
                                            states.contains(
                                                MaterialState.pressed)) {
                                          return Colors.white.withOpacity(0.5);
                                        }
                                        return Colors.white;
                                      },
                                    ),
                                    animationDuration:
                                        const Duration(microseconds: 1),
                                    padding: MaterialStateProperty.resolveWith(
                                      (states) => const EdgeInsets.symmetric(
                                          vertical: 15),
                                    ),
                                  ),
                                  child: Text(
                                    'Reciept',
                                    style: TextStyle(
                                      fontFamily: 'vb',
                                      fontSize: 42.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    ExtendedNavigator.of(context)
                                        .pushAndRemoveUntil(Routes.checkoutView,
                                            (routes) => false);
                                    context.read<MainCubit>()
                                      ..checkoutInitial()
                                      ..clearCart();
                                  },
                                  style: Theme.of(context)
                                      .elevatedButtonTheme
                                      .style,
                                  child: Text(
                                    'Start new transaction',
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
