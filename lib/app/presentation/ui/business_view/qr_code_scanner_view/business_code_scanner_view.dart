import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jubla/app/presentation/routes/auto_router.gr.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../cubits/Main/main_cubit.dart';

class BusinessCodeScannerView extends StatefulWidget {
  @override
  _BusinessCodeScannerViewState createState() =>
      _BusinessCodeScannerViewState();
}

class _BusinessCodeScannerViewState extends State<BusinessCodeScannerView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode result;
  QRViewController controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColorDark,
        title: Text(
          'Scan QR Code',
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: [
          TextButton(
            onPressed: () {
              controller?.flipCamera();
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
              Icons.flip_camera_ios_rounded,
              size: 22,
            ),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          QRView(
            key: qrKey,
            overlay: QrScannerOverlayShape(
              borderColor: Theme.of(context).primaryColor,
              borderWidth: 10,
              cutOutSize: 300,
              borderRadius: 5,
            ),
            onQRViewCreated: (qrController) {
              controller = qrController;
              controller.scannedDataStream.listen((scanData) {
                context.read<MainCubit>()
                  ..getBusinessWithOwnerByCode(scanData.code);
              });
            },
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Place the code in the center of the square. It will be scanned automatically.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          ExtendedNavigator.of(context)
                              .push(Routes.inputBusinenssQRView);
                        },
                        style: Theme.of(context).elevatedButtonTheme.style,
                        child: Row(
                          children: [
                            Text(
                              'Input code',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              FontAwesomeIcons.code,
                              size: 22,
                            ),
                          ],
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
