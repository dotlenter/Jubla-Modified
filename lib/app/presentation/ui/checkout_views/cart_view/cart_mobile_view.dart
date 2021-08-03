import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../cubits/Main/main_cubit.dart';
import '../../../routes/auto_router.gr.dart';

class CartMobileView extends StatelessWidget {
  final formatter = NumberFormat('#,##0.00', 'en_PH');
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: true,
          backgroundColor: Theme.of(context).primaryColorDark,
          leading: IconButton(
            onPressed: () => ExtendedNavigator.of(context).pop(),
            icon: const FaIcon(
              FontAwesomeIcons.angleLeft,
              color: Colors.white,
              size: 25,
            ),
          ),
          title: Text(
            'Cart',
            style: TextStyle(
              fontFamily: 'vb',
              fontSize: 36.sp,
              color: Colors.white,
            ),
          ),
          actions: [
            state.customer == null
                ? TextButton(
                    onPressed: () => ExtendedNavigator.of(context)
                        .push(Routes.addCustomerCartView),
                    child: const FaIcon(
                      FontAwesomeIcons.userPlus,
                      size: 22,
                    ),
                  )
                : Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 10,
                        ),
                        child: TextButton(
                          onPressed: () => ExtendedNavigator.of(context)
                              .push(Routes.addCustomerCartView),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                '${state.customer.customerName}',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'vb',
                                  fontSize: 26.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              height: ScreenUtil().screenHeight,
              width: ScreenUtil().screenWidth,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
              ),
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            reverse: true,
                            padding: const EdgeInsets.only(bottom: 100),
                            children: List.generate(
                              state.curTransactionDetails.length + 1,
                              (index) {
                                if (index ==
                                    state.curTransactionDetails.length) {
                                  return Column(
                                    children: [
                                      Container(
                                        height: 100.h,
                                        margin: const EdgeInsets.only(
                                          top: 10,
                                          right: 10,
                                          left: 10,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            if (state.user.previleges
                                                .canMakeDiscounts) ...[
                                              Expanded(
                                                child: Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(horizontal: 3),
                                                  child: ElevatedButton(
                                                    onPressed: () =>
                                                        ExtendedNavigator.of(
                                                                context)
                                                            .push(Routes
                                                                .addDiscountView),
                                                    style: Theme.of(context)
                                                        .elevatedButtonTheme
                                                        .style
                                                        .copyWith(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .resolveWith(
                                                                  (states) {
                                                        if (states.contains(MaterialState.pressed) ||
                                                            states.contains(
                                                                MaterialState
                                                                    .hovered) ||
                                                            states.contains(
                                                                MaterialState
                                                                    .disabled)) {
                                                          return Theme.of(
                                                                  context)
                                                              .primaryColorLight
                                                              .withOpacity(0.5);
                                                        }
                                                        return Theme.of(context)
                                                            .primaryColorLight;
                                                      }),
                                                      foregroundColor:
                                                          MaterialStateProperty
                                                              .resolveWith(
                                                                  (states) {
                                                        if (states.contains(MaterialState.pressed) ||
                                                            states.contains(
                                                                MaterialState
                                                                    .hovered) ||
                                                            states.contains(
                                                                MaterialState
                                                                    .disabled)) {
                                                          return Colors.white
                                                              .withOpacity(0.5);
                                                        }
                                                        return Colors.white;
                                                      }),
                                                    ),
                                                    child: Text(
                                                      'Discount',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily: 'vb',
                                                        fontSize: 32.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                            Expanded(
                                              child: Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 3),
                                                child: ElevatedButton(
                                                  onPressed: () =>
                                                      ExtendedNavigator.of(
                                                              context)
                                                          .push(Routes
                                                              .addNotesView),
                                                  style: Theme.of(context)
                                                      .elevatedButtonTheme
                                                      .style
                                                      .copyWith(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .resolveWith(
                                                                (states) {
                                                      if (states.contains(MaterialState.pressed) ||
                                                          states.contains(
                                                              MaterialState
                                                                  .hovered) ||
                                                          states.contains(
                                                              MaterialState
                                                                  .disabled)) {
                                                        return Theme.of(context)
                                                            .primaryColorLight
                                                            .withOpacity(0.5);
                                                      }
                                                      return Theme.of(context)
                                                          .primaryColorLight;
                                                    }),
                                                    foregroundColor:
                                                        MaterialStateProperty
                                                            .resolveWith(
                                                                (states) {
                                                      if (states.contains(MaterialState.pressed) ||
                                                          states.contains(
                                                              MaterialState
                                                                  .hovered) ||
                                                          states.contains(
                                                              MaterialState
                                                                  .disabled)) {
                                                        return Colors.white
                                                            .withOpacity(0.5);
                                                      }
                                                      return Colors.white;
                                                    }),
                                                  ),
                                                  child: Text(
                                                    'Add Notes',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily: 'vb',
                                                      fontSize: 32.sp,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 3),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    context.read<MainCubit>()
                                                      ..clearCart();
                                                    ExtendedNavigator.of(
                                                            context)
                                                        .pop();
                                                  },
                                                  style: Theme.of(context)
                                                      .elevatedButtonTheme
                                                      .style
                                                      .copyWith(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .resolveWith(
                                                                (states) {
                                                      if (states.contains(MaterialState.pressed) ||
                                                          states.contains(
                                                              MaterialState
                                                                  .hovered) ||
                                                          states.contains(
                                                              MaterialState
                                                                  .disabled)) {
                                                        return Colors.red[300]
                                                            .withOpacity(0.5);
                                                      }
                                                      return Colors.red[300];
                                                    }),
                                                    foregroundColor:
                                                        MaterialStateProperty
                                                            .resolveWith(
                                                                (states) {
                                                      if (states.contains(MaterialState.pressed) ||
                                                          states.contains(
                                                              MaterialState
                                                                  .hovered) ||
                                                          states.contains(
                                                              MaterialState
                                                                  .disabled)) {
                                                        return Colors.white
                                                            .withOpacity(0.5);
                                                      }
                                                      return Colors.white;
                                                    }),
                                                  ),
                                                  child: Text(
                                                    'Clear Cart',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily: 'vb',
                                                      fontSize: 32.sp,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (state.discountInAmount > 0) ...[
                                        Container(
                                          margin: const EdgeInsets.only(
                                            top: 10,
                                            right: 10,
                                            left: 10,
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Subtotal: ${state.currency}${formatter.format(state.subtotalAmount)}',
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                    fontFamily: 'vr',
                                                    fontSize: 48.sp,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                      if (state.discountInAmount > 0) ...[
                                        Container(
                                          margin: const EdgeInsets.only(
                                            top: 10,
                                            right: 10,
                                            left: 10,
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Less: -${state.currency}${formatter.format(state.discountInAmount)}'
                                                  ' (${state.discountInPercent.toStringAsFixed(2)}%)',
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                    fontFamily: 'vr',
                                                    fontSize: 42.sp,
                                                    color: Colors.red[300],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                      Container(
                                        margin: const EdgeInsets.only(
                                          top: 10,
                                          right: 10,
                                          left: 10,
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'TOTAL: ${state.currency}${formatter.format(state.totalAmount)}',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                  fontFamily: 'vb',
                                                  fontSize: 42.sp,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (state.transactionNote.isNotEmpty) ...[
                                        Container(
                                          margin: const EdgeInsets.only(
                                            top: 10,
                                            right: 10,
                                            left: 10,
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Note: ${state.transactionNote}',
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                    fontFamily: 'vr',
                                                    fontSize: 32.sp,
                                                    color: Theme.of(context)
                                                        .primaryColor
                                                        .withOpacity(0.7),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ],
                                  );
                                }
                                return Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                        bottom: 5,
                                        right: 10,
                                        left: 10,
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (state.selectedCartItemIndex ==
                                              index) {
                                            context.read<MainCubit>()
                                              ..setSelectedCartItemIndex(-1);
                                          } else {
                                            context.read<MainCubit>()
                                              ..setSelectedCartItemIndex(index);
                                            context.read<MainCubit>()
                                              ..setCartItem(
                                                  state.curTransactionDetails[
                                                      index]);
                                          }
                                        },
                                        style: Theme.of(context)
                                            .elevatedButtonTheme
                                            .style
                                            .copyWith(
                                          backgroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) {
                                            if (state.selectedCartItemIndex ==
                                                index) {
                                              return Theme.of(context)
                                                  .primaryColorLight;
                                            }
                                            if (state.selectedCartItemIndex >
                                                -1) {
                                              return Theme.of(context)
                                                  .primaryColorLight
                                                  .withOpacity(0.5);
                                            }

                                            if (states.contains(
                                                    MaterialState.pressed) ||
                                                states.contains(
                                                    MaterialState.hovered) ||
                                                states.contains(
                                                    MaterialState.disabled)) {
                                              return Theme.of(context)
                                                  .primaryColorLight
                                                  .withOpacity(0.5);
                                            }
                                            return Theme.of(context)
                                                .primaryColorLight;
                                          }),
                                          foregroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) {
                                            if (state.selectedCartItemIndex ==
                                                index) {
                                              return Colors.white;
                                            }
                                            if (state.selectedCartItemIndex >
                                                -1) {
                                              return Colors.white
                                                  .withOpacity(0.5);
                                            }

                                            if (states.contains(
                                                    MaterialState.pressed) ||
                                                states.contains(
                                                    MaterialState.hovered) ||
                                                states.contains(
                                                    MaterialState.disabled)) {
                                              return Colors.white
                                                  .withOpacity(0.5);
                                            }
                                            return Colors.white;
                                          }),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    'x${funWithDouble(state.curTransactionDetails[index].quantity)}',
                                                    style: TextStyle(
                                                      fontFamily: 'vr',
                                                      fontSize: 36.sp,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              '${state.curTransactionDetails[index].productName}',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'vb',
                                                                fontSize: 36.sp,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              '${state.currency}${formatter.format(state.curTransactionDetails[index].productPrice)}',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'vr',
                                                                fontSize: 36.sp,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (state
                                                        .curTransactionDetails[
                                                            index]
                                                        .discountInCash >
                                                    0) ...[
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      '${state.currency}${formatter.format(state.curTransactionDetails[index].totalAmount)}',
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                        fontFamily: 'vb',
                                                        fontSize: 36.sp,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                                if (state
                                                        .curTransactionDetails[
                                                            index]
                                                        .discountInCash ==
                                                    0) ...[
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      '${state.currency}${formatter.format(state.curTransactionDetails[index].totalAmount)}',
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                        fontFamily: 'vb',
                                                        fontSize: 36.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    if (state.selectedCartItemIndex ==
                                        index) ...[
                                      Container(
                                        padding: const EdgeInsets.only(
                                          bottom: 5,
                                          right: 10,
                                          left: 10,
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Theme.of(context)
                                                        .primaryColorLight,
                                                    width: 2,
                                                  ),
                                                ),
                                                padding: const EdgeInsets.only(
                                                  right: 5,
                                                  left: 5,
                                                ),
                                                child: TextButton(
                                                  onPressed: () {
                                                    if (state.cartItem
                                                                .discountInCash <=
                                                            0 ||
                                                        state.cartItem
                                                                .discountInPercent <=
                                                            0) {
                                                      context.read<MainCubit>()
                                                        ..cartItemQtyInitial();
                                                      context.read<MainCubit>()
                                                        ..setCartItemQty(state
                                                            .curTransactionDetails[
                                                                index]
                                                            .quantity);
                                                      ExtendedNavigator.of(
                                                              context)
                                                          .push(Routes
                                                              .editCartQuantityView);
                                                    } else {
                                                      return showDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            AlertDialog(
                                                          title: Text(
                                                            'Remove discount',
                                                            style: TextStyle(
                                                              fontFamily: 'vb',
                                                              fontSize: 36.sp,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColorDark,
                                                            ),
                                                          ),
                                                          content: Text(
                                                            'Once you edit this product, the '
                                                            'discount that\'s been already applied'
                                                            ' to it will be removed. Would you like to proceed?',
                                                            textAlign: TextAlign
                                                                .justify,
                                                            style: TextStyle(
                                                              fontFamily: 'vr',
                                                              fontSize: 32.sp,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColorDark,
                                                            ),
                                                          ),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  ExtendedNavigator.of(
                                                                          context)
                                                                      .pop(),
                                                              style:
                                                                  ButtonStyle(
                                                                foregroundColor:
                                                                    MaterialStateProperty
                                                                        .resolveWith(
                                                                            (states) {
                                                                  if (states.contains(
                                                                          MaterialState
                                                                              .pressed) ||
                                                                      states.contains(
                                                                          MaterialState
                                                                              .hovered)) {
                                                                    return Theme.of(
                                                                            context)
                                                                        .primaryColor
                                                                        .withOpacity(
                                                                            0.5);
                                                                  }
                                                                  return Theme.of(
                                                                          context)
                                                                      .primaryColor;
                                                                }),
                                                                animationDuration:
                                                                    const Duration(
                                                                        microseconds:
                                                                            1),
                                                                padding: MaterialStateProperty
                                                                    .resolveWith(
                                                                        (states) =>
                                                                            EdgeInsets.zero),
                                                              ),
                                                              child: Text(
                                                                'Cancel',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'vb',
                                                                  fontSize:
                                                                      36.sp,
                                                                ),
                                                              ),
                                                            ),
                                                            TextButton(
                                                              onPressed: () {
                                                                context.read<
                                                                    MainCubit>()
                                                                  ..cartItemQtyInitial();
                                                                context.read<
                                                                    MainCubit>()
                                                                  ..setCartItemQty(state
                                                                      .curTransactionDetails[
                                                                          index]
                                                                      .quantity);
                                                                ExtendedNavigator.of(
                                                                        context)
                                                                    .pop();
                                                                ExtendedNavigator.of(
                                                                        context)
                                                                    .push(Routes
                                                                        .editCartQuantityView);
                                                              },
                                                              style:
                                                                  ButtonStyle(
                                                                foregroundColor:
                                                                    MaterialStateProperty
                                                                        .resolveWith(
                                                                            (states) {
                                                                  if (states.contains(
                                                                          MaterialState
                                                                              .pressed) ||
                                                                      states.contains(
                                                                          MaterialState
                                                                              .hovered)) {
                                                                    return Theme.of(
                                                                            context)
                                                                        .primaryColor
                                                                        .withOpacity(
                                                                            0.5);
                                                                  }
                                                                  return Theme.of(
                                                                          context)
                                                                      .primaryColor;
                                                                }),
                                                                animationDuration:
                                                                    const Duration(
                                                                        microseconds:
                                                                            1),
                                                                padding: MaterialStateProperty
                                                                    .resolveWith(
                                                                        (states) =>
                                                                            EdgeInsets.zero),
                                                              ),
                                                              child: Text(
                                                                'Yes',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'vb',
                                                                  fontSize:
                                                                      36.sp,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                          actionsPadding:
                                                              const EdgeInsets
                                                                  .only(
                                                            right: 10,
                                                            bottom: 5,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  child: Column(
                                                    children: [
                                                      const Icon(
                                                        FontAwesomeIcons.box,
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              '${funWithDouble(state.curTransactionDetails[index].quantity)} Items',
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'vb',
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
                                            ),
                                            if (state.user.previleges
                                                .canMakeDiscounts) ...[
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Theme.of(context)
                                                          .primaryColorLight,
                                                      width: 2,
                                                    ),
                                                  ),
                                                  padding:
                                                      const EdgeInsets.only(
                                                    right: 5,
                                                    left: 5,
                                                  ),
                                                  child: TextButton(
                                                    onPressed: () {
                                                      context.read<MainCubit>()
                                                        ..setCartItemDiscounts(
                                                          state.cartItem
                                                              .discountInCash,
                                                          state.cartItem
                                                              .discountInPercent,
                                                        );
                                                      ExtendedNavigator.of(
                                                              context)
                                                          .push(Routes
                                                              .editCartDiscountView);
                                                    },
                                                    style: Theme.of(context)
                                                        .textButtonTheme
                                                        .style
                                                        .copyWith(
                                                      foregroundColor:
                                                          MaterialStateProperty
                                                              .resolveWith(
                                                        (states) {
                                                          if (states.contains(MaterialState.pressed) ||
                                                              states.contains(
                                                                  MaterialState
                                                                      .hovered) ||
                                                              states.contains(
                                                                  MaterialState
                                                                      .disabled)) {
                                                            return Theme.of(
                                                                    context)
                                                                .primaryColor
                                                                .withOpacity(
                                                                    0.6);
                                                          }
                                                          return Theme.of(
                                                                  context)
                                                              .primaryColor;
                                                        },
                                                      ),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        const Icon(
                                                          FontAwesomeIcons.tag,
                                                        ),
                                                        const SizedBox(
                                                            height: 5),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                'Discount',
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'vb',
                                                                  fontSize:
                                                                      28.sp,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Theme.of(context)
                                                        .primaryColorLight,
                                                    width: 2,
                                                  ),
                                                ),
                                                padding: const EdgeInsets.only(
                                                  right: 5,
                                                  left: 5,
                                                ),
                                                child: TextButton(
                                                  onPressed: () {
                                                    context.read<MainCubit>()
                                                      ..removeProductToCart(
                                                          state.curTransactionDetails[
                                                              index]);
                                                    context.read<MainCubit>()
                                                      ..selectedCartItemIndexInitial();
                                                    if (state
                                                        .curTransactionDetails
                                                        .isEmpty) {
                                                      ExtendedNavigator.of(
                                                              context)
                                                          .pop();
                                                    }
                                                  },
                                                  child: Column(
                                                    children: [
                                                      const Icon(
                                                        FontAwesomeIcons
                                                            .trashAlt,
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Remove',
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'vb',
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
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ],
                                );
                              },
                            ).reversed.toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
                      child: ElevatedButton(
                        onPressed: state.curTransactionDetails.isEmpty
                            ? null
                            : () {
                                context.read<MainCubit>()..cashInitial();
                                ExtendedNavigator.of(context)
                                    .push(Routes.payView);
                              },
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.transparent),
                          backgroundColor: MaterialStateProperty.resolveWith(
                            (states) {
                              if (states.contains(MaterialState.hovered) ||
                                  states.contains(MaterialState.disabled)) {
                                return Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.7);
                              }
                              return Theme.of(context).primaryColor;
                            },
                          ),
                          padding: MaterialStateProperty.resolveWith(
                            (states) =>
                                const EdgeInsets.symmetric(vertical: 15),
                          ),
                        ),
                        child: Text(
                          'Pay',
                          style: TextStyle(
                            fontFamily: 'vb',
                            fontSize: 42.sp,
                            color: Colors.white,
                          ),
                        ),
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

  String funWithDouble(double n) {
    return n.toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '');
  }
}
