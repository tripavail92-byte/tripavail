import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tripavail/features/profile/widgets/section_card.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/theme/constants/app_constants.dart';
import 'package:tripavail/utils/theme/extension/role_theme_extension.dart';

class ProfileHeaderCard extends StatelessWidget {
  final String name;
  final String bio;
  final String joinDate;
  final bool emailVerified;
  final String? avatarUrl;
  final int completion;
  final VoidCallback onChangePhoto;

  const ProfileHeaderCard({
    super.key,
    required this.name,
    required this.bio,
    required this.joinDate,
    required this.emailVerified,
    required this.avatarUrl,
    required this.completion,
    required this.onChangePhoto,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final roleTheme = theme.extension<RoleThemeExtension>();
    final isDark = theme.brightness == Brightness.dark;
    const avatarRadius = 50.0;
    return SectionCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: avatarRadius * 2 + 8,
                height: avatarRadius * 2 + 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient:
                      roleTheme?.primaryGradient ?? AppRoleGradients.traveller,
                ),
                child: Container(
                  margin: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDark
                        ? const Color(0xFF3C3C3C)
                        : const Color(0xFFE9E9E9),
                  ),
                  child: CircleAvatar(
                    radius: avatarRadius,
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        (avatarUrl != null && avatarUrl!.isNotEmpty)
                        ? CachedNetworkImageProvider(avatarUrl!)
                        : null,
                    child: (avatarUrl == null || avatarUrl!.isEmpty)
                        ? Text(
                            name.isNotEmpty ? name[0].toUpperCase() : '',
                            style: AppTextStyle.headlineMedium.copyWith(
                              color: theme.primaryColor,
                            ),
                          )
                        : null,
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Semantics(
                    button: true,
                    label: 'Change profile photo',
                    child: GestureDetector(
                      onTap: onChangePhoto,
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient:
                              roleTheme?.primaryGradient ??
                              AppRoleGradients.traveller,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name, style: AppTextStyle.headlineSmall),
              if (emailVerified) ...[
                const SizedBox(width: 6),
                const Icon(
                  Icons.verified,
                  color: AppColors.positiveColor,
                  size: 18,
                ),
              ],
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Text(
            'Member since $joinDate',
            style: AppTextStyle.bodySmall.copyWith(
              color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.6),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text(
            bio,
            textAlign: TextAlign.center,
            style: AppTextStyle.bodyMedium.copyWith(
              color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.85),
              height: 1.5,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Profile completion',
                style: AppTextStyle.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '$completion%',
                style: AppTextStyle.bodySmall.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 8,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF374151) : const Color(0xFFE5E7EB),
              borderRadius: BorderRadius.circular(999),
            ),
            child: LayoutBuilder(
              builder: (context, c) {
                final w = c.maxWidth * (completion / 100);
                return Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      gradient:
                          roleTheme?.primaryGradient ??
                          AppRoleGradients.traveller,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
