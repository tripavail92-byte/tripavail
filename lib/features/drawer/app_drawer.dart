import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/features/partner/partner_entry_screen.dart';
import 'package:tripavail/features/profile/profile_screen.dart';

// Drawer Data Models
class DrawerMeta {
  final String userName;
  final String userEmail;
  final String userRole;
  final String userLocation;
  final bool isVerified;
  final int profileCompletion;

  const DrawerMeta({
    required this.userName,
    required this.userEmail,
    required this.userRole,
    required this.userLocation,
    required this.isVerified,
    required this.profileCompletion,
  });
}

class DrawerItem {
  final String id;
  final String label;
  final IconData icon;
  final String screen;
  final String? badge;

  const DrawerItem({
    required this.id,
    required this.label,
    required this.icon,
    required this.screen,
    this.badge,
  });
}

// Drawer Data
class DrawerData {
  static DrawerMeta travelerMeta = const DrawerMeta(
    userName: 'Traveler',
    userEmail: 'traveler@tripavail.com',
    userRole: 'traveler',
    userLocation: 'Global Citizen',
    isVerified: false,
    profileCompletion: 40,
  );

  static DrawerMeta hotelManagerMeta = const DrawerMeta(
    userName: 'Maria Rodriguez',
    userEmail: 'tours@adventures.com',
    userRole: 'hotel_manager',
    userLocation: 'Pakistan',
    isVerified: true,
    profileCompletion: 30,
  );

  static DrawerMeta tourOperatorMeta = const DrawerMeta(
    userName: 'Maria Rodriguez',
    userEmail: 'tours@adventures.com',
    userRole: 'tour_operator',
    userLocation: 'Pakistan',
    isVerified: true,
    profileCompletion: 30,
  );

  static List<DrawerItem> travelerItems = const [
    DrawerItem(
      id: 'profile',
      label: 'Profile',
      icon: Icons.person_outline,
      screen: 'profile',
    ),
    DrawerItem(
      id: 'bookings',
      label: 'My Bookings',
      icon: Icons.bookmark_outline,
      screen: 'bookings',
    ),
    DrawerItem(
      id: 'favorites',
      label: 'Favorites',
      icon: Icons.favorite_border,
      screen: 'favorites',
    ),
    DrawerItem(
      id: 'wallet',
      label: 'Wallet',
      icon: Icons.wallet_outlined,
      screen: 'wallet',
    ),
    DrawerItem(
      id: 'settings',
      label: 'Settings',
      icon: Icons.settings_outlined,
      screen: 'settings',
    ),
    DrawerItem(
      id: 'support',
      label: 'Help & Support',
      icon: Icons.help_outline,
      screen: 'support',
    ),
    DrawerItem(
      id: 'about',
      label: 'About',
      icon: Icons.info_outline,
      screen: 'about',
    ),
  ];

  static List<DrawerItem> hotelManagerItems = const [
    DrawerItem(
      id: 'dashboard',
      label: 'Dashboard',
      icon: Icons.dashboard_customize_outlined,
      screen: 'hotel_dashboard',
      badge: '3 live • 1 draft',
    ),
    DrawerItem(
      id: 'list_hotel',
      label: 'List Your Hotel',
      icon: Icons.apartment_outlined,
      screen: '/partner/hotel/list',
    ),
    DrawerItem(
      id: 'packages',
      label: 'List Packages',
      icon: Icons.inventory_2_outlined,
      screen: '/partner/hotel/packages',
    ),
    DrawerItem(
      id: 'verification',
      label: 'Verification',
      icon: Icons.verified_user_outlined,
      screen: '/partner/hotel/verification',
      badge: '75% complete',
    ),
    DrawerItem(
      id: 'hm_settings',
      label: 'Account Settings',
      icon: Icons.settings_outlined,
      screen: 'settings',
    ),
    DrawerItem(
      id: 'hm_support',
      label: 'Help & Support',
      icon: Icons.support_agent,
      screen: 'support',
    ),
    DrawerItem(
      id: 'hm_legal',
      label: 'Legal & Policies',
      icon: Icons.gavel_outlined,
      screen: 'legal',
    ),
  ];

