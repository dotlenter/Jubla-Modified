import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../cubits/Main/main_cubit.dart';
import '../../../routes/auto_router.gr.dart';

class AddCustomerCartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          titleSpacing: 0,
          backgroundColor: Theme.of(context).primaryColorDark,
          leading: Builder(
            builder: (context) => TextButton(
              onPressed: () {
                if (ExtendedNavigator.of(context).canPop()) {
                  ExtendedNavigator.of(context).pop();
                }
              },
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
                size: 22,
              ),
            ),
          ),
          title: Text(
            'Customers (${state.customerList.length})',
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
              decoration:
                  BoxDecoration(color: Theme.of(context).primaryColorDark),
              child: DefaultTabController(
                length: state.productList.length,
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextFormField(
                              style: TextStyle(
                                fontFamily: 'vb',
                                fontSize: 36.sp,
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Search customer',
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
                                ..onCustomerSearch(value),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(
                          bottom: 100,
                          left: 10,
                          right: 10,
                          top: 20,
                        ),
                        physics: const BouncingScrollPhysics(),
                        children: List.generate(
                          state.filteredCustomerList.length,
                          (index) => TextButton(
                            onPressed: () {
                              context.read<MainCubit>()
                                ..setCustomer(
                                    state.filteredCustomerList[index]);
                              ExtendedNavigator.of(context).pop();
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 100.h,
                                    width: 100.w,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Center(
                                      child: FaIcon(
                                        FontAwesomeIcons.user,
                                        size: 35,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  '${state.filteredCustomerList[index].customerName}',
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
                                          const SizedBox(height: 2),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  '# ${state.filteredCustomerList[index].customerPhone}',
                                                  style: TextStyle(
                                                    fontFamily: 'vr',
                                                    fontSize: 24.sp,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    FontAwesomeIcons.angleRight,
                                    size: 22,
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
            ),
            if (state.customer != null) ...[
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
                          onPressed: () {
                            context.read<MainCubit>()..removeCustomer();
                            ExtendedNavigator.of(context).pop();
                          },
                          style: Theme.of(context).elevatedButtonTheme.style,
                          child: Text(
                            'Remove (${state.customer.customerName})',
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
          ],
        ),
      ),
    );
  }
}
