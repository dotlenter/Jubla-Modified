import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../cubits/Main/main_cubit.dart';
import '../../routes/auto_router.gr.dart';
import '../../widgets/navig_drawer.dart';

class CheckoutMobile extends StatefulWidget {
  const CheckoutMobile({Key key}) : super(key: key);
  @override
  _CheckoutMobileState createState() => _CheckoutMobileState();
}

class _CheckoutMobileState extends State<CheckoutMobile> {
  final ScrollController _scrollController = ScrollController();

  bool isGridView = true;
  bool isQrScan = false;
  bool isSearch = false;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final formatter = NumberFormat('#,##0.00', 'en_PH');

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      // controller.pauseCamera();
    } else if (Platform.isIOS) {
      // controller.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          elevation: 0,
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
                size: 22,
              ),
            ),
          ),
          title: Text(
            'Checkout',
            style: TextStyle(
              fontFamily: 'vb',
              fontSize: 36.sp,
              color: Colors.white,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.read<MainCubit>()..startListeningToBusinessMessages();
                ExtendedNavigator.of(context)
                    .push(Routes.groupBusinessChatView);
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
              child: Stack(
                children: [
                  const Icon(
                    FontAwesomeIcons.solidCommentAlt,
                    size: 22,
                  ),
                  const Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: Icon(
                      Icons.brightness_1,
                      size: 12.0,
                      color: Colors.redAccent,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        drawer: const NavigDrawer(),
        body: DefaultTabController(
          length: state.categorizedProducts.length,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                ),
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
                padding: EdgeInsets.only(
                  bottom: isSearch ? 0 : 170.h,
                  top: 10,
                ),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              child: TabBar(
                                indicatorColor: Theme.of(context).primaryColor,
                                indicatorWeight: 4,
                                unselectedLabelColor: Colors.grey,
                                isScrollable: true,
                                labelStyle:
                                    Theme.of(context).textTheme.bodyText2,
                                tabs: state.categorizedProducts
                                    .map(
                                      (e) => Tab(
                                          text:
                                              '${e.productCategory}(${e.products.length})'),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isQrScan) ...[
                      Expanded(
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            QRView(
                              key: qrKey,
                              onQRViewCreated: (ctrl) {
                                setState(() {
                                  controller = ctrl;
                                });
                                controller.scannedDataStream.listen((scanData) {
                                  if (scanData.code.isNotEmpty) {
                                    final _productSearchedCode =
                                        state.allProductList.where((e) =>
                                            e.productCode == scanData.code);
                                    if (_productSearchedCode.isNotEmpty) {
                                      controller.pauseCamera();
                                      context.read<MainCubit>()
                                        ..addProductToCart(
                                            _productSearchedCode.first);
                                      controller.resumeCamera();
                                    }
                                  }
                                });
                              },
                              overlay: QrScannerOverlayShape(
                                borderColor: Theme.of(context).primaryColor,
                                borderRadius: 10,
                                borderLength: 30,
                                borderWidth: 10,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    isQrScan = false;
                                  });
                                },
                                style: ButtonStyle(
                                  enableFeedback: true,
                                  animationDuration:
                                      const Duration(microseconds: 1),
                                  overlayColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => Colors.transparent),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => Colors.transparent),
                                  foregroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) {
                                    if (states
                                            .contains(MaterialState.hovered) ||
                                        states
                                            .contains(MaterialState.pressed)) {
                                      return Colors.red[400].withOpacity(0.5);
                                    }
                                    return Colors.red[400];
                                  }),
                                  padding: MaterialStateProperty.resolveWith(
                                    (states) => const EdgeInsets.only(top: 20),
                                  ),
                                ),
                                child: const Icon(
                                  FontAwesomeIcons.times,
                                  size: 22,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    if (!isQrScan) ...[
                      Container(
                        // height: 100.h,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorDark,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      if (isSearch) {
                                        setState(() {
                                          isSearch = false;
                                        });
                                      } else {
                                        setState(() {
                                          isSearch = true;
                                        });
                                      }
                                    },
                                    style: ButtonStyle(
                                      enableFeedback: true,
                                      animationDuration:
                                          const Duration(microseconds: 1),
                                      overlayColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) => Colors.transparent),
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) => Colors.transparent),
                                      foregroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) {
                                        if (states.contains(
                                                MaterialState.hovered) ||
                                            states.contains(
                                                MaterialState.pressed)) {
                                          return Colors.white.withOpacity(0.5);
                                        }
                                        return Colors.white;
                                      }),
                                      padding:
                                          MaterialStateProperty.resolveWith(
                                              (states) => EdgeInsets.zero),
                                    ),
                                    child: const Icon(
                                      FontAwesomeIcons.search,
                                      size: 25,
                                    ),
                                  ),
                                  if (isSearch) ...[
                                    Expanded(
                                      flex: 4,
                                      child: TextFormField(
                                        style: TextStyle(
                                          fontFamily: 'vb',
                                          fontSize: 36.sp,
                                          color: Colors.white,
                                        ),
                                        decoration: InputDecoration(
                                          // prefixIcon: const Icon(
                                          //   FontAwesomeIcons.search,
                                          //   color: Colors.white,
                                          //   size: 22,
                                          // ),
                                          hintText: 'Search',
                                          hintStyle: TextStyle(
                                            fontFamily: 'vb',
                                            fontSize: 32.sp,
                                            color:
                                                Colors.white.withOpacity(0.7),
                                          ),
                                          suffixIcon: TextButton(
                                            onPressed: () {
                                              if (isSearch) {
                                                setState(() {
                                                  isSearch = false;
                                                });
                                              } else {
                                                setState(() {
                                                  isSearch = true;
                                                });
                                              }
                                            },
                                            style: ButtonStyle(
                                              enableFeedback: true,
                                              animationDuration: const Duration(
                                                  microseconds: 1),
                                              overlayColor:
                                                  MaterialStateProperty
                                                      .resolveWith((states) =>
                                                          Colors.transparent),
                                              backgroundColor:
                                                  MaterialStateProperty
                                                      .resolveWith((states) =>
                                                          Colors.transparent),
                                              foregroundColor:
                                                  MaterialStateProperty
                                                      .resolveWith((states) {
                                                if (states.contains(
                                                        MaterialState
                                                            .hovered) ||
                                                    states.contains(
                                                        MaterialState
                                                            .pressed)) {
                                                  return Colors.red
                                                      .withOpacity(0.5);
                                                }
                                                return Colors.red;
                                              }),
                                              padding: MaterialStateProperty
                                                  .resolveWith((states) =>
                                                      EdgeInsets.zero),
                                            ),
                                            child: const Icon(
                                              FontAwesomeIcons.times,
                                              size: 18,
                                            ),
                                          ),
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      if (isQrScan) {
                                        setState(() {
                                          isQrScan = false;
                                        });
                                      } else {
                                        setState(() {
                                          isQrScan = true;
                                        });
                                      }
                                    },
                                    style: ButtonStyle(
                                      enableFeedback: true,
                                      animationDuration:
                                          const Duration(microseconds: 1),
                                      overlayColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) => Colors.transparent),
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) => Colors.transparent),
                                      foregroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) {
                                        if (states.contains(
                                                MaterialState.hovered) ||
                                            states.contains(
                                                MaterialState.pressed)) {
                                          return Colors.white.withOpacity(0.5);
                                        }
                                        return Colors.white;
                                      }),
                                      padding:
                                          MaterialStateProperty.resolveWith(
                                        (states) => EdgeInsets.zero,
                                      ),
                                    ),
                                    child: const Icon(
                                      FontAwesomeIcons.qrcode,
                                      size: 22,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      if (isGridView) {
                                        setState(() {
                                          isGridView = false;
                                        });
                                        print('$isGridView');
                                      } else {
                                        setState(() {
                                          isGridView = true;
                                        });
                                        print('$isGridView');
                                      }
                                    },
                                    style: ButtonStyle(
                                      enableFeedback: true,
                                      animationDuration:
                                          const Duration(microseconds: 1),
                                      overlayColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) => Colors.transparent),
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) => Colors.transparent),
                                      foregroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) {
                                        if (states.contains(
                                                MaterialState.hovered) ||
                                            states.contains(
                                                MaterialState.pressed)) {
                                          return Colors.white.withOpacity(0.5);
                                        }
                                        return Colors.white;
                                      }),
                                      padding:
                                          MaterialStateProperty.resolveWith(
                                        (states) => EdgeInsets.zero,
                                      ),
                                    ),
                                    child: Icon(
                                      isGridView
                                          ? FontAwesomeIcons.list
                                          : FontAwesomeIcons.borderAll,
                                      size: 22,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    if (!isQrScan) ...[
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: TabBarView(
                            physics: const BouncingScrollPhysics(),
                            children: state.categorizedProducts
                                .map(
                                  (categoryProd) => isGridView
                                      ? GridView.count(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10,
                                          childAspectRatio: 1.8,
                                          shrinkWrap: true,
                                          padding: const EdgeInsets.all(10),
                                          scrollDirection: Axis.horizontal,
                                          children: List.generate(
                                            state.user.previleges
                                                    .isActivatedProducts
                                                ? categoryProd.products.length +
                                                    1
                                                : categoryProd.products.length,
                                            (index) {
                                              if (index ==
                                                      categoryProd
                                                          .products.length &&
                                                  state.user.previleges
                                                      .isActivatedProducts) {
                                                return Bounce(
                                                  onPressed: () {
                                                    context.read<MainCubit>()
                                                      ..productInitial();
                                                    ExtendedNavigator.of(
                                                            context)
                                                        .push(Routes
                                                            .addProductView);
                                                  },
                                                  duration: const Duration(
                                                      milliseconds: 100),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFF4ecca3),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Center(
                                                      child: FaIcon(
                                                        FontAwesomeIcons.plus,
                                                        size: 40,
                                                        color: Colors.white
                                                            .withOpacity(0.5),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              return Bounce(
                                                onPressed: categoryProd
                                                            .products[index]
                                                            .productSoldBy ==
                                                        'Fraction'
                                                    ? () {}
                                                    : () {
                                                        setState(() {
                                                          isSearch = false;
                                                        });
                                                        context.read<
                                                            MainCubit>()
                                                          ..addProductToCart(
                                                              categoryProd
                                                                      .products[
                                                                  index]);
                                                      },
                                                duration: const Duration(
                                                    milliseconds: 100),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(int.parse(
                                                              (categoryProd
                                                                          .products[
                                                                              index]
                                                                          .productBGColor ??
                                                                      '#1C3044')
                                                                  .substring(
                                                                      1, 7),
                                                              radix: 16) +
                                                          0xFF000000),
                                                    ),
                                                    child: Stack(
                                                      fit: StackFit.expand,
                                                      children: [
                                                        Center(
                                                          child: Text(
                                                            '${categoryProd.products[index].productName[0]}',
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                      0.5),
                                                              fontFamily: 'vb',
                                                              fontSize: 100.sp,
                                                            ),
                                                          ),
                                                        ),
                                                        if (categoryProd
                                                                    .products[
                                                                        index]
                                                                    .productUint8ListImg !=
                                                                null &&
                                                            categoryProd
                                                                .products[index]
                                                                .productUint8ListImg
                                                                .isNotEmpty) ...[
                                                          Image.memory(
                                                            categoryProd
                                                                .products[index]
                                                                .productUint8ListImg,
                                                            fit: BoxFit.cover,
                                                            isAntiAlias: true,
                                                          ),
                                                        ],
                                                        Align(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          child: Container(
                                                            height: 100.h,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(int.parse(
                                                                          ((categoryProd.products[index].productUint8ListImg == null || categoryProd.products[index].productUint8ListImg.isEmpty) ? '#000000' : categoryProd.products[index].productBGColor).substring(
                                                                              1,
                                                                              7),
                                                                          radix:
                                                                              16) +
                                                                      0xFF000000)
                                                                  .withOpacity(
                                                                      0.6),
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        '${categoryProd.products[index].productName}',
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'vb',
                                                                          fontSize:
                                                                              32.sp,
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                    height:
                                                                        2.h),
                                                                Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        '${state.currency}${formatter.format(double.parse(categoryProd.products[index].productPrice))}',
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow.fade,
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'vb',
                                                                          fontSize:
                                                                              26.sp,
                                                                          color:
                                                                              Colors.white,
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
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: state.user.previleges
                                                  .isActivatedProducts
                                              ? categoryProd.products.length + 1
                                              : categoryProd.products.length,
                                          itemBuilder: (context, index) {
                                            if (index ==
                                                    categoryProd
                                                        .products.length &&
                                                state.user.previleges
                                                    .isActivatedProducts) {
                                              return Bounce(
                                                onPressed: () {
                                                  context.read<MainCubit>()
                                                    ..productInitial();
                                                  ExtendedNavigator.of(context)
                                                      .push(Routes
                                                          .addProductView);
                                                },
                                                duration: const Duration(
                                                    milliseconds: 100),
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 10.0,
                                                    vertical: 15,
                                                  ),
                                                  margin: const EdgeInsets.only(
                                                      bottom: 10,
                                                      left: 10,
                                                      right: 10),
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .primaryColorLight,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        height: 140.h,
                                                        width: 200.w,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 5,
                                                          vertical: 5,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: Center(
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .plus,
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.5),
                                                            size: 35,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 15),
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      'Add Product',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            'vb',
                                                                        fontSize:
                                                                            36.sp,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      'Register a product',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            'vr',
                                                                        fontSize:
                                                                            24.sp,
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
                                              );
                                            }
                                            return Bounce(
                                              onPressed: categoryProd
                                                          .products[index]
                                                          .productSoldBy ==
                                                      'Fraction'
                                                  ? () {}
                                                  : () {
                                                      setState(() {
                                                        isSearch = false;
                                                      });
                                                      context.read<MainCubit>()
                                                        ..addProductToCart(
                                                            categoryProd
                                                                    .products[
                                                                index]);
                                                      context.read<MainCubit>()
                                                        ..addProductToCart(
                                                            categoryProd
                                                                    .products[
                                                                index]);
                                                    },
                                              duration: const Duration(
                                                  milliseconds: 100),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10.0,
                                                  vertical: 15,
                                                ),
                                                margin: const EdgeInsets.only(
                                                    bottom: 10,
                                                    left: 10,
                                                    right: 10),
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .primaryColorLight,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    if (categoryProd
                                                                .products[index]
                                                                .productUint8ListImg !=
                                                            null &&
                                                        categoryProd
                                                            .products[index]
                                                            .productUint8ListImg
                                                            .isNotEmpty) ...[
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        child: Container(
                                                          height: 140.h,
                                                          width: 200.w,
                                                          child: Image.memory(
                                                            categoryProd
                                                                .products[index]
                                                                .productUint8ListImg,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                    if (categoryProd
                                                                .products[index]
                                                                .productUint8ListImg ==
                                                            null ||
                                                        categoryProd
                                                            .products[index]
                                                            .productUint8ListImg
                                                            .isEmpty) ...[
                                                      Container(
                                                        height: 140.h,
                                                        width: 200.w,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 5,
                                                          vertical: 5,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color(int.parse(
                                                                  (categoryProd
                                                                              .products[
                                                                                  index]
                                                                              .productBGColor ??
                                                                          '#1C3044')
                                                                      .substring(
                                                                          1, 7),
                                                                  radix: 16) +
                                                              0xFF000000),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            '${categoryProd.products[index].productName}',
                                                            textAlign: TextAlign
                                                                .center,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              fontFamily: 'vb',
                                                              fontSize: 36.sp,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                    Expanded(
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 15),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    '${categoryProd.products[index].productName}',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            'vb',
                                                                        fontSize:
                                                                            36.sp),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    '${state.currency}${formatter.format(double.parse(categoryProd.products[index].productPrice))}',
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'vb',
                                                                      fontSize:
                                                                          32.sp,
                                                                      color: Colors
                                                                          .white
                                                                          .withOpacity(
                                                                              0.5),
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
                                            );
                                          },
                                        ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (!isSearch) ...[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 130.h,
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 10,
                      right: 10,
                      left: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF0D161F).withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (state.curTransactionDetails.isEmpty) {
                                return showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(
                                      'Cart Empty',
                                      style: TextStyle(
                                        fontFamily: 'vb',
                                        fontSize: 36.sp,
                                        color:
                                            Theme.of(context).primaryColorDark,
                                      ),
                                    ),
                                    content: Text(
                                      'Your cart is empty, add items to the cart first.',
                                      style: TextStyle(
                                        fontFamily: 'vr',
                                        fontSize: 32.sp,
                                        color:
                                            Theme.of(context).primaryColorDark,
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            ExtendedNavigator.of(context).pop(),
                                        style: ButtonStyle(
                                          foregroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) {
                                            if (states.contains(
                                                    MaterialState.pressed) ||
                                                states.contains(
                                                    MaterialState.hovered)) {
                                              return Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.5);
                                            }
                                            return Theme.of(context)
                                                .primaryColor;
                                          }),
                                          animationDuration:
                                              const Duration(microseconds: 1),
                                          padding:
                                              MaterialStateProperty.resolveWith(
                                                  (states) => EdgeInsets.zero),
                                        ),
                                        child: Text(
                                          'Got it!',
                                          style: TextStyle(
                                            fontFamily: 'vb',
                                            fontSize: 36.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                    actionsPadding: const EdgeInsets.only(
                                      right: 10,
                                      bottom: 5,
                                    ),
                                  ),
                                );
                              }
                              context.read<MainCubit>()
                                ..setSelectedCartItemIndex(-1);
                              context.read<MainCubit>()..discountInitial();
                              ExtendedNavigator.of(context)
                                  .push(Routes.cartView);
                            },
                            style: Theme.of(context).elevatedButtonTheme.style,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${makeDoublesEasy(state.curTransactionDetails.fold(0, (sum, item) => sum + item.quantity))} Item(s)',
                                  style: TextStyle(
                                    fontFamily: 'vb',
                                    fontSize: 36.sp,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Icon(
                                  FontAwesomeIcons.shoppingCart,
                                  size: 22,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String makeDoublesEasy(double n) {
    if (n == n.floor()) {
      return '${n.floor()}';
    }
    if (n == n.round()) {
      return '${n.round()}';
    }
    return '$n';
  }

  dynamic build64Image(String base64Img) {
    var bytesImg = base64Decode(base64Img);
    return Image.memory(
      bytesImg,
      fit: BoxFit.cover,
      isAntiAlias: true,
    );
  }
}