  static List<DrawerItem> tourOperatorItems = const [
    DrawerItem(
      id: 'create_tour',
      label: 'Create New Tour',
      icon: Icons.add_location_alt_outlined,
      screen: '/partner/tour/create',
    ),
    DrawerItem(
      id: 'setup',
      label: 'Tour Operator Setup',
      icon: Icons.settings_suggest_outlined,
      screen: '/partner/tour/verification',
      badge: 'Complete your profile',
    ),
    DrawerItem(
      id: 'tour_dashboard',
      label: 'Dashboard',
      icon: Icons.dashboard_outlined,
      screen: 'tour_dashboard',
      badge: '5 live • 2 draft',
    ),
    DrawerItem(
      id: 'post_packages',
      label: 'Post Trip Packages',
      icon: Icons.card_travel,
      screen: '/partner/tour/packages',
    ),
    DrawerItem(
      id: 'calendar',
      label: 'Calendar & Availability',
      icon: Icons.event_available_outlined,
      screen: '/partner/tour/calendar',
    ),
    DrawerItem(
      id: 'bookings',
      label: 'Bookings (Trips)',
      icon: Icons.receipt_long_outlined,
      screen: '/partner/tour/bookings',
      badge: '3 pending',
    ),
    DrawerItem(
      id: 'tour_verification',
      label: 'Verification',
      icon: Icons.verified_user_outlined,
      screen: '/partner/tour/verification',
      badge: '85% complete',
    ),
    DrawerItem(
      id: 'to_settings',
      label: 'Account Settings',
      icon: Icons.settings_outlined,
      screen: 'settings',
    ),
    DrawerItem(
      id: 'to_support',
      label: 'Help & Support',
      icon: Icons.support_agent,
      screen: 'support',
    ),
    DrawerItem(
      id: 'to_legal',
      label: 'Legal & Policies',
      icon: Icons.gavel_outlined,
      screen: 'legal',
    ),
  ];
}

// Main Drawer Widget
class AppDrawer extends StatefulWidget {
  final bool isOpen;
  final VoidCallback onClose;
  final DrawerMeta? meta;
  final List<DrawerItem>? items;
  final void Function(String itemId, String screen)? onItemTap;
  final VoidCallback? onBecomePartner;
  final VoidCallback? onSwitchToTraveler;
  final bool showPartnerButton;

  const AppDrawer({
    super.key,
    required this.isOpen,
    required this.onClose,
    this.meta,
    this.items,
    this.onItemTap,
    this.onBecomePartner,
    this.onSwitchToTraveler,
    this.showPartnerButton = true,
  });

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  static const double _drawerWidth = 320;
  late String _selectedItemId;

  @override
  void initState() {
    super.initState();
    _selectedItemId =
        widget.items?.first.id ?? DrawerData.travelerItems.first.id;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );
    if (widget.isOpen) {
      _controller.value = 1;
    }
  }

  @override
  void didUpdateWidget(covariant AppDrawer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOpen && !oldWidget.isOpen) {
      _controller.forward();
    } else if (!widget.isOpen && oldWidget.isOpen) {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onItemTap(String itemId, String screen) {
    setState(() {
      _selectedItemId = itemId;
    });
    widget.onClose();

    if (widget.onItemTap != null) {
      widget.onItemTap!(itemId, screen);
      return;
    }

    // Default traveler navigation
    switch (itemId) {
      case 'profile':
        Get.to(() => const ProfileScreen());
        break;
      case 'bookings':
      case 'favorites':
      case 'wallet':
      case 'settings':
      case 'support':
      case 'about':
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Navigate to $screen (coming soon)')),
        );
        break;
    }
  }

  void _onBecomePartner() {
    widget.onClose();
    if (widget.onBecomePartner != null) {
      widget.onBecomePartner!();
    } else {
      Get.to(() => const PartnerEntryScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !_controller.isAnimating && !widget.isOpen,
      child: Stack(
        children: [
          // Backdrop
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              if (_controller.value == 0) return const SizedBox.shrink();
              return Opacity(
                opacity: _controller.value * 0.5,
                child: GestureDetector(
                  onTap: widget.onClose,
                  child: Container(color: Colors.black),
                ),
              );
            },
          ),
          // Drawer Content
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final translateX =
                  -_drawerWidth + (_drawerWidth * _controller.value);
              return Transform.translate(
                offset: Offset(translateX, 0),
                child: SizedBox(width: _drawerWidth, child: child),
              );
            },
            child: _DrawerContent(
              meta: widget.meta ?? DrawerData.travelerMeta,
              items: widget.items ?? DrawerData.travelerItems,
              selectedItemId: _selectedItemId,
              onItemTap: _onItemTap,
              onClose: widget.onClose,
              onBecomePartner:
                  widget.onBecomePartner != null || widget.showPartnerButton
                  ? _onBecomePartner
                  : null,
              onSwitchToTraveler: widget.onSwitchToTraveler,
              isPartnerMode:
                  (widget.meta?.userRole ?? DrawerData.travelerMeta.userRole) !=
                  'traveler',
            ),
          ),
        ],
      ),
    );
  }
}

