import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../cubits/Main/main_cubit.dart';
import '../../../routes/auto_router.gr.dart';
import '../../../widgets/navig_drawer.dart';

class BusinessPartnerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) => WillPopScope(
        onWillPop: () async => !state.isCreatingBusiness,
        child: Scaffold(
          drawer: const NavigDrawer(),
          body: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                height: ScreenUtil().screenHeight,
                width: ScreenUtil().screenWidth,
                padding: EdgeInsets.only(
                  top: ScreenUtil().statusBarHeight,
                  right: 5,
                  left: 5,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                ),
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.only(top: 17, left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Builder(
                                  builder: (context) => Bounce(
                                    onPressed: () {
                                      if (ExtendedNavigator.of(context)
                                          .canPop()) {
                                        ExtendedNavigator.of(context).pop();
                                      }
                                    },
                                    duration: const Duration(milliseconds: 100),
                                    child: const Icon(
                                      FontAwesomeIcons.angleLeft,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Text(
                                  'Partner Business',
                                  style: TextStyle(
                                    fontFamily: 'vb',
                                    fontSize: 36.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Bounce(
                              onPressed: () {
                                context.read<MainCubit>()..businessInitial();
                                context.read<MainCubit>()..partnerInitial();
                                ExtendedNavigator.of(context).push(
                                  Routes.businessCodeScannerView,
                                );
                              },
                              duration: const Duration(milliseconds: 100),
                              child: const Icon(
                                FontAwesomeIcons.qrcode,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.0),
                                border: Border(
                                  bottom: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                              child: TabBar(
                                indicatorColor: Theme.of(context).accentColor,
                                indicatorWeight: 4,
                                unselectedLabelColor: Colors.grey,
                                isScrollable: true,
                                labelStyle:
                                    Theme.of(context).textTheme.bodyText2,
                                tabs: [
                                  const Tab(text: 'Your Access'),
                                  const Tab(text: 'Requests'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: TabBarView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Container(),
                            Container(
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  if (state.partnerRequestList.isNotEmpty) ...[
                                    Container(
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  style: TextStyle(
                                                    fontFamily: 'vb',
                                                    fontSize: 36.sp,
                                                    color: Colors.white,
                                                  ),
                                                  cursorColor: Theme.of(context)
                                                      .primaryColor,
                                                  decoration: InputDecoration(
                                                    hintText: 'Search requests',
                                                    hintStyle: TextStyle(
                                                      fontFamily: 'vr',
                                                      fontSize: 36.sp,
                                                      color: Colors.white
                                                          .withOpacity(0.5),
                                                    ),
                                                    prefixIcon: const Icon(
                                                      FontAwesomeIcons.search,
                                                      color: Colors.white,
                                                    ),
                                                    filled: true,
                                                    fillColor: Theme.of(context)
                                                        .primaryColorLight,
                                                    border:
                                                        const OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                  ),
                                                  onChanged: (value) {},
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: state
                                                  .partnerRequestList.length,
                                              itemBuilder: (context, index) =>
                                                  Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 5,
                                                ),
                                                padding: const EdgeInsets.only(
                                                  top: 10,
                                                  bottom: 15,
                                                  right: 10,
                                                  left: 10,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .primaryColorLight,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            state
                                                                .partnerRequestList[
                                                                    index]
                                                                .businessName,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline1,
                                                          ),
                                                        ),
                                                        Text(
                                                          '${timeAgo(state.partnerRequestList[index].createdAtExternal.toIso8601String())}',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .subtitle1,
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            '${state.partnerRequestList[index].fullName} ',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyText1
                                                                .copyWith(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          'wants to partner with your business.',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1,
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5.0),
                                                            child:
                                                                ElevatedButton(
                                                              onPressed: () =>
                                                                  context.read<
                                                                      MainCubit>()
                                                                    ..acceptPartnerRequest(
                                                                      state.user
                                                                          .userId,
                                                                      int.parse(state
                                                                          .partnerRequestList[
                                                                              index]
                                                                          .partnerRequestId),
                                                                      int.parse(state
                                                                          .partnerRequestList[
                                                                              index]
                                                                          .partnerUserId),
                                                                      int.parse(state
                                                                          .partnerRequestList[
                                                                              index]
                                                                          .businessId),
                                                                      onSuccess:
                                                                          () =>
                                                                              Fluttertoast.showToast(
                                                                        msg:
                                                                            'Accepted Request',
                                                                        toastLength:
                                                                            Toast.LENGTH_SHORT,
                                                                        gravity:
                                                                            ToastGravity.CENTER,
                                                                        timeInSecForIosWeb:
                                                                            1,
                                                                        backgroundColor:
                                                                            Colors.red,
                                                                        textColor:
                                                                            Colors.white,
                                                                        fontSize:
                                                                            32.sp,
                                                                      ),
                                                                      onError: (msg) =>
                                                                          Fluttertoast
                                                                              .showToast(
                                                                        msg:
                                                                            '$msg',
                                                                        toastLength:
                                                                            Toast.LENGTH_SHORT,
                                                                        gravity:
                                                                            ToastGravity.CENTER,
                                                                        timeInSecForIosWeb:
                                                                            1,
                                                                        backgroundColor:
                                                                            Colors.red,
                                                                        textColor:
                                                                            Colors.white,
                                                                        fontSize:
                                                                            32.sp,
                                                                      ),
                                                                    ),
                                                              style: Theme.of(
                                                                      context)
                                                                  .elevatedButtonTheme
                                                                  .style,
                                                              child: Text(
                                                                'Confirm',
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5.0),
                                                            child:
                                                                ElevatedButton(
                                                              onPressed: () =>
                                                                  context.read<
                                                                      MainCubit>()
                                                                    ..deletePartnerRequest(
                                                                      state.user
                                                                          .userId,
                                                                      int.parse(state
                                                                          .partnerRequestList[
                                                                              index]
                                                                          .partnerRequestId),
                                                                      onSuccess:
                                                                          () {},
                                                                      onError: (msg) =>
                                                                          Fluttertoast
                                                                              .showToast(
                                                                        msg:
                                                                            '$msg',
                                                                        toastLength:
                                                                            Toast.LENGTH_SHORT,
                                                                        gravity:
                                                                            ToastGravity.CENTER,
                                                                        timeInSecForIosWeb:
                                                                            1,
                                                                        backgroundColor:
                                                                            Colors.red,
                                                                        textColor:
                                                                            Colors.white,
                                                                        fontSize:
                                                                            32.sp,
                                                                      ),
                                                                    ),
                                                              style: Theme.of(
                                                                      context)
                                                                  .elevatedButtonTheme
                                                                  .style
                                                                  .copyWith(
                                                                backgroundColor:
                                                                    MaterialStateProperty
                                                                        .resolveWith(
                                                                            (states) {
                                                                  if (states.contains(
                                                                          MaterialState
                                                                              .pressed) ||
                                                                      states.contains(
                                                                          MaterialState
                                                                              .hovered)) {
                                                                    return const Color(
                                                                            0xffbdc3c7)
                                                                        .withOpacity(
                                                                            0.8);
                                                                  }
                                                                  return const Color(
                                                                      0xffbdc3c7);
                                                                }),
                                                              ),
                                                              child: Text(
                                                                'Delete',
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyText1
                                                                    .copyWith(
                                                                      color: Colors
                                                                          .black,
                                                                    ),
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
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                  if (state.partnerRequestList.isEmpty) ...[
                                    Column(
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'You have no partner request at the moment.',
                                          style: TextStyle(
                                            fontFamily: 'vr',
                                            fontSize: 32.sp,
                                            color:
                                                Colors.white.withOpacity(0.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                  if (state.isLoadingPartnerRequests) ...[
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            Theme.of(context).primaryColorDark,
                                      ),
                                      child: SpinKitWave(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ],
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
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Container(
              //     padding: const EdgeInsets.all(10),
              //     decoration: BoxDecoration(
              //       color: Theme.of(context).primaryColorLight,
              //     ),
              //     child: Row(
              //       children: [
              //         Expanded(
              //           child: ElevatedButton(
              //             onPressed: () => context.read<MainCubit>()
              //               ..createBusiness(
              //                 state.user.userId,
              //                 state.businessName,
              //                 state.businessPhone,
              //                 state.businessAddress,
              //                 '',
              //                 onSuccess: () {
              //                   if (ExtendedNavigator.of(context).canPop()) {
              //                     ExtendedNavigator.of(context).pop();
              //                   }
              //                 },
              //                 onError: (msg) => Fluttertoast.showToast(
              //                   msg: '$msg',
              //                   toastLength: Toast.LENGTH_SHORT,
              //                   gravity: ToastGravity.CENTER,
              //                   timeInSecForIosWeb: 1,
              //                   backgroundColor: Colors.red,
              //                   textColor: Colors.white,
              //                   fontSize: 32.sp,
              //                 ),
              //               ),
              //             style: Theme.of(context).elevatedButtonTheme.style,
              //             child: Text(
              //               'Create',
              //               style: TextStyle(
              //                 fontFamily: 'vb',
              //                 fontSize: 42.sp,
              //                 color: Colors.white,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              if (state.isAcceptingPartnerRequest) ...[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SpinKitFadingCircle(
                        color: Colors.white,
                        size: 32,
                      ),
                    ],
                  ),
                ),
              ],
              if (state.isDeletingPartnerRequest) ...[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SpinKitFadingCircle(
                        color: Colors.white,
                        size: 32,
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

  String timeAgo(String timestamp) {
    final year = int.parse(timestamp.substring(0, 4));
    final month = int.parse(timestamp.substring(5, 7));
    final day = int.parse(timestamp.substring(8, 10));
    final hour = int.parse(timestamp.substring(11, 13));
    final minute = int.parse(timestamp.substring(14, 16));

    final videoDate = DateTime(year, month, day, hour, minute);
    final diffInHours = DateTime.now().difference(videoDate).inHours;

    var timeAgo = '';
    var timeUnit = '';
    var timeValue = 0;

    if (diffInHours < 1) {
      final diffInMinutes = DateTime.now().difference(videoDate).inMinutes;
      timeValue = diffInMinutes;
      timeUnit = 'minute';
    } else if (diffInHours < 24) {
      timeValue = diffInHours;
      timeUnit = 'hour';
    } else if (diffInHours >= 24 && diffInHours < 24 * 7) {
      timeValue = (diffInHours / 24).floor();
      timeUnit = 'day';
    } else if (diffInHours >= 24 * 7 && diffInHours < 24 * 30) {
      timeValue = (diffInHours / (24 * 7)).floor();
      timeUnit = 'week';
    } else if (diffInHours >= 24 * 30 && diffInHours < 24 * 12 * 30) {
      timeValue = (diffInHours / (24 * 30)).floor();
      timeUnit = 'month';
    } else {
      timeValue = (diffInHours / (24 * 365)).floor();
      timeUnit = 'year';
    }

    timeAgo = timeValue.toString() + ' ' + timeUnit;
    timeAgo += timeValue > 1 ? 's' : '';

    return timeAgo + ' ago';
  }
}
