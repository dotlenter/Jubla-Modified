import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../cubits/Main/main_cubit.dart';
import '../../routes/auto_router.gr.dart';
import '../../widgets/navig_drawer.dart';

class ProductsMobileView extends StatelessWidget {
  ProductsMobileView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              size: 22,
            ),
          ),
        ),
        title: Text(
          'Products',
          style: TextStyle(
            fontFamily: 'vb',
            fontSize: 36.sp,
            color: Colors.white,
          ),
        ),
        actions: [],
      ),
      drawer: const NavigDrawer(),
      body: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) => Stack(
          fit: StackFit.expand,
          children: [
            Container(
              height: ScreenUtil().screenHeight,
              width: ScreenUtil().screenWidth,
              padding: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
              ),
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.0),
                                border: Border(
                                  bottom: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                              child: TabBar(
                                indicatorColor: Theme.of(context).accentColor,
                                indicatorWeight: 4,
                                unselectedLabelColor: Colors.grey,
                                // isScrollable: true,
                                labelStyle:
                                    Theme.of(context).textTheme.bodyText2,
                                tabs: [
                                  const Tab(text: 'ITEMS'),
                                  const Tab(text: 'INVENTORY'),
                                  const Tab(text: 'CATEGORIES'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          /// [ITEMS]
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        style: TextStyle(
                                          fontFamily: 'vb',
                                          fontSize: 36.sp,
                                          color: Colors.white,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: 'Search Items',
                                          hintStyle: TextStyle(
                                            fontFamily: 'vr',
                                            fontSize: 36.sp,
                                            color:
                                                Colors.white.withOpacity(0.5),
                                          ),
                                          prefixIcon: const Icon(
                                            FontAwesomeIcons.search,
                                            color: Colors.white,
                                          ),
                                          filled: true,
                                          fillColor: Theme.of(context)
                                              .primaryColorLight,
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          suffixIcon: TextButton(
                                            onPressed: () =>
                                                ExtendedNavigator.of(context)
                                                    .push(
                                                        Routes.addProductView),
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
                                                  return Colors.white
                                                      .withOpacity(0.6);
                                                }
                                                return Colors.white;
                                              }),
                                              padding: MaterialStateProperty
                                                  .resolveWith((states) =>
                                                      EdgeInsets.zero),
                                            ),
                                            child: const Icon(
                                                FontAwesomeIcons.plus),
                                          ),
                                        ),
                                        onChanged: (value) =>
                                            context.read<MainCubit>()
                                              ..onProductSearch(value),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        state.filteredAllProductList.length + 1,
                                    itemBuilder: (context, index) {
                                      if (index ==
                                          state.filteredAllProductList.length) {
                                        return Bounce(
                                          onPressed: () {
                                            context.read<MainCubit>()
                                              ..productInitial();
                                            ExtendedNavigator.of(context)
                                                .push(Routes.addProductView);
                                          },
                                          duration:
                                              const Duration(milliseconds: 100),
                                          child: Container(
                                            padding: const EdgeInsets.all(10.0),
                                            margin: const EdgeInsets.only(
                                                bottom: 10, left: 5, right: 5),
                                            decoration: const BoxDecoration(
                                                color: Colors.transparent),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 140.h,
                                                  width: 200.w,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 5,
                                                    vertical: 5,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Center(
                                                    child: FaIcon(
                                                      FontAwesomeIcons.plus,
                                                      color: Colors.white
                                                          .withOpacity(0.5),
                                                      size: 35,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.only(
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
                                        onPressed: () {
                                          context.read<MainCubit>()
                                            ..setEditProduct(state
                                                .filteredAllProductList[index]);
                                          ExtendedNavigator.of(context)
                                              .push(Routes.editProductView);
                                        },
                                        duration:
                                            const Duration(milliseconds: 100),
                                        child: Container(
                                          padding: const EdgeInsets.all(10.0),
                                          margin: const EdgeInsets.only(
                                              bottom: 10, left: 2, right: 2),
                                          decoration: const BoxDecoration(
                                              color: Colors.transparent),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (state
                                                      .filteredAllProductList[
                                                          index]
                                                      .productUint8ListImg !=
                                                  null) ...[
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  child: Container(
                                                    height: 140.h,
                                                    width: 200.w,
                                                    child: Image.memory(
                                                      state
                                                          .filteredAllProductList[
                                                              index]
                                                          .productUint8ListImg,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              if (state
                                                      .filteredAllProductList[
                                                          index]
                                                      .productUint8ListImg ==
                                                  null) ...[
                                                Container(
                                                  height: 140.h,
                                                  width: 200.w,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 5,
                                                    vertical: 5,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Color(int.parse(
                                                            (state.filteredAllProductList[index]
                                                                        .productBGColor ??
                                                                    '#1C3044')
                                                                .substring(1, 7),
                                                            radix: 16) +
                                                        0xFF000000),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '${state.filteredAllProductList[index].productName}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontFamily: 'vb',
                                                        fontSize: 36.sp,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              Expanded(
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              '${state.filteredAllProductList[index].productName}',
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
                                                              'P${state.filteredAllProductList[index].productPrice}',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'vr',
                                                                fontSize: 32.sp,
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.5),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Sold By',
                                                            style: TextStyle(
                                                              fontFamily: 'vr',
                                                              fontSize: 30.sp,
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                      0.5),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              ' ${state.filteredAllProductList[index].productSoldBy}',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'vb',
                                                                fontSize: 30.sp,
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.5),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 2.h),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right: 5),
                                                            child: Icon(
                                                              FontAwesomeIcons
                                                                  .userEdit,
                                                              color: Colors.blue
                                                                  .withOpacity(
                                                                      0.5),
                                                              size: 12,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              ' ${state.filteredAllProductList[index].createdBy}',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'vb',
                                                                fontSize: 30.sp,
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
                                ),
                              ],
                            ),
                          ),
                          //// [INVENTORY]
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        style: TextStyle(
                                          fontFamily: 'vb',
                                          fontSize: 36.sp,
                                          color: Colors.white,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: 'Search Items',
                                          hintStyle: TextStyle(
                                            fontFamily: 'vr',
                                            fontSize: 36.sp,
                                            color:
                                                Colors.white.withOpacity(0.5),
                                          ),
                                          prefixIcon: const Icon(
                                            FontAwesomeIcons.search,
                                            color: Colors.white,
                                          ),
                                          filled: true,
                                          fillColor: Theme.of(context)
                                              .primaryColorLight,
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          suffixIcon: TextButton(
                                            onPressed: () =>
                                                ExtendedNavigator.of(context)
                                                    .push(
                                                        Routes.addProductView),
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
                                                  return Colors.white
                                                      .withOpacity(0.6);
                                                }
                                                return Colors.white;
                                              }),
                                              padding: MaterialStateProperty
                                                  .resolveWith((states) =>
                                                      EdgeInsets.zero),
                                            ),
                                            child: const Icon(FontAwesomeIcons
                                                .sortAmountUpAlt),
                                          ),
                                        ),
                                        onChanged: (value) =>
                                            context.read<MainCubit>()
                                              ..onProductSearch(value),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(10),
                                    itemCount:
                                        state.filteredAllProductList.length,
                                    itemBuilder: (context, index) {
                                      return Bounce(
                                        onPressed: () {
                                          context.read<MainCubit>()
                                            ..setActiveStockProduct(state
                                                .filteredAllProductList[index]);
                                          ExtendedNavigator.of(context)
                                              .push(Routes.addStocksView);
                                        },
                                        duration:
                                            const Duration(milliseconds: 100),
                                        child: Container(
                                          padding: const EdgeInsets.all(10.0),
                                          margin: const EdgeInsets.only(
                                              bottom: 10, left: 2, right: 2),
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .primaryColorLight,
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              if (state
                                                      .filteredAllProductList[
                                                          index]
                                                      .productUint8ListImg !=
                                                  null) ...[
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  child: Container(
                                                    height: 140.h,
                                                    width: 200.w,
                                                    child: Image.memory(
                                                      state
                                                          .filteredAllProductList[
                                                              index]
                                                          .productUint8ListImg,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              if (state
                                                      .filteredAllProductList[
                                                          index]
                                                      .productUint8ListImg ==
                                                  null) ...[
                                                Container(
                                                  height: 140.h,
                                                  width: 200.w,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 5,
                                                    vertical: 5,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Color(int.parse(
                                                            (state.filteredAllProductList[index]
                                                                        .productBGColor ??
                                                                    '#1C3044')
                                                                .substring(1, 7),
                                                            radix: 16) +
                                                        0xFF000000),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '${state.filteredAllProductList[index].productName}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontFamily: 'vb',
                                                        fontSize: 36.sp,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              Expanded(
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              '${state.filteredAllProductList[index].productName}',
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
                                                      if (state
                                                              .filteredAllProductList[
                                                                  index]
                                                              .isProductInventory ==
                                                          1) ...[
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                'Stocks: ${state.filteredAllProductList[index].productQuantity}',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'vr',
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
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        style: TextStyle(
                                          fontFamily: 'vb',
                                          fontSize: 36.sp,
                                          color: Colors.white,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: 'Search Categories',
                                          hintStyle: TextStyle(
                                            fontFamily: 'vr',
                                            fontSize: 36.sp,
                                            color:
                                                Colors.white.withOpacity(0.5),
                                          ),
                                          prefixIcon: const Icon(
                                            FontAwesomeIcons.search,
                                            color: Colors.white,
                                          ),
                                          suffixIcon: TextButton(
                                            onPressed: () =>
                                                ExtendedNavigator.of(context)
                                                    .push(
                                                        Routes.addCategoryView),
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
                                                  return Colors.white
                                                      .withOpacity(0.6);
                                                }
                                                return Colors.white;
                                              }),
                                              padding: MaterialStateProperty
                                                  .resolveWith((states) =>
                                                      EdgeInsets.zero),
                                            ),
                                            child: const Icon(
                                                FontAwesomeIcons.plus),
                                          ),
                                          filled: true,
                                          fillColor: Theme.of(context)
                                              .primaryColorLight,
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                        onChanged: (value) =>
                                            context.read<MainCubit>()
                                              ..onCategorySearch(value),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ListView(
                                        shrinkWrap: true,
                                        children: List.generate(
                                          state.filteredCategoryList.length,
                                          (index) => TextButton(
                                            onPressed: () {},
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
                                                  return Colors.white
                                                      .withOpacity(0.6);
                                                }
                                                return Colors.white;
                                              }),
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  '${state.filteredCategoryList[index].categoryName}',
                                                  style: TextStyle(
                                                    fontFamily: 'vb',
                                                    fontSize: 36.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
