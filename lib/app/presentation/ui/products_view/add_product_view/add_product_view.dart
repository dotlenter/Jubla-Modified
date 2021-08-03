import 'dart:io';
import 'dart:typed_data';

import 'package:app_settings/app_settings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../cubits/Main/main_cubit.dart';
import '../../../routes/auto_router.gr.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({Key key}) : super(key: key);
  @override
  _AddProductViewState createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  Uint8List _image;
  File _imageFile;
  bool isGrid = false;
  final TextEditingController _editingController = TextEditingController();
  final _picker = ImagePicker();

  void _imgFromCamera() async {
    var _pickedFile = await _picker.getImage(
      source: ImageSource.camera,
      maxHeight: 480,
      maxWidth: 640,
      imageQuality: 50,
    );
    setState(() {
      _imageFile = File(_pickedFile.path);
    });
    final _imgBytes = await _pickedFile.readAsBytes();
    setState(() {
      _image = _imgBytes;
    });
  }

  void _imgFromGallery() async {
    var _pickedFile = await _picker.getImage(
      source: ImageSource.gallery,
      maxHeight: 480,
      maxWidth: 640,
      imageQuality: 50,
    );
    if (_pickedFile != null) {
      setState(() {
        _imageFile = File(_pickedFile.path);
      });
      final _imgBytes = await _pickedFile.readAsBytes();
      setState(() {
        _image = _imgBytes;
      });
    }
  }

  // void _askPermissions(BuildContext context) async {
  //   // var camera = await Permission.camera;
  //   if (await Permission.camera.request().isPermanentlyDenied &&
  //       await Permission.camera.request().isPermanentlyDenied) {
  //     await Permission.camera.request();
  //     await Permission.photos.request();
  //   }
  // }

  void _askPhotoLibraryPermission(BuildContext context) async {
    if (await Permission.photos.request().isGranted) {
      _imgFromGallery();
      Navigator.of(context).pop();
    } else if (await Permission.photos.status.isGranted) {
      _imgFromGallery();
      Navigator.of(context).pop();
    } else if (await Permission.photos.request().isPermanentlyDenied) {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Permissions Required',
            style: TextStyle(
              fontFamily: 'vb',
              fontSize: 36.sp,
            ),
          ),
          content: Text(
            'In order to add image from your gallery '
            'Jubla needs permissions to access it.',
            style: TextStyle(
              fontFamily: 'vb',
              fontSize: 36.sp,
            ),
          ),
          actions: [
            Bounce(
              onPressed: () => Navigator.of(context).pop(),
              duration: const Duration(milliseconds: 100),
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontFamily: 'vb',
                  fontSize: 36.sp,
                  color: Colors.blue,
                ),
              ),
            ),
            Bounce(
              onPressed: () => AppSettings.openAppSettings(),
              duration: const Duration(milliseconds: 100),
              child: Text(
                'Okay',
                style: TextStyle(
                  fontFamily: 'vb',
                  fontSize: 36.sp,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) => WillPopScope(
        onWillPop: () async => !state.isCreatingProduct,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).primaryColorDark,
            leading: Builder(
              builder: (context) => IconButton(
                onPressed: () => ExtendedNavigator.of(context).pop(),
                icon: const FaIcon(
                  FontAwesomeIcons.angleLeft,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
            title: Text(
              ' Product',
              style: TextStyle(
                fontFamily: 'vb',
                fontSize: 36.sp,
                color: Colors.white,
              ),
            ),
          ),
          body: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                height: ScreenUtil().screenHeight,
                width: ScreenUtil().screenWidth,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 90),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 220.h,
                                width: 230.w,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    if (_image != null) ...[
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          child: Image.file(
                                            _imageFile,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                    Center(
                                      child: Text(
                                        'P',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.5),
                                          fontFamily: 'vb',
                                          fontSize: 100.sp,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        height: 100.h,
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Color(int.parse(
                                                      (state.productBGColor ??
                                                              '#1C3044')
                                                          .substring(1, 7),
                                                      radix: 16) +
                                                  0xFF000000)
                                              .withOpacity(0.5),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    state.productName.isEmpty
                                                        ? 'Product Name'
                                                        : '${state.productName}',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontFamily: 'vb',
                                                      fontSize: 32.sp,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 2.h),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    state.productPrice <= 0
                                                        ? 'P0.00'
                                                        : 'P${state.productPrice.toStringAsFixed(2)}',
                                                    maxLines: 1,
                                                    overflow: TextOverflow.fade,
                                                    style: TextStyle(
                                                      fontFamily: 'vb',
                                                      fontSize: 26.sp,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                _showColorPicker(context);
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
                                    return Color(int.parse(
                                                (state.productBGColor ??
                                                        '#1C3044')
                                                    .substring(1, 7),
                                                radix: 16) +
                                            0xFF000000)
                                        .withOpacity(0.5);
                                  }
                                  return Color(int.parse(
                                          (state.productBGColor ?? '#1C3044')
                                              .substring(1, 7),
                                          radix: 16) +
                                      0xFF000000);
                                }),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                child: const Icon(
                                  FontAwesomeIcons.squareFull,
                                  size: 26,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            TextButton(
                              onPressed: () {
                                _showPicker(context);
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
                                    return Colors.white.withOpacity(0.5);
                                  }
                                  return Colors.white;
                                }),
                              ),
                              child: const Icon(
                                FontAwesomeIcons.camera,
                                size: 26,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                style: TextStyle(
                                  fontFamily: 'vb',
                                  fontSize: 36.sp,
                                  color: Colors.white,
                                ),
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  focusColor: Theme.of(context).accentColor,
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  errorStyle: TextStyle(
                                    color: Colors.red[200],
                                    fontFamily: 'vr',
                                  ),
                                  prefixIcon: const Icon(
                                    FontAwesomeIcons.font,
                                    size: 25,
                                  ),
                                  labelText: 'Product Name',
                                  labelStyle:
                                      Theme.of(context).textTheme.subtitle2,
                                ),
                                onChanged: (value) => context.read<MainCubit>()
                                  ..onProductNameChanged(value),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                style: TextStyle(
                                  fontFamily: 'vb',
                                  fontSize: 36.sp,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  focusColor: Theme.of(context).accentColor,
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  errorStyle: TextStyle(
                                    color: Colors.red[200],
                                    fontFamily: 'vr',
                                  ),
                                  prefixIcon: const Icon(
                                    FontAwesomeIcons.tag,
                                    size: 25,
                                  ),
                                  labelText: 'Price',
                                  labelStyle:
                                      Theme.of(context).textTheme.subtitle2,
                                ),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d+\.?\d*')),
                                ],
                                onChanged: (value) => context.read<MainCubit>()
                                  ..onProductPriceChanged(value),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                style: TextStyle(
                                  fontFamily: 'vb',
                                  fontSize: 36.sp,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  focusColor: Theme.of(context).accentColor,
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  errorStyle: TextStyle(
                                    color: Colors.red[200],
                                    fontFamily: 'vr',
                                  ),
                                  prefixIcon: const Icon(
                                    FontAwesomeIcons.coins,
                                    size: 25,
                                  ),
                                  labelText: 'Cost',
                                  labelStyle:
                                      Theme.of(context).textTheme.subtitle2,
                                ),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d+\.?\d*')),
                                ],
                                onChanged: (value) => context.read<MainCubit>()
                                  ..onProductCostChanged(value),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Text(
                              'Details',
                              style: TextStyle(
                                fontFamily: 'vb',
                                fontSize: 36.sp,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                style: TextStyle(
                                  fontFamily: 'vb',
                                  fontSize: 36.sp,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  focusColor: Theme.of(context).accentColor,
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  errorStyle: TextStyle(
                                    color: Colors.red[200],
                                    fontFamily: 'vr',
                                  ),
                                  // prefixIcon: const Icon(
                                  //   FontAwesomeIcons.coins,
                                  //   size: 25,
                                  // ),
                                  labelText: 'Description',
                                  labelStyle:
                                      Theme.of(context).textTheme.subtitle2,
                                ),
                                onChanged: (value) => context.read<MainCubit>()
                                  ..onProductDescriptionChanged(value),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => ExtendedNavigator.of(context).push(
                                  Routes.categoryView,
                                  arguments: CategoryViewArguments(
                                    onSelectedCategoryChanged: (category) {
                                      _editingController.text = category;
                                    },
                                  ),
                                ),
                                child: TextFormField(
                                  controller: _editingController,
                                  textInputAction: TextInputAction.next,
                                  style: TextStyle(
                                    fontFamily: 'vb',
                                    fontSize: 36.sp,
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Category',
                                    hintStyle: TextStyle(
                                      fontFamily: 'vr',
                                      fontSize: 36.sp,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    suffixIcon: const Icon(
                                      FontAwesomeIcons.angleRight,
                                      color: Colors.blueGrey,
                                      size: 22,
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                    enabled: false,
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                style: TextStyle(
                                  fontFamily: 'vb',
                                  fontSize: 36.sp,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  focusColor: Theme.of(context).accentColor,
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  errorStyle: TextStyle(
                                    color: Colors.red[200],
                                    fontFamily: 'vr',
                                  ),
                                  // prefixIcon: const Icon(
                                  //   FontAwesomeIcons.coins,
                                  //   size: 25,
                                  // ),
                                  labelText: 'Code',
                                  labelStyle:
                                      Theme.of(context).textTheme.subtitle2,
                                ),
                                onChanged: (value) => context.read<MainCubit>()
                                  ..onProductCodeChanged(value),
                              ),
                            ),
                          ],
                        ),
                        // const SizedBox(height: 10),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: Column(
                        //         children: [
                        //           TextFormField(
                        //             enabled: false,
                        //             initialValue: 'Unit',
                        //             style: TextStyle(
                        //               fontFamily: 'vb',
                        //               fontSize: 36.sp,
                        //               color: Colors.white,
                        //             ),
                        //             decoration: InputDecoration(
                        //               hintText: 'Sell By',
                        //               hintStyle: TextStyle(
                        //                 fontFamily: 'vr',
                        //                 fontSize: 36.sp,
                        //                 color: Colors.white.withOpacity(0.5),
                        //               ),
                        //               border: OutlineInputBorder(
                        //                 borderSide: BorderSide(
                        //                   color: Theme.of(context).primaryColor,
                        //                 ),
                        //               ),
                        //               suffixIcon: const Icon(
                        //                 FontAwesomeIcons.angleRight,
                        //                 color: Colors.blueGrey,
                        //                 size: 22,
                        //               ),
                        //               focusedBorder: const OutlineInputBorder(
                        //                 borderSide: BorderSide(
                        //                   color: Colors.blueGrey,
                        //                 ),
                        //               ),
                        //               enabled: false,
                        //               disabledBorder: OutlineInputBorder(
                        //                 borderSide: BorderSide(
                        //                   color: Theme.of(context).primaryColor,
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Bounce(
                          onPressed: () {},
                          duration: const Duration(milliseconds: 100),
                          child: ElevatedButton(
                            onPressed: () => context.read<MainCubit>()
                              ..createProduct(
                                state.business.businessId,
                                state.productName,
                                state.productCategory,
                                state.productPrice,
                                state.productCode,
                                state.productCost,
                                state.productSoldBy,
                                state.productBGColor,
                                state.user.userEmail,
                                _image,
                                onSuccess: () {
                                  if (ExtendedNavigator.of(context).canPop()) {
                                    ExtendedNavigator.of(context).pop();
                                  }
                                },
                                onError: (msg) => Fluttertoast.showToast(
                                  msg: '$msg',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 32.sp,
                                ),
                              ),
                            style: Theme.of(context).elevatedButtonTheme.style,
                            child: Text(
                              'Create Product',
                              style: TextStyle(
                                fontFamily: 'vb',
                                fontSize: 42.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (state.isCreatingProduct) ...[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SpinKitFadingCircle(
                        color: Colors.white,
                        size: 32,
                      ),
                      // const SizedBox(height: 10),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text(
                      //       'Logging in, please wait...',
                      //       style: TextStyle(
                      //         fontFamily: 'HNMed',
                      //         fontSize: 32.sp,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _showColorPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Wrap(
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    bc.read<MainCubit>()..setProductBGColor('#0D161F');
                    ExtendedNavigator.of(context).pop();
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
                        return const Color(0xFF0D161F).withOpacity(0.5);
                      }
                      return const Color(0xFF0D161F);
                    }),
                  ),
                  child: const Icon(
                    FontAwesomeIcons.squareFull,
                    size: 26,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    bc.read<MainCubit>()..setProductBGColor('#2980b9');
                    ExtendedNavigator.of(context).pop();
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
                        return const Color(0xff2980b9).withOpacity(0.5);
                      }
                      return const Color(0xff2980b9);
                    }),
                  ),
                  child: const Icon(
                    FontAwesomeIcons.squareFull,
                    size: 26,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    bc.read<MainCubit>()..setProductBGColor('#8e44ad');
                    ExtendedNavigator.of(context).pop();
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
                        return const Color(0xff8e44ad).withOpacity(0.5);
                      }
                      return const Color(0xff8e44ad);
                    }),
                  ),
                  child: const Icon(
                    FontAwesomeIcons.squareFull,
                    size: 26,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    bc.read<MainCubit>()..setProductBGColor('#e74c3c');
                    ExtendedNavigator.of(context).pop();
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
                        return const Color(0xffe74c3c).withOpacity(0.5);
                      }
                      return const Color(0xffe74c3c);
                    }),
                  ),
                  child: const Icon(
                    FontAwesomeIcons.squareFull,
                    size: 26,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    bc.read<MainCubit>()..setProductBGColor('#1abc9c');
                    ExtendedNavigator.of(context).pop();
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
                        return const Color(0xff1abc9c).withOpacity(0.5);
                      }
                      return const Color(0xff1abc9c);
                    }),
                  ),
                  child: const Icon(
                    FontAwesomeIcons.squareFull,
                    size: 26,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    bc.read<MainCubit>()..setProductBGColor('#f1c40f');
                    ExtendedNavigator.of(context).pop();
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
                        return const Color(0xfff1c40f).withOpacity(0.5);
                      }
                      return const Color(0xfff1c40f);
                    }),
                  ),
                  child: const Icon(
                    FontAwesomeIcons.squareFull,
                    size: 26,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Wrap(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => _askPhotoLibraryPermission(context),
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
                              return const Color(0xFF0D161F).withOpacity(0.5);
                            }
                            return const Color(0xFF0D161F);
                          }),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            const Icon(
                              FontAwesomeIcons.images,
                              size: 26,
                            ),
                            const SizedBox(width: 30),
                            Text(
                              'Photo Library',
                              style: TextStyle(
                                fontFamily: 'vb',
                                fontSize: 36.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          _imgFromCamera();
                          Navigator.of(context).pop();
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
                              return const Color(0xFF0D161F).withOpacity(0.5);
                            }
                            return const Color(0xFF0D161F);
                          }),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            const Icon(
                              FontAwesomeIcons.camera,
                              size: 26,
                            ),
                            const SizedBox(width: 30),
                            Text(
                              'Camera',
                              style: TextStyle(
                                fontFamily: 'vb',
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
            ),
          ),
        );
      },
    );
  }
}
