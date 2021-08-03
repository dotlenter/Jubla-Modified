import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../cubits/Main/main_cubit.dart';

class AddCategoryView extends StatelessWidget {
  const AddCategoryView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) => WillPopScope(
        onWillPop: () async => !state.isCreatingCategory,
        child: Scaffold(
          appBar: AppBar(
            elevation: 5,
            titleSpacing: 0,
            backgroundColor: Theme.of(context).primaryColorLight,
            leading: Builder(
              builder: (context) => TextButton(
                onPressed: () => ExtendedNavigator.of(context).pop(),
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
              'Add Category',
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
                height: ScreenUtil().screenHeight,
                width: ScreenUtil().screenWidth,
                padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColorDark),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              maxLength: 100,
                              maxLines: 5,
                              style: TextStyle(
                                fontFamily: 'vb',
                                fontSize: 36.sp,
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                counterStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'vb',
                                  fontSize: 32.sp,
                                ),
                                contentPadding: const EdgeInsets.all(5),
                                hintText: 'Category name',
                                hintStyle: TextStyle(
                                  fontFamily: 'vb',
                                  fontSize: 32.sp,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              onChanged: (value) => context.read<MainCubit>()
                                ..onCategoryNameChanged(value),
                            ),
                          ),
                        ],
                      ),
                    ],
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
                              ..createProductCategory(
                                state.business.businessId,
                                state.categoryName,
                                state.user.fullName,
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
                              'Create Category',
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
              if (state.isCreatingCategory) ...[
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
}
