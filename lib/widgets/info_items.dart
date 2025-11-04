import 'package:flutter/material.dart';
import 'package:tripavail/utils/app_text_styles.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({
    super.key,
    this.onPressed,
    this.onLongPressed,
    required this.leading,
    required this.title,
    required this.subTitle,
    this.thirdLineText,
    this.trailingWidget,
    this.isLeadingPading = true,
  });

  final VoidCallback? onPressed;
  final GestureLongPressCallback? onLongPressed;
  final Widget leading;
  final String title;
  final String subTitle;
  final String? thirdLineText;
  final Widget? trailingWidget;
  final bool? isLeadingPading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onPressed,
      onLongPress: onLongPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.07,
            width: size.height * 0.07,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.colorScheme.secondaryContainer,
            ),
            clipBehavior: Clip.hardEdge,
            child: Padding(
              padding: EdgeInsets.all(isLeadingPading == true ? 12.0 : 0),
              child: leading,
            ),
          ),
          SizedBox(width: size.width * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.titleSmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: size.height * 0.01),
                Text(subTitle, style: AppTextStyle.bodySmall),
                if (thirdLineText != null) ...[
                  SizedBox(height: size.height * 0.01),
                  Text(thirdLineText!, style: AppTextStyle.bodySmall),
                ],
              ],
            ),
          ),
          if (trailingWidget != null)
            Padding(
              padding: EdgeInsets.only(left: size.height * 0.02),
              child: trailingWidget!,
            ),
        ],
      ),
    );
  }
}