// Drawer Content Widget
class _DrawerContent extends StatelessWidget {
  final DrawerMeta meta;
  final List<DrawerItem> items;
  final String selectedItemId;
  final void Function(String itemId, String screen) onItemTap;
  final VoidCallback onClose;
  final VoidCallback? onBecomePartner;
  final VoidCallback? onSwitchToTraveler;
  final bool isPartnerMode;

  const _DrawerContent({
    required this.meta,
    required this.items,
    required this.selectedItemId,
    required this.onItemTap,
    required this.onClose,
    this.onBecomePartner,
    this.onSwitchToTraveler,
    required this.isPartnerMode,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const accentColor = Color(0xFFFF5A5F);
    final initials = meta.userName.isNotEmpty ? meta.userName[0] : '?';

    return Material(
      color: theme.colorScheme.surface,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Close Button
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: onClose,
              ),
            ),
            // Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: accentColor.withValues(alpha: 0.12),
                    child: Text(
                      initials.toUpperCase(),
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: accentColor,
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
                      color: theme.textTheme.bodyMedium?.color?.withValues(
                        alpha: 0.6,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        meta.isVerified ? Icons.verified : Icons.location_on,
                        size: 16,
                        color: theme.textTheme.bodySmall?.color?.withValues(
                          alpha: 0.6,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        meta.isVerified
                            ? 'Verified partner'
                            : meta.userLocation,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.textTheme.bodySmall?.color?.withValues(
                            alpha: 0.6,
                          ),
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
                      color: accentColor,
                      backgroundColor: theme.dividerColor.withValues(
                        alpha: 0.4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${meta.profileCompletion}% complete',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.textTheme.bodySmall?.color?.withValues(
                        alpha: 0.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Menu Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: items.map((item) {
                  final selected = item.id == selectedItemId;
                  return InkWell(
                    onTap: () => onItemTap(item.id, item.screen),
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: selected
                            ? accentColor.withValues(alpha: 0.1)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            item.icon,
                            size: 20,
                            color: selected
                                ? accentColor
                                : theme.iconTheme.color,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              item.label,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          if (item.badge != null)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: theme.dividerColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                item.badge!,
                                style: theme.textTheme.bodySmall,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            // Partner/Traveler Button
            if (onBecomePartner != null || onSwitchToTraveler != null)
              Container(
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: theme.dividerColor)),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: isPartnerMode && onSwitchToTraveler != null
                    ? FilledButton.tonal(
                        onPressed: onSwitchToTraveler,
                        style: FilledButton.styleFrom(
                          minimumSize: const Size.fromHeight(48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          foregroundColor: theme.primaryColor,
                        ),
                        child: const Text('Switch to Traveler Mode'),
                      )
                    : onBecomePartner != null
                    ? FilledButton(
                        onPressed: onBecomePartner,
                        style: FilledButton.styleFrom(
                          minimumSize: const Size.fromHeight(48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: accentColor,
                        ),
                        child: const Text('Become a Partner'),
                      )
                    : const SizedBox.shrink(),
              ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
