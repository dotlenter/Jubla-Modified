import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../cubits/Main/main_cubit.dart';
import '../../../widgets/navig_drawer.dart';

class AddPartnerView extends StatelessWidget {
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
                padding: EdgeInsets.only(
                  top: ScreenUtil().statusBarHeight,
                  right: 5,
                  left: 5,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                ),
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
                                'Add Partner Business',
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
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style:
                                  Theme.of(context).elevatedButtonTheme.style,
                              child: Text(
                                'Scan Business Code',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Or',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        textInputAction: TextInputAction.search,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(
                          fontSize: 36.sp,
                          fontFamily: 'vb',
                          color: Colors.white,
                        ),
                        cursorColor: const Color(0xFF34495e),
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).accentColor,
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          errorStyle: TextStyle(
                            color: Colors.red[200],
                            fontFamily: 'vr',
                          ),
                          prefixIcon:
                              const Icon(Icons.qr_code_rounded, size: 25),
                          labelText: 'Search business code',
                          labelStyle: Theme.of(context).textTheme.subtitle2,
                        ),
                        onEditingComplete: () {
                          context.read<MainCubit>()
                            ..getBusinessWithOwnerByCode(
                              state.businessCode,
                              onSuccess: () {},
                              onError: (msg) {},
                            );
                        },
                        onChanged: (value) => context.read<MainCubit>()
                          ..onPartnerBusinessCodeChanged(value),
                      ),
                    ),
                    state.isLoadingAvailablePartners
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const CircularProgressIndicator(),
                            ],
                          )
                        : Row(
                            children: [
                              Expanded(
                                child: ListView(
                                  shrinkWrap: true,
                                  children: List.generate(
                                    state.availablePartnerList.length,
                                    (index) => state.filteredBusinessList
                                            .where((e) =>
                                                e.businessId ==
                                                state
                                                    .availablePartnerList[index]
                                                    .businessId)
                                            .toList()
                                            .isNotEmpty
                                        ? Container()
                                        : Container(
                                            padding: const EdgeInsets.only(
                                              top: 10,
                                              left: 15,
                                              right: 15,
                                              bottom: 15,
                                            ),
                                            margin: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Theme.of(context)
                                                  .primaryColorLight,
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        '${state.availablePartnerList[index].businessName}',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        '${state.availablePartnerList[index].businessAddress1}',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        '${state.availablePartnerList[index].businessCode}',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle2
                                                            .copyWith(
                                                              color: Color(
                                                                int.parse(
                                                                        (state.availablePartnerList[index].businessColor ?? '#4ecca3').substring(
                                                                            1,
                                                                            7),
                                                                        radix:
                                                                            16) +
                                                                    0xFF000000,
                                                              ),
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () {},
                                                      style: Theme.of(context)
                                                          .elevatedButtonTheme
                                                          .style
                                                          .copyWith(
                                                            padding:
                                                                MaterialStateProperty
                                                                    .resolveWith(
                                                              (e) =>
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal: 10,
                                                              ),
                                                            ),
                                                          ),
                                                      child: Text(
                                                        'Add Business',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline2,
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
                            ],
                          ),
                  ],
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
              //             onPressed: () {},
              //             style: Theme.of(context).elevatedButtonTheme.style,
              //             child: Text(
              //               'Send Request',
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
              // if (state.isCreatingBusiness) ...[
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
              //         //       style: TextStyle(a
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
      ),
    );
  }
}
