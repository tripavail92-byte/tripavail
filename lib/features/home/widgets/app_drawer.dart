import 'package:flutter/material.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/theme/constants/app_constants.dart';
import 'package:tripavail/utils/theme/constants/app_spacing.dart';
import 'package:get/get.dart';
import 'package:tripavail/features/profile/profile_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Drawer(
      backgroundColor: theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            // User Profile Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: AppRoleGradients.traveller,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                      border: Border.all(
                        color: AppColors.white,
                        width: 3,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'TA',
                        style: AppTextStyle.headlineSmall
                            .copyWith(
                              color: theme.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  AppSpacing.v16(),
                  Text(
                    'Welcome, Traveler!',
                    style: AppTextStyle.headlineSmall
                        .copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'traveler@tripavail.com',
                    style: AppTextStyle.bodySmall.copyWith(
                      color: AppColors.white.withOpacity(
                        0.9,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Menu Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                children: [
                  _DrawerItem(
                    icon: Icons.person_outline,
                    title: 'Profile',
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(() => const ProfileScreen());
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.bookmark_outline,
                    title: 'My Bookings',
                    onTap: () {
                      Navigator.pop(context);
                      // Navigate to bookings
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.favorite_outline,
                    title: 'Favorites',
                    onTap: () {
                      Navigator.pop(context);
                      // Navigate to favorites
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.wallet_outlined,
                    title: 'Wallet',
                    onTap: () {
                      Navigator.pop(context);
                      // Navigate to wallet
                    },
                  ),
                  Divider(
                    color: isDark
                        ? const Color(0xFF333333)
                        : const Color(0xFFE0E0E0),
                    height: 24,
                  ),
                  _DrawerItem(
                    icon: Icons.settings_outlined,
                    title: 'Settings',
                    onTap: () {
                      Navigator.pop(context);
                      // Navigate to settings
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.help_outline,
                    title: 'Help & Support',
                    onTap: () {
                      Navigator.pop(context);
                      // Navigate to help
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.info_outline,
                    title: 'About',
                    onTap: () {
                      Navigator.pop(context);
                      // Navigate to about
                    },
                  ),
                  Divider(
                    color: isDark
                        ? const Color(0xFF333333)
                        : const Color(0xFFE0E0E0),
                    height: 24,
                  ),
                  _DrawerItem(
                    icon: Icons.logout,
                    title: 'Logout',
                    textColor: AppColors.red,
                    onTap: () {
                      Navigator.pop(context);
                      // Handle logout
                      _showLogoutDialog(context);
                    },
                  ),
                ],
              ),
            ),

            // App Version
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Version 1.0.0',
                style: AppTextStyle.bodySmall.copyWith(
                  color: theme.textTheme.bodySmall?.color
                      ?.withOpacity(0.5),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text(
          'Are you sure you want to logout?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Handle logout logic
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? textColor;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color =
        textColor ?? theme.textTheme.bodyLarge?.color;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: AppTextStyle.bodyMedium.copyWith(
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 4,
      ),
    );
  }
}
