import 'package:flutter/widgets.dart';

enum DrawerItemType { navigation, support }

class DrawerItem {
  final String id;
  final String label;
  final IconData icon;
  final String screen;
  final String? badge;
  final DrawerItemType type;
  final String? tourId;

  const DrawerItem({
    required this.id,
    required this.label,
    required this.icon,
    required this.screen,
    this.badge,
    required this.type,
    this.tourId,
  });
}

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
