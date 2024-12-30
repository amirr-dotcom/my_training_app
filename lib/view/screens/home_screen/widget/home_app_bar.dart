import 'package:flutter/material.dart';
import 'package:my_training_app/app_manager/constant/color_constant.dart';
import 'package:my_training_app/app_manager/helper/locale_helper.dart';
import 'package:my_training_app/view/screens/home_screen/widget/filter_widget.dart';
import 'package:my_training_app/view/screens/home_screen/widget/home_carousel.dart';

class HomeAppBar extends StatelessWidget {
  final String title;
  final String subTitle;
  const HomeAppBar({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    Widget backgroundBoxWidget = Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(),
        ),
         Container(
          height: 160,
          decoration: const BoxDecoration(color: ColorConstant.white),
        ),
      ],
    );
    return SliverAppBar(
      backgroundColor: theme.primaryColor,
      expandedHeight: 380,
      floating: false,
      pinned: true,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final top = constraints.biggest.height;
          final isCollapsed = top <= kToolbarHeight + MediaQuery.of(context).padding.top;
          return FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: const EdgeInsets.symmetric(horizontal: 20),
            title: AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              alignment: isCollapsed ? Alignment.center : Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: isCollapsed ? 0 : MediaQuery.of(context).padding.top + 140),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            background: Stack(
              children: [
                backgroundBoxWidget,
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        subTitle,
                        style: textTheme.titleMedium,
                      ),
                    ),
                    Column(
                      children: [
                        const HomeCarousel(),
                        Container(
                          height: 80,
                          alignment: Alignment.center,
                          child: const FilterWidget(),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}