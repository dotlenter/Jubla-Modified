import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../cubits/Main/main_cubit.dart';
import '../../widgets/navig_drawer.dart';

class CalendarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) => Scaffold(
        drawer: const NavigDrawer(),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              padding: EdgeInsets.only(top: ScreenUtil().statusBarHeight),
              decoration: const BoxDecoration(
                color: Color(0xFF0D161F),
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
                              'Calendar',
                              style: TextStyle(
                                fontFamily: 'vb',
                                fontSize: 36.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
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
                            hintText: 'Search Users',
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
                            fillColor: const Color(0xFF1C3044),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ],
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
