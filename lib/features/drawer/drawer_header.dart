import 'package:flutter/material.dart';

import 'drawer_item.dart';
import 'drawer_theme.dart';

class DrawerHeaderWidget extends StatelessWidget {
  final DrawerMeta meta;

  const DrawerHeaderWidget({super.key, required this.meta});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final initials = meta.userName.isNotEmpty ? meta.userName[0] : '?';

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: DrawerThemeConfig.accentColor.withValues(alpha:0.12),
            child: Text(
              initials.toUpperCase(),
              style: theme.textTheme.headlineMedium?.copyWith(
                color: DrawerThemeConfig.accentColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            meta.userName,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            meta.userEmail,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.textTheme.bodyMedium?.color?.withValues(alpha:0.6),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                meta.isVerified ? Icons.verified : Icons.location_on,
                size: 16,
                color: theme.textTheme.bodySmall?.color?.withValues(alpha:0.6),
              ),
              const SizedBox(width: 4),
              Text(
                meta.isVerified ? 'Verified partner' : meta.userLocation,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.textTheme.bodySmall?.color?.withValues(alpha:0.6),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: meta.profileCompletion.clamp(0, 100) / 100,
              minHeight: 6,
              color: DrawerThemeConfig.accentColor,
              backgroundColor: theme.dividerColor.withValues(alpha:0.4),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '${meta.profileCompletion}% complete',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.textTheme.bodySmall?.color?.withValues(alpha:0.6),
            ),
          ),
        ],
      ),
    );
  }
}
