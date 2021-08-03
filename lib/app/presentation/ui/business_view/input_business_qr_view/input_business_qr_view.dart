import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../cubits/Main/main_cubit.dart';

class InputBusinenssQRView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          titleSpacing: 0,
          backgroundColor: Theme.of(context).primaryColorDark,
          leading: Builder(
            builder: (context) => TextButton(
              onPressed: () {
                if (ExtendedNavigator.of(context).canPop()) {
                  ExtendedNavigator.of(context).pop();
                }
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
                FontAwesomeIcons.angleLeft,
                size: 22,
              ),
            ),
          ),
          title: Text(
            'Input QR',
            style: TextStyle(
              fontFamily: 'vb',
              fontSize: 36.sp,
              color: Colors.white,
            ),
          ),
          actions: [],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
              ),
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
                            hintText: 'Code',
                            hintStyle: TextStyle(
                              fontFamily: 'vr',
                              fontSize: 36.sp,
                              color: Colors.white.withOpacity(0.5),
                            ),
                            prefixIcon: const Icon(
                              FontAwesomeIcons.code,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Theme.of(context).primaryColorLight,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onFieldSubmitted: (value) {
                            context.read<MainCubit>()
                              ..getBusinessWithOwnerByCode(
                                value,
                                onSuccess: () {},
                                onError: (msg) {},
                              );
                          },
                          onChanged: (value) => context.read<MainCubit>()
                            ..onPartnerBusinessCodeChanged(value),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.filteredAvailablePartnerList.length,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '${state.filteredAvailablePartnerList[index].businessName}',
                                    style: TextStyle(
                                      fontFamily: 'vb',
                                      fontSize: 36.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '${state.filteredAvailablePartnerList[index].ownerName}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: 'vr',
                                      fontSize: 26.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '${state.filteredAvailablePartnerList[index].businessAddress1}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: 'vr',
                                      fontSize: 26.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () => context.read<MainCubit>()
                                    ..makePartnerRequest(
                                      state.user.userId,
                                      state.filteredAvailablePartnerList[index]
                                          .userId,
                                      state.filteredAvailablePartnerList[index]
                                          .businessId,
                                      onSuccess: () => Fluttertoast.showToast(
                                        msg: 'Sent Request.',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 26.sp,
                                      ),
                                      onError: (msg) => Fluttertoast.showToast(
                                        msg: '$msg',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 26.sp,
                                      ),
                                    ),
                                  style: Theme.of(context)
                                      .elevatedButtonTheme
                                      .style,
                                  child: Text(
                                    'Send Partner request',
                                    style: TextStyle(
                                      fontFamily: 'vb',
                                      fontSize: 32.sp,
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
            ),
            if (state.isSendingPartnerRequest) ...[
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF0D161F).withOpacity(0.6),
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
    );
  }
}
