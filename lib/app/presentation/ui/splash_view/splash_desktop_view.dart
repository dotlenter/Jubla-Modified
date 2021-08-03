import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../routes/auto_router.gr.dart';

class SplashDesktopView extends StatefulWidget {
  @override
  _SplashDesktopViewState createState() => _SplashDesktopViewState();
}

class _SplashDesktopViewState extends State<SplashDesktopView> {
   @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    Future.delayed(const Duration(seconds: 2), () {
      ExtendedNavigator.of(context).pushAndRemoveUntil(
        Routes.loginView,
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2c3e50),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                'BAMA',
                style: TextStyle(
                  fontFamily: 'vb',
                  fontSize: 46.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                'Business Assistance Mobile Application',
                style: TextStyle(
                  fontFamily: 'vr',
                  fontSize: 36.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SpinKitFadingCircle(
                color: Colors.white,
                size: 26,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
