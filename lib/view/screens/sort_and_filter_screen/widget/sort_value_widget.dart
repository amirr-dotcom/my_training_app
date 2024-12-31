import 'package:flutter/material.dart';
import 'package:my_training_app/app_manager/constant/color_constant.dart';

class SortValueWidget extends StatelessWidget {
  final String value;
  final bool selected;
  final VoidCallback onTap;
  const SortValueWidget({super.key, required this.value, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Checkbox(
              side: BorderSide(
                color: ColorConstant.greyLight, // Change border color here
                width: 2, // Border width
              ),
              value: selected,
              onChanged: (val) {
                onTap();
              }),
          Expanded(
            child: Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.titleSmall?.copyWith(color:
              Colors.black.withOpacity(selected? 0.8: 0.6)),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
