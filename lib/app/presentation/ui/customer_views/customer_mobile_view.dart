import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../cubits/Main/main_cubit.dart';
import '../../routes/auto_router.gr.dart';
import '../../widgets/navig_drawer.dart';

class CustomerMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) => Scaffold(
        drawer: const NavigDrawer(),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              height: ScreenUtil().screenHeight,
              width: ScreenUtil().screenWidth,
              padding: EdgeInsets.only(top: ScreenUtil().statusBarHeight),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
              ),
              child: DefaultTabController(
                length: state.productList.length,
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
                                'Customers (${state.customerList.length})',
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
                              Bounce(
                                onPressed: () {
                                  context.read<MainCubit>()..customerInitial();
                                  ExtendedNavigator.of(context)
                                      .push(Routes.addCustomerView);
                                },
                                duration: const Duration(milliseconds: 100),
                                child: const Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50.h),
                    Row(
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
                              hintText: 'Search Customer',
                              hintStyle: TextStyle(
                                fontFamily: 'vr',
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
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        children: List.generate(
                          state.filteredCustomerList.length,
                          (index) => TextButton(
                            onPressed: () {},
                            child: Container(
                              margin: const EdgeInsets.only(
                                  bottom: 10, left: 5, right: 5),
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
                                                  '${state.filteredCustomerList[index].successfullTransact} Transaction(s)',
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
          ],
        ),
      ),
    );
  }
}
