import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../cubits/Main/main_cubit.dart';

class AddNotesView extends StatelessWidget {
  final TextEditingController _textEditingController =
      TextEditingController(text: '');
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
            'Add Notes',
            style: TextStyle(
              fontFamily: 'vb',
              fontSize: 36.sp,
              color: Colors.white,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.read<MainCubit>()..notesInitial();
                _textEditingController.text = '';
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
              ),
              child: const Icon(
                FontAwesomeIcons.trash,
                size: 22,
              ),
            ),
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              height: ScreenUtil().screenHeight,
              width: ScreenUtil().screenWidth,
              padding: const EdgeInsets.only(top: 10),
              decoration:
                  BoxDecoration(color: Theme.of(context).primaryColorDark),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        maxLength: 250,
                        maxLines: 7,
                        controller: _textEditingController,
                        style: TextStyle(
                          fontFamily: 'vb',
                          fontSize: 36.sp,
                          color: Colors.white,
                        ),
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: InputDecoration(
                          counterStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'vb',
                            fontSize: 26.sp,
                          ),
                          contentPadding: const EdgeInsets.all(5),
                          hintText: 'Enter Notes here...',
                          hintStyle: TextStyle(
                            fontFamily: 'vb',
                            fontSize: 36.sp,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (value) => context.read<MainCubit>()
                          ..onTransactionNoteChanged(value),
                      ),
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
                        onPressed: () => ExtendedNavigator.of(context).pop(),
                        style: Theme.of(context).elevatedButtonTheme.style,
                        child: Text(
                          'Done',
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
}
