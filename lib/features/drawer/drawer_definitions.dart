import 'package:flutter/material.dart';

import 'drawer_item.dart';

class DrawerDefinitions {
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
      type: DrawerItemType.navigation,
    ),
    DrawerItem(
      id: 'bookings',
      label: 'My Bookings',
      icon: Icons.bookmark_outline,
      screen: 'bookings',
      type: DrawerItemType.navigation,
    ),
    DrawerItem(
      id: 'favorites',
      label: 'Favorites',
      icon: Icons.favorite_border,
      screen: 'favorites',
      type: DrawerItemType.navigation,
    ),
    DrawerItem(
      id: 'wallet',
      label: 'Wallet',
      icon: Icons.wallet_outlined,
      screen: 'wallet',
      type: DrawerItemType.navigation,
    ),
    DrawerItem(
      id: 'settings',
      label: 'Settings',
      icon: Icons.settings_outlined,
      screen: 'settings',
      type: DrawerItemType.support,
    ),
    DrawerItem(
      id: 'support',
      label: 'Help & Support',
      icon: Icons.help_outline,
      screen: 'support',
      type: DrawerItemType.support,
    ),
    DrawerItem(
      id: 'about',
      label: 'About',
      icon: Icons.info_outline,
      screen: 'about',
      type: DrawerItemType.support,
    ),
  ];

  static List<DrawerItem> hotelManagerItems = const [
    DrawerItem(
      id: 'dashboard',
      label: 'Dashboard',
      icon: Icons.dashboard_customize_outlined,
      screen: 'hotel_dashboard',
      badge: '3 live • 1 draft',
      type: DrawerItemType.navigation,
    ),
    DrawerItem(
      id: 'list_hotel',
      label: 'List Your Hotel',
      icon: Icons.apartment_outlined,
      screen: '/partner/hotel/list',
      type: DrawerItemType.navigation,
    ),
    DrawerItem(
      id: 'packages',
      label: 'List Packages',
      icon: Icons.inventory_2_outlined,
      screen: '/partner/hotel/packages',
      type: DrawerItemType.navigation,
    ),
    DrawerItem(
      id: 'verification',
      label: 'Verification',
      icon: Icons.verified_user_outlined,
      screen: '/partner/hotel/verification',
      badge: '75% complete',
      type: DrawerItemType.navigation,
    ),
    DrawerItem(
      id: 'hm_settings',
      label: 'Account Settings',
      icon: Icons.settings_outlined,
      screen: 'settings',
      type: DrawerItemType.support,
    ),
    DrawerItem(
      id: 'hm_support',
      label: 'Help & Support',
      icon: Icons.support_agent,
      screen: 'support',
      type: DrawerItemType.support,
    ),
    DrawerItem(
      id: 'hm_legal',
      label: 'Legal & Policies',
      icon: Icons.gavel_outlined,
      screen: 'legal',
      type: DrawerItemType.support,
    ),
  ];

  static List<DrawerItem> tourOperatorItems = const [
    DrawerItem(
      id: 'create_tour',
      label: 'Create New Tour',
      icon: Icons.add_location_alt_outlined,
      screen: '/partner/tour/create',
      type: DrawerItemType.navigation,
    ),
    DrawerItem(
      id: 'setup',
      label: 'Tour Operator Setup',
      icon: Icons.settings_suggest_outlined,
      screen: '/partner/tour/verification',
      badge: 'Complete your profile',
      type: DrawerItemType.navigation,
    ),
    DrawerItem(
      id: 'tour_dashboard',
      label: 'Dashboard',
      icon: Icons.dashboard_outlined,
      screen: 'tour_dashboard',
      badge: '5 live • 2 draft',
      type: DrawerItemType.navigation,
    ),
    DrawerItem(
      id: 'post_packages',
      label: 'Post Trip Packages',
      icon: Icons.card_travel,
      screen: '/partner/tour/packages',
      type: DrawerItemType.navigation,
    ),
    DrawerItem(
      id: 'calendar',
      label: 'Calendar & Availability',
      icon: Icons.event_available_outlined,
      screen: '/partner/tour/calendar',
      type: DrawerItemType.navigation,
    ),
    DrawerItem(
      id: 'bookings',
      label: 'Bookings (Trips)',
      icon: Icons.receipt_long_outlined,
      screen: '/partner/tour/bookings',
      badge: '3 pending',
      type: DrawerItemType.navigation,
    ),
    DrawerItem(
      id: 'tour_verification',
      label: 'Verification',
      icon: Icons.verified_user_outlined,
      screen: '/partner/tour/verification',
      badge: '85% complete',
      type: DrawerItemType.navigation,
    ),
    DrawerItem(
      id: 'to_settings',
      label: 'Account Settings',
      icon: Icons.settings_outlined,
      screen: 'settings',
      type: DrawerItemType.support,
    ),
    DrawerItem(
      id: 'to_support',
      label: 'Help & Support',
      icon: Icons.support_agent,
      screen: 'support',
      type: DrawerItemType.support,
    ),
    DrawerItem(
      id: 'to_legal',
      label: 'Legal & Policies',
      icon: Icons.gavel_outlined,
      screen: 'legal',
      type: DrawerItemType.support,
    ),
  ];
}
