import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../cubits/Main/main_cubit.dart';
import '../routes/auto_router.gr.dart';

class NavigDrawer extends StatelessWidget {
  const NavigDrawer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) => Drawer(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorDark,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().statusBarHeight,
                  ),
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: TextButton(
                        onPressed: () {
                          context.read<MainCubit>()..setPage('profile');
                          ExtendedNavigator.of(context).pushAndRemoveUntil(
                            Routes.profileSettingsView,
                            (routes) => false,
                          );
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
                              return Colors.white.withOpacity(0.6);
                            }
                            return Colors.white;
                          }),
                          padding: MaterialStateProperty.resolveWith(
                              (states) => const EdgeInsets.only(right: 10)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${state.user.fullName[0]}',
                                        style: TextStyle(
                                          fontFamily: 'vb',
                                          fontSize: 46.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  '${state.user.fullName}',
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
                                                  '${state.user.userEmail}',
                                                  style: TextStyle(
                                                    fontFamily: 'vr',
                                                    fontSize: 26.sp,
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
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '  POS AND INVENTORY',
                            style: TextStyle(
                              fontFamily: 'vb',
                              fontSize: 32.sp,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    if (state.user.previleges.isActivatedCheckout) ...[
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                context.read<MainCubit>()
                                  ..changePageState('checkout');
                                ExtendedNavigator.of(context)
                                    .pushAndRemoveUntil(
                                        Routes.checkoutView, (routes) => false);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) => state.curPage == 'checkout'
                                      ? Theme.of(context).primaryColor
                                      : Colors.transparent,
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 15.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.cashRegister,
                                      size: 22,
                                    ),
                                  ),
                                  Text(
                                    'Checkout',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: 'vr',
                                      fontSize: 36.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                    if (state.user.previleges.isActivatedProducts) ...[
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                context.read<MainCubit>()
                                  ..changePageState('products');
                                // print('${state.business.businessName}');
                                context.read<MainCubit>()
                                  ..getBusinessProducts(
                                    state.business.businessId,
                                    onSuccess: (products) {},
                                    onError: (msg) {},
                                  );
                                ExtendedNavigator.of(context)
                                    .pushAndRemoveUntil(
                                        Routes.productsView, (routes) => false);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) => state.curPage == 'products'
                                      ? Theme.of(context).primaryColor
                                      : Colors.transparent,
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 15.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.list,
                                      size: 22,
                                    ),
                                  ),
                                  Text(
                                    'Products',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: 'vr',
                                      fontSize: 36.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                    if (state.user.previleges.isActivatedCustomers) ...[
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                context.read<MainCubit>()
                                  ..changePageState('customers');
                                context.read<MainCubit>()
                                  ..getCustomers(
                                    state.business.businessId,
                                    onSuccess: () {},
                                    onError: (msg) {},
                                  );
                                ExtendedNavigator.of(context)
                                    .pushAndRemoveUntil(
                                        Routes.customerView, (routes) => false);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) => state.curPage == 'customers'
                                      ? Theme.of(context).primaryColor
                                      : Colors.transparent,
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 15.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.user,
                                      size: 22,
                                    ),
                                  ),
                                  Text(
                                    'Customers',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: 'vr',
                                      fontSize: 36.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                    if (state.user.previleges.isActivatedTransactions) ...[
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                context.read<MainCubit>()
                                  ..changePageState('transactions');
                                context.read<MainCubit>()
                                  ..getBusinessTransactions(
                                    state.business.businessId,
                                    onSuccess: () {},
                                    onError: (msg) {},
                                  );
                                ExtendedNavigator.of(context)
                                    .pushAndRemoveUntil(Routes.transactionsView,
                                        (routes) => false);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) => state.curPage == 'transactions'
                                      ? Theme.of(context).primaryColor
                                      : Colors.transparent,
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 15.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.receipt,
                                      size: 22,
                                    ),
                                  ),
                                  Text(
                                    'Transactions',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: 'vr',
                                      fontSize: 36.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                    if (state.user.previleges.isActivatedUsers) ...[
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '  ACCOUNTS',
                              style: TextStyle(
                                fontFamily: 'vb',
                                fontSize: 32.sp,
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                context.read<MainCubit>()
                                  ..changePageState('users');
                                context.read<MainCubit>()
                                  ..getBusinessUsers(
                                    state.business.businessId,
                                    onSuccess: () {},
                                    onError: (msg) {},
                                  );
                                ExtendedNavigator.of(context)
                                    .pushAndRemoveUntil(
                                        Routes.usersView, (routes) => false);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) => state.curPage == 'users'
                                      ? Theme.of(context).primaryColor
                                      : Colors.transparent,
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 15.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.users,
                                      size: 22,
                                    ),
                                  ),
                                  Text(
                                    'Users',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: 'vr',
                                      fontSize: 36.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '  OTHERS',
                            style: TextStyle(
                              fontFamily: 'vb',
                              fontSize: 32.sp,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              context.read<MainCubit>()
                                ..changePageState('analytics');
                              context.read<MainCubit>()
                                ..getStatistics(
                                  state.business.businessId,
                                  '${DateFormat('yyyy-MM-dd').format(DateTime.now()).toString()} 00:00:00',
                                  '${DateFormat('yyyy-MM-dd').format(DateTime.now()).toString()} 23:59:00',
                                  onSuccess: () {},
                                  onError: (msg) {},
                                );
                              ExtendedNavigator.of(context).pushAndRemoveUntil(
                                  Routes.analyticsView, (routes) => false);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith(
                                (states) => state.curPage == 'analytics'
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent,
                              ),
                            ),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 15.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.chartBar,
                                    size: 22,
                                  ),
                                ),
                                Text(
                                  'Analytics',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: 'vr',
                                    fontSize: 36.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (state.user.status == 'isOwner') ...[
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                context.read<MainCubit>()
                                  ..changePageState('business');
                                ExtendedNavigator.of(context)
                                    .pushAndRemoveUntil(
                                        Routes.businessView, (routes) => false);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) => state.curPage == 'business'
                                      ? Theme.of(context).primaryColor
                                      : Colors.transparent,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(right: 15.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.store,
                                          size: 22,
                                        ),
                                      ),
                                      Text(
                                        'Businesses',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: 'vr',
                                          fontSize: 36.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      '${state.user.businesses.length}',
                                      style: TextStyle(
                                        fontFamily: 'vr',
                                        fontSize: 32.sp,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: TextButton(
                    //         onPressed: () {
                    //           context.read<MainCubit>()
                    //             ..changePageState('settings');
                    //           ExtendedNavigator.of(context).pushAndRemoveUntil(
                    //               Routes.settingsView, (routes) => false);
                    //         },
                    //         style: ButtonStyle(
                    //           backgroundColor:
                    //               MaterialStateProperty.resolveWith(
                    //             (states) => state.curPage == 'settings'
                    //                 ? Theme.of(context).primaryColor
                    //                 : Colors.transparent,
                    //           ),
                    //         ),
                    //         child: Row(
                    //           children: [
                    //             const Padding(
                    //               padding: EdgeInsets.only(right: 15.0),
                    //               child: FaIcon(
                    //                 FontAwesomeIcons.cog,
                    //                 size: 22,
                    //               ),
                    //             ),
                    //             Text(
                    //               'Settings',
                    //               textAlign: TextAlign.start,
                    //               style: TextStyle(
                    //                 fontFamily: 'vr',
                    //                 fontSize: 36.sp,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: TextButton(
                    //         onPressed: () {
                    //           context.read<MainCubit>()
                    //             ..changePageState('help');
                    //           ExtendedNavigator.of(context).pushAndRemoveUntil(
                    //               Routes.helpView, (routes) => false);
                    //         },
                    //         style: ButtonStyle(
                    //           backgroundColor:
                    //               MaterialStateProperty.resolveWith(
                    //             (states) => state.curPage == 'help'
                    //                 ? Theme.of(context).primaryColor
                    //                 : Colors.transparent,
                    //           ),
                    //         ),
                    //         child: Row(
                    //           children: [
                    //             const Padding(
                    //               padding: EdgeInsets.only(right: 15.0),
                    //               child: FaIcon(
                    //                 FontAwesomeIcons.infoCircle,
                    //                 size: 22,
                    //               ),
                    //             ),
                    //             Text(
                    //               'Help',
                    //               textAlign: TextAlign.start,
                    //               style: TextStyle(
                    //                 fontFamily: 'vr',
                    //                 fontSize: 36.sp,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: TextButton(
                    //         onPressed: () => context.read<AuthCubit>()
                    //           ..signOut(
                    //             onSuccess: () {
                    //               ExtendedNavigator.of(context)
                    //                   .pushAndRemoveUntil(
                    //                 Routes.splashView,
                    //                 (routes) => false,
                    //               );
                    //             },
                    //             onError: (msg) {},
                    //           ),
                    //         child: Row(
                    //           children: [
                    //             const Padding(
                    //               padding: EdgeInsets.only(right: 15.0),
                    //               child: FaIcon(
                    //                 FontAwesomeIcons.signOutAlt,
                    //                 color: Colors.red,
                    //                 size: 22,
                    //               ),
                    //             ),
                    //             Text(
                    //               'Logout',
                    //               textAlign: TextAlign.start,
                    //               style: TextStyle(
                    //                 fontFamily: 'vr',
                    //                 fontSize: 36.sp,
                    //                 color: Colors.red,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
              // Container(
              //   height: 300.h,
              //   padding:  EdgeInsets.all(10),
              //   decoration: BoxDecoration(
              //     color: const Color(0xffe67e22),
              //     boxShadow: [
              //       BoxShadow(
              //         color: const Color(0xff374ABE).withAlpha(60),
              //         blurRadius: 10.0,
              //         spreadRadius: 8.0,
              //         offset: const Offset(
              //           0.0,
              //           8.0,
              //         ),
              //       ),
              //     ],
              //   ),
              //   child: Column(
              //     children: [
              //       Row(
              //         children: [
              //           const Icon(
              //             FontAwesomeIcons.code,
              //             size: 22,
              //
              //           ),
              //           const SizedBox(width: 15),
              //           Text(
              //             'Developer Mode',
              //             style: TextStyle(
              //               fontFamily: 'vb',
              //               fontSize: 52.sp,
              //
              //             ),
              //           ),
              //         ],
              //       ),
              //       const SizedBox(height: 10),
              //       Row(
              //         children: [
              //           Expanded(
              //             child: Text(
              //               'You\'re currently on dev version. '
              //               'Some features are currently under '
              //               'development and will not work accordingly.'
              //               '\n',
              //               style: TextStyle(
              //                 fontFamily: 'vr',
              //                 fontSize: 32.sp,
              //
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
