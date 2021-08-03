import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGenerateView extends StatelessWidget {
  final String qrData;

  const QrGenerateView({Key key, this.qrData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  padding: const EdgeInsets.only(top: 17, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Builder(
                            builder: (context) => Bounce(
                              onPressed: () {
                                if (ExtendedNavigator.of(context).canPop()) {
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
                            'QR Code',
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
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    QrImage(
                      data: '$qrData',
                      version: QrVersions.auto,
                      size: 260,
                      foregroundColor: Theme.of(context).primaryColor,
                      // gapless: false,
                      embeddedImage:
                          const AssetImage('assets/images/jubla.png'),
                      embeddedImageStyle: QrEmbeddedImageStyle(
                        size: const Size(30, 30),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
