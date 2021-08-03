import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class TakePictureView extends StatefulWidget {
  @override
  _TakePictureViewState createState() => _TakePictureViewState();
}

class _TakePictureViewState extends State<TakePictureView>
    with WidgetsBindingObserver {
  CameraController _controller;
  Future<void> _initializeControllerFuture;
  bool isCameraReady = false;
  bool showCapturedPhoto = false;
  String path = '';

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _controller.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _controller != null
          ? _initializeControllerFuture = _controller.initialize()
          : null; //on pause camera is disposed, so we need to call again "issue is only for android"
    }
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(firstCamera, ResolutionPreset.high);
    _initializeControllerFuture = _controller.initialize();
    if (!mounted) {
      return;
    }
    setState(() {
      isCameraReady = true;
    });
  }

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the Future is complete, display the preview.
          return Transform.scale(
              scale: _controller.value.aspectRatio / deviceRatio,
              child: Center(
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: CameraPreview(_controller), //cameraPreview
                ),
              ));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          ); // Otherwise, display a loading indicator.
        }
      },
    );
  }

  void onCaptureButtonPressed() async {
    try {
      final xFile = await _controller.takePicture();
      setState(() {
        path = xFile.path;
      });
    } catch (e) {
      print(e);
    }
  }
}
