import 'package:flutter/material.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/theme/constants/app_constants.dart';
import 'package:tripavail/utils/theme/constants/app_radii.dart';
import 'package:tripavail/utils/theme/extension/role_theme_extension.dart';

class PrimaryButton extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final String title;
  final VoidCallback onPressed;
  final bool enabled;
  final Color? backgroundColor;
  final Gradient? backgroundGradient;
  final Color? titleColor;
  final double? height;
  final double? width;
  final Color? borderColor;
  final double borderWidth;
  final Widget? icon;

  const PrimaryButton({
    super.key,
    this.margin,
    this.padding,
    required this.title,
    required this.onPressed,
    this.enabled = true,
    this.backgroundColor,
    this.backgroundGradient,
    this.titleColor,
    this.height,
    this.width,
    this.borderColor,
    this.borderWidth = 1.0,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final roleTheme = Theme.of(
      context,
    ).extension<RoleThemeExtension>();
    final Gradient? resolvedGradient = enabled
        ? (backgroundColor != null
              ? null
              : (backgroundGradient ??
                    roleTheme?.primaryGradient ??
                    AppRoleGradients.traveller))
        : null;

    final Color resolvedColor = enabled
        ? (backgroundColor ?? appTheme.primaryColor)
        : appTheme.colorScheme.primaryContainer;

    return Container(
      margin: margin,
      child: ClipRRect(
        borderRadius: AppRadii.m,
        child: Material(
          color: Colors.transparent,
          child: Ink(
            decoration: BoxDecoration(
              color: resolvedGradient == null
                  ? resolvedColor
                  : null,
              gradient: resolvedGradient,
              borderRadius: AppRadii.m,
              border: borderColor != null
                  ? Border.all(
                      color: borderColor!,
                      width: borderWidth,
                    )
                  : null,
            ),
            child: InkWell(
              onTap: enabled ? onPressed : null,
              borderRadius: AppRadii.m,
              child: Container(
                width: width ?? 220,
                height: height ?? 48,
                alignment: Alignment.center,
                padding: padding,
                child: icon != null
                    ? Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          icon!,
                          const SizedBox(width: 12),
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.bodyMedium
                                .copyWith(
                                  color:
                                      titleColor ??
                                      AppColors.white,
                                  fontWeight:
                                      FontWeight.w600,
                                ),
                          ),
                        ],
                      )
                    : Text(
                        title,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.bodyMedium
                            .copyWith(
                              color:
                                  titleColor ??
                                  AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
