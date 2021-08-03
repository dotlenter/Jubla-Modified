import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../cubits/Auth/auth_cubit.dart';
import '../../cubits/Main/main_cubit.dart';
import '../../routes/auto_router.gr.dart';
import '../../widgets/navig_drawer.dart';

class ProfileSettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) => WillPopScope(
        onWillPop: () async => !state.isCreatingCustomer,
        child: Scaffold(
          appBar: AppBar(
            elevation: 5,
            titleSpacing: 0,
            backgroundColor: Theme.of(context).primaryColorLight,
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
                  size: 24,
                ),
              ),
            ),
            title: Text(
              'Settings',
              style: TextStyle(
                fontFamily: 'vb',
                fontSize: 36.sp,
                color: Colors.white,
              ),
            ),
            actions: [],
          ),
          drawer: const NavigDrawer(),
          body: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                height: ScreenUtil().screenHeight,
                width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                ),
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style:
                          Theme.of(context).elevatedButtonTheme.style.copyWith(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed) ||
                                      states.contains(MaterialState.hovered) ||
                                      states.contains(MaterialState.disabled)) {
                                    return Theme.of(context)
                                        .primaryColorLight
                                        .withOpacity(0.7);
                                  }
                                  return Theme.of(context).primaryColorLight;
                                }),
                                padding: MaterialStateProperty.resolveWith(
                                  (states) => const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                ),
                              ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Theme.of(context).primaryColor,
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
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '${state.user.fullName}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
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
                                            Text(
                                              'Edit personal details',
                                              style: TextStyle(
                                                fontFamily: 'vr',
                                                fontSize: 26.sp,
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
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'PROFILE',
                            style: TextStyle(
                              fontFamily: 'vb',
                              fontSize: 32.sp,
                              color: Theme.of(context)
                                  .canvasColor
                                  .withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style:
                          Theme.of(context).elevatedButtonTheme.style.copyWith(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed) ||
                                      states.contains(MaterialState.hovered) ||
                                      states.contains(MaterialState.disabled)) {
                                    return Theme.of(context)
                                        .primaryColorLight
                                        .withOpacity(0.7);
                                  }
                                  return Theme.of(context).primaryColorLight;
                                }),
                                padding: MaterialStateProperty.resolveWith(
                                  (states) => const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                ),
                              ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.blue,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      FontAwesomeIcons.key,
                                      size: 22,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Change password',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontFamily: 'vr',
                                                  fontSize: 28.sp,
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
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style:
                          Theme.of(context).elevatedButtonTheme.style.copyWith(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed) ||
                                      states.contains(MaterialState.hovered) ||
                                      states.contains(MaterialState.disabled)) {
                                    return Theme.of(context)
                                        .primaryColorLight
                                        .withOpacity(0.7);
                                  }
                                  return Theme.of(context).primaryColorLight;
                                }),
                                padding: MaterialStateProperty.resolveWith(
                                  (states) => const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                ),
                              ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.orange,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      FontAwesomeIcons.lock,
                                      size: 22,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Setup pin',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontFamily: 'vr',
                                                  fontSize: 28.sp,
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
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'NOTIFICATIONS',
                            style: TextStyle(
                              fontFamily: 'vb',
                              fontSize: 32.sp,
                              color: Theme.of(context)
                                  .canvasColor
                                  .withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style:
                          Theme.of(context).elevatedButtonTheme.style.copyWith(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed) ||
                                      states.contains(MaterialState.hovered) ||
                                      states.contains(MaterialState.disabled)) {
                                    return Theme.of(context)
                                        .primaryColorLight
                                        .withOpacity(0.7);
                                  }
                                  return Theme.of(context).primaryColorLight;
                                }),
                                padding: MaterialStateProperty.resolveWith(
                                  (states) => const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                ),
                              ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.amber,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      FontAwesomeIcons.bell,
                                      size: 22,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Notifications',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontFamily: 'vr',
                                                  fontSize: 28.sp,
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
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'MORE',
                            style: TextStyle(
                              fontFamily: 'vb',
                              fontSize: 32.sp,
                              color: Theme.of(context)
                                  .canvasColor
                                  .withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style:
                          Theme.of(context).elevatedButtonTheme.style.copyWith(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed) ||
                                      states.contains(MaterialState.hovered) ||
                                      states.contains(MaterialState.disabled)) {
                                    return Theme.of(context)
                                        .primaryColorLight
                                        .withOpacity(0.7);
                                  }
                                  return Theme.of(context).primaryColorLight;
                                }),
                                padding: MaterialStateProperty.resolveWith(
                                  (states) => const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                ),
                              ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.purple,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      FontAwesomeIcons.globe,
                                      size: 22,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Language',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontFamily: 'vr',
                                                  fontSize: 28.sp,
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
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style:
                          Theme.of(context).elevatedButtonTheme.style.copyWith(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed) ||
                                      states.contains(MaterialState.hovered) ||
                                      states.contains(MaterialState.disabled)) {
                                    return Theme.of(context)
                                        .primaryColorLight
                                        .withOpacity(0.7);
                                  }
                                  return Theme.of(context).primaryColorLight;
                                }),
                                padding: MaterialStateProperty.resolveWith(
                                  (states) => const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                ),
                              ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.pink,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      FontAwesomeIcons.headset,
                                      size: 22,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Help',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontFamily: 'vr',
                                                  fontSize: 28.sp,
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
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => context.read<AuthCubit>()
                        ..signOut(
                          onSuccess: () {
                            ExtendedNavigator.of(context).pushAndRemoveUntil(
                              Routes.splashView,
                              (routes) => false,
                            );
                          },
                          onError: (msg) {},
                        ),
                      style:
                          Theme.of(context).elevatedButtonTheme.style.copyWith(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed) ||
                                      states.contains(MaterialState.hovered) ||
                                      states.contains(MaterialState.disabled)) {
                                    return Theme.of(context)
                                        .primaryColorLight
                                        .withOpacity(0.7);
                                  }
                                  return Theme.of(context).primaryColorLight;
                                }),
                                padding: MaterialStateProperty.resolveWith(
                                  (states) => const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                ),
                              ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.red,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      FontAwesomeIcons.signOutAlt,
                                      size: 22,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Logout',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontFamily: 'vr',
                                                  fontSize: 28.sp,
                                                  color: Colors.red,
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
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'version 1.0.0',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'vb',
                              fontSize: 32.sp,
                              color: Theme.of(context)
                                  .canvasColor
                                  .withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Jubla 2021',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'vr',
                              fontSize: 32.sp,
                              color: Theme.of(context)
                                  .canvasColor
                                  .withOpacity(0.5),
                            ),
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
      ),
    );
  }
}
