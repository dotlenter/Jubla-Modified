import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../cubits/Main/main_cubit.dart';
import '../../routes/auto_router.gr.dart';
import '../../widgets/navig_drawer.dart';

class UsersMobileView extends StatelessWidget {
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
            'Users (${state.userList.length})',
            style: TextStyle(
              fontFamily: 'vb',
              fontSize: 36.sp,
              color: Colors.white,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.read<MainCubit>()..newUserInitial();
                ExtendedNavigator.of(context).push(Routes.addUserView);
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
                            fillColor: Theme.of(context).primaryColorLight,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (value) =>
                              context.read<MainCubit>()..onUserSearch(value),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 10),
                      children: List.generate(
                        state.filteredUserList.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          decoration:
                              const BoxDecoration(color: Colors.transparent),
                          child: TextButton(
                            onPressed: () {},
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
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: const Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.user,
                                            // color:
                                            //     Colors.white.withOpacity(0.5),
                                            size: 35,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      '${state.filteredUserList[index].fullName}',
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
                                                      state
                                                                  .filteredUserList[
                                                                      index]
                                                                  .status ==
                                                              'isOwner'
                                                          ? state
                                                                      .filteredUserList[
                                                                          index]
                                                                      .relationType ==
                                                                  3
                                                              ? 'Business Partner'
                                                              : 'Business Owner'
                                                          : '${state.filteredUserList[index].userPosition}',
                                                      style: TextStyle(
                                                        fontFamily: 'vr',
                                                        fontSize: 24.sp,
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
                                                      '${state.filteredUserList[index].userEmail}',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontFamily: 'vr',
                                                        fontSize: 24.sp,
                                                        color: Theme.of(context)
                                                            .primaryColor,
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
                                const Icon(FontAwesomeIcons.angleRight),
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
          ],
        ),
      ),
    );
  }
}
