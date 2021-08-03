import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../cubits/Main/main_cubit.dart';
import '../../routes/auto_router.gr.dart';
import '../../widgets/navig_drawer.dart';

class BusinessView extends StatelessWidget {
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
            'Business Management',
            style: TextStyle(
              fontFamily: 'vb',
              fontSize: 36.sp,
              color: Colors.white,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.read<MainCubit>()
                  ..getUserPartnerRequest(
                    state.user.userId,
                    onSuccess: () {},
                    onError: (msg) {},
                  );
                ExtendedNavigator.of(context).push(Routes.businessPartnerView);
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
                FontAwesomeIcons.handsHelping,
                color: Colors.white,
                size: 22,
              ),
            ),
            TextButton(
              onPressed: () {
                context.read<MainCubit>()..businessInitial();
                ExtendedNavigator.of(context).push(Routes.addBusinessView);
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
                FontAwesomeIcons.plus,
                color: Colors.white,
                size: 22,
              ),
            ),
          ],
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
                            hintText: 'Search Business',
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
                            ..onBusinessSearch(value),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: List.generate(
                        state.filteredBusinessList.length,
                        (index) => Container(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 15,
                            right: 15,
                            bottom: 15,
                          ),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: state.business.businessId ==
                                    state.filteredBusinessList[index].businessId
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).primaryColorLight,
                          ),
                          child: TextButton(
                            onPressed: () {
                              context.read<MainCubit>()..businessInitial();
                              context.read<MainCubit>()
                                ..setCurrentEditBusiness(
                                    state.filteredBusinessList[index]);
                              context.read<MainCubit>()..editBusinessInitial();
                              ExtendedNavigator.of(context)
                                  .push(Routes.editBusinessView);
                            },
                            style: ButtonStyle(
                              enableFeedback: true,
                              animationDuration:
                                  const Duration(microseconds: 1),
                              overlayColor: MaterialStateProperty.resolveWith(
                                  (states) => Colors.transparent),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith(
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
                                  (states) => EdgeInsets.zero),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                margin: const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    5,
                                                  ),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        5,
                                                      ),
                                                      color: Color(
                                                        int.parse(
                                                                (state.filteredBusinessList[index].businessColor ??
                                                                        '#1C3044')
                                                                    .substring(
                                                                        1, 7),
                                                                radix: 16) +
                                                            0xFF000000,
                                                      )),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  '${state.filteredBusinessList[index].businessName}',
                                                  maxLines: 2,
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
                                                  'Code: ${state.filteredBusinessList[index].businessCode}',
                                                  style: TextStyle(
                                                    fontFamily: 'vr',
                                                    fontSize: 26.sp,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 5),
                                          if (state.filteredBusinessList[index]
                                                  .relationType ==
                                              1) ...[
                                            Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 5,
                                                    vertical: 4,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xff219897),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Text(
                                                    'You own this',
                                                    style: TextStyle(
                                                      fontFamily: 'vr',
                                                      fontSize: 26.sp,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                          if (state.filteredBusinessList[index]
                                                  .relationType ==
                                              3) ...[
                                            Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 5,
                                                    vertical: 4,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xff3b2c85),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Text(
                                                    'Partner Business',
                                                    style: TextStyle(
                                                      fontFamily: 'vr',
                                                      fontSize: 26.sp,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      state.business.businessId ==
                                              state.filteredBusinessList[index]
                                                  .businessId
                                          ? FontAwesomeIcons.check
                                          : FontAwesomeIcons.angleRight,
                                      size: 26,
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
            if (state.isLoadingEverything) ...[
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF0D161F).withOpacity(0.8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SpinKitRing(
                      color: Colors.white,
                      size: 32,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Syncing data please wait...',
                          style: TextStyle(
                            fontFamily: 'HNMed',
                            fontSize: 46.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
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
