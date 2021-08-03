import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/screenutil_init.dart';

import 'app/presentation/cubits/Auth/auth_cubit.dart';
import 'app/presentation/cubits/Main/main_cubit.dart';
import 'app/presentation/routes/auto_router.gr.dart';
import 'injector.dart';

/// Entry point for the app.
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => g<AuthCubit>()),
        BlocProvider(create: (context) => g<MainCubit>()..mainInitial()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(750, 1334),
        allowFontScaling: true,
        builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: ExtendedNavigator(router: AutoRouter()),
          theme: Theme.of(context).copyWith(
            snackBarTheme: const SnackBarThemeData(
              backgroundColor: Color(0xff4ecca3),
              actionTextColor: Colors.white,
            ),
            primaryColor: const Color(0xff4ecca3),
            primaryColorLight: const Color(0xff393e46),
            primaryColorDark: const Color(0xFF232931),
            accentColor: const Color(0xff4ecca3),
            focusColor: const Color(0xff4ecca3),
            hintColor: const Color(0xff4ecca3),
            // tabBarTheme: TabBarTheme(
            //   indicator: Decoration(),
            //   indicatorColor: Theme.of(context).accentColor,
            //   indicatorWeight: 4,
            //   unselectedLabelColor: Colors.grey,
            //   isScrollable: true,
            //   labelStyle: Theme.of(context).textTheme.bodyText2,
            // ),
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                enableFeedback: true,
                animationDuration: const Duration(microseconds: 1),
                overlayColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.transparent),
                padding: MaterialStateProperty.resolveWith(
                  (states) => const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                ),
                backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.transparent),
                foregroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.hovered) ||
                      states.contains(MaterialState.pressed)) {
                    return Colors.white.withOpacity(0.5);
                  }
                  return Colors.white;
                }),
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                shape: MaterialStateProperty.resolveWith(
                  (states) => RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                elevation: MaterialStateProperty.resolveWith((states) => 0),
                padding: MaterialStateProperty.resolveWith(
                    (states) => const EdgeInsets.all(15)),
                overlayColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.transparent),
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.pressed) ||
                        states.contains(MaterialState.hovered) ||
                        states.contains(MaterialState.disabled)) {
                      return const Color(0xff4ecca3).withOpacity(0.6);
                    }
                    return const Color(0xff4ecca3);
                  },
                ),
                animationDuration: const Duration(microseconds: 1),
              ),
            ),
            // inputDecorationTheme: InputDecorationTheme(
            //   focusColor: Theme.of(context).accentColor,
            //   enabledBorder: const UnderlineInputBorder(
            //     borderSide: BorderSide(
            //       color: Colors.white,
            //     ),
            //   ),
            //   errorStyle: TextStyle(
            //     color: Colors.red[200],
            //     fontFamily: 'vr',
            //   ),
            //   labelStyle: Theme.of(context).textTheme.subtitle2,
            // ),
            textTheme: TextTheme(
              headline1: TextStyle(
                color: const Color(0xffeeeeee),
                fontFamily: 'vb',
                fontSize: 36.sp,
              ),
              headline2: TextStyle(
                fontFamily: 'vb',
                fontSize: 36.sp,
              ),
              headline3: TextStyle(
                color: const Color(0xffeeeeee),
                fontFamily: 'vb',
                fontSize: 52.sp,
              ),
              headline4: TextStyle(
                fontFamily: 'vb',
                fontSize: 52.sp,
              ),

              /// Body Texts
              bodyText1: TextStyle(
                fontFamily: 'vr',
                fontSize: 32.sp,
              ),
              bodyText2: TextStyle(
                fontFamily: 'vb',
                fontSize: 32.sp,
              ),

              subtitle1: TextStyle(
                color: const Color(0xffeeeeee),
                fontFamily: 'vr',
                fontSize: 26.sp,
              ),
              subtitle2: TextStyle(
                fontFamily: 'vr',
                fontSize: 26.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
