import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../cubits/Main/main_cubit.dart';

class GroupBusinessChatView extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColorLight,
          title: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${state.business.businessName} (Group Chat)',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'vb',
                        fontSize: 36.sp,
                      ),
                    ),
                  ),
                ],
              ),
              if (state.business.createdAtExternal != null) ...[
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Business Created at ${DateFormat().add_yMMMEd().add_Hm().format(state.business.createdAtExternal)}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'vr',
                          fontSize: 22.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {},
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
                FontAwesomeIcons.ellipsisV,
                size: 22,
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).primaryColorDark,
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 11,
              child: ListView(
                controller: _scrollController,
                shrinkWrap: true,
                children: List.generate(
                  state.businessMessageList.length,
                  (index) => Row(
                    mainAxisAlignment:
                        state.businessMessageList[index].userId ==
                                state.user.userId
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          constraints: BoxConstraints(
                            maxWidth: 500.w,
                          ),
                          child: Column(
                            crossAxisAlignment:
                                state.businessMessageList[index].userId ==
                                        state.user.userId
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  bottom: 3,
                                ),
                                child: Text(
                                  state.businessMessageList[index].userId ==
                                          state.user.userId
                                      ? 'You'
                                      : '${state.businessMessageList[index].senderFullName}',
                                  style: TextStyle(
                                    fontFamily: 'vb',
                                    fontSize: 28.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color:
                                      state.businessMessageList[index].userId ==
                                              state.user.userId
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      '${state.businessMessageList[index].message}',
                                      style: TextStyle(
                                        fontFamily: 'vb',
                                        fontSize: 32.sp,
                                        color: state.businessMessageList[index]
                                                    .userId ==
                                                state.user.userId
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${state.businessMessageList[index].timeStamp != null ? timeago.format(state.businessMessageList[index].timeStamp) : timeago.format(DateTime.now())}',
                                style: TextStyle(
                                  fontFamily: 'vr',
                                  fontSize: 22.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ).reversed.toList(growable: true),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: TextStyle(
                          fontFamily: 'vb',
                          fontSize: 28.sp,
                          color: Colors.black,
                        ),
                        textInputAction: TextInputAction.next,
                        controller: _messageController,
                        maxLength: 250,
                        maxLines: 2,
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
                          hintText: 'Message here...',
                          hintStyle:
                              Theme.of(context).textTheme.subtitle2.copyWith(
                                    color: Colors.grey,
                                  ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onChanged: (value) => context.read<MainCubit>()
                          ..onBusinessChatChanged(value),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: state.businessChatMessage.isEmpty
                        ? null
                        : () {
                            _messageController.clear();
                            context.read<MainCubit>()
                              ..sendBusinessMessage(
                                state.businessChatMessage,
                                onSuccess: () {
                                  _scrollController.animateTo(
                                    _scrollController.position.maxScrollExtent,
                                    duration: const Duration(milliseconds: 250),
                                    curve: Curves.ease,
                                  );
                                  context.read<MainCubit>()
                                    ..businessChatInitial();
                                },
                                onError: (msg) {
                                  _messageController.clear();
                                },
                              );
                          },
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: const Icon(
                      FontAwesomeIcons.paperPlane,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String timeAgoLocal(String timestamp) {
    final year = int.parse(timestamp.substring(0, 4));
    final month = int.parse(timestamp.substring(5, 7));
    final day = int.parse(timestamp.substring(8, 10));
    final hour = int.parse(timestamp.substring(11, 13));
    final minute = int.parse(timestamp.substring(14, 16));

    final videoDate = DateTime(year, month, day, hour, minute);
    final diffInHours = DateTime.now().difference(videoDate).inHours;

    var timeAgo = '';
    var timeUnit = '';
    var timeValue = 0;

    if (diffInHours < 1) {
      final diffInMinutes = DateTime.now().difference(videoDate).inMinutes;
      timeValue = diffInMinutes;
      timeUnit = 'minute';
    } else if (diffInHours < 24) {
      timeValue = diffInHours;
      timeUnit = 'hour';
    } else if (diffInHours >= 24 && diffInHours < 24 * 7) {
      timeValue = (diffInHours / 24).floor();
      timeUnit = 'day';
    } else if (diffInHours >= 24 * 7 && diffInHours < 24 * 30) {
      timeValue = (diffInHours / (24 * 7)).floor();
      timeUnit = 'week';
    } else if (diffInHours >= 24 * 30 && diffInHours < 24 * 12 * 30) {
      timeValue = (diffInHours / (24 * 30)).floor();
      timeUnit = 'month';
    } else {
      timeValue = (diffInHours / (24 * 365)).floor();
      timeUnit = 'year';
    }

    timeAgo = timeValue.toString() + ' ' + timeUnit;
    timeAgo += timeValue > 1 ? 's' : '';

    return timeAgo + ' ago';
  }
}
