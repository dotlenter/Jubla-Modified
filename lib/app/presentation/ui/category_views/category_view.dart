import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../cubits/Main/main_cubit.dart';
import '../../routes/auto_router.gr.dart';

// ignore: must_be_immutable
class CategoryView extends StatefulWidget {
  Function(String msg) onSelectedCategoryChanged;
  CategoryView({Key key, this.onSelectedCategoryChanged}) : super(key: key);

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Categories',
          style: TextStyle(
            fontFamily: 'vb',
            fontSize: 36.sp,
            color: Colors.white,
          ),
        ),
        actions: [
          Bounce(
            onPressed: () =>
                ExtendedNavigator.of(context).push(Routes.addCategoryView),
            duration: const Duration(milliseconds: 100),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                FontAwesomeIcons.plus,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) => Stack(
          fit: StackFit.expand,
          children: [
            Container(
              height: ScreenUtil().screenHeight,
              width: ScreenUtil().screenWidth,
              padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(
                              fontFamily: 'vb',
                              fontSize: 42.sp,
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Search Categories',
                              hintStyle: TextStyle(
                                fontFamily: 'vr',
                                fontSize: 36.sp,
                                color: Colors.white.withOpacity(0.5),
                              ),
                              prefixIcon: const Icon(
                                FontAwesomeIcons.search,
                                color: Colors.white,
                              ),
                              filled: true,
                              fillColor: Theme.of(context).primaryColorLight,
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onChanged: (value) => context.read<MainCubit>()
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
                              (index) => ListTile(
                                onTap: () {
                                  context.read<MainCubit>()
                                    ..onProductCategoryChanged(state
                                        .filteredCategoryList[index]
                                        .categoryName);
                                  widget.onSelectedCategoryChanged(
                                      '${state.filteredCategoryList[index].categoryName}');
                                  if (ExtendedNavigator.of(context).canPop()) {
                                    ExtendedNavigator.of(context).pop();
                                  }
                                },
                                title: Text(
                                  '${state.filteredCategoryList[index].categoryName}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'vb',
                                    fontSize: 36.sp,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
