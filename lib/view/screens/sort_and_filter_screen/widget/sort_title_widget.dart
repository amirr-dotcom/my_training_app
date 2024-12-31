import 'package:flutter/material.dart';
import 'package:my_training_app/app_manager/constant/color_constant.dart';
import 'package:my_training_app/model/sort_title.dart';

class SortTitleWidget extends StatelessWidget {
  final SortTitle sortTitle;
  final bool selected;
  final VoidCallback onTap;
  const SortTitleWidget({super.key, required this.sortTitle, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    Color backgroundColor = selected ? Colors.transparent : ColorConstant.greyLight.withOpacity(0.3);
    FontWeight titleFontWeight = selected ? FontWeight.bold : FontWeight.w400;
    return GestureDetector(
      onTap: onTap,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              color: theme.primaryColor,
              width: selected? 6: 0,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 20, bottom: 20, right: 30, left: selected? 24:30,),
                decoration: BoxDecoration(color: backgroundColor),
                child: Text(sortTitle.title ?? "", style: textTheme.titleMedium?.copyWith(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.8), fontWeight: titleFontWeight)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
