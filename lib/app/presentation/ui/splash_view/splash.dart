// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../routes/auto_router.gr.dart';

// class Splash extends StatefulWidget {
//   @override
//   _SplashState createState() => _SplashState();
// }

// class _SplashState extends State<Splash> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 1), () {
//       ExtendedNavigator.of(context).pushAndRemoveUntil(
//         Routes.loginView,
//         (route) => false,
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.purple,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Image(
//               image: const AssetImage('assets/images/icon_durpos.png'),
//               width: 200.w,
//               height: 200.h,
//             ),
//             Text(
//               'The best POS Solution for your business.',
//               style: TextStyle(
//                 fontFamily: 'HNLight',
//                 fontSize: 18.sp,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 10),
//             SizedBox(
//               width: 150.w,
//               child: const LinearProgressIndicator(
//                 backgroundColor: Colors.transparent,
//                 minHeight: 10,
//                 valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
