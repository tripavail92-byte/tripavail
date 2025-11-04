import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/features/drawer/drawer_definitions.dart';
import 'package:tripavail/features/drawer/drawer_manager.dart';
import 'package:tripavail/features/partner/partner_entry_screen.dart';
import 'package:tripavail/features/profile/profile_screen.dart';

import 'screens/home_tab.dart';
import 'screens/hotels_tab.dart';
import 'screens/messages_tab.dart';
import 'screens/tours_tab.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  bool _drawerOpen = false;
  String _selectedDrawerItem = DrawerDefinitions.travelerItems.first.id;

  final List<Widget> _screens = [
    const HomeTab(),
    const HotelsTab(),
    const ToursTab(),
    const MessagesTab(),
  ];

  void _toggleDrawer(bool open) {
    setState(() {
      _drawerOpen = open;
    });
  }

  void _onDrawerItemTap(String itemId, String screen) {
    setState(() {
      _selectedDrawerItem = itemId;
      _drawerOpen = false;
    });

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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: theme.scaffoldBackgroundColor,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.menu, color: theme.iconTheme.color),
              onPressed: () => _toggleDrawer(true),
            ),
            title: _getTitle(),
            centerTitle: false,
          ),
          body: SafeArea(child: _screens[_currentIndex]),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: isDark
                      ? const Color(0xFF333333)
                      : const Color(0xFFE0E0E0),
                  width: 1,
                ),
              ),
            ),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: theme.scaffoldBackgroundColor,
              selectedItemColor: theme.primaryColor,
              unselectedItemColor: isDark
                  ? const Color(0xFF9E9E9E)
                  : const Color(0xFF757575),
              selectedFontSize: 12,
              unselectedFontSize: 12,
              showUnselectedLabels: true,
              elevation: 0,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.hotel_outlined),
                  activeIcon: Icon(Icons.hotel),
                  label: 'Hotels',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.tour_outlined),
                  activeIcon: Icon(Icons.tour),
                  label: 'Tours',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message_outlined),
                  activeIcon: Icon(Icons.message),
                  label: 'Messages',
                ),
              ],
            ),
          ),
        ),
        DrawerManager(
          isOpen: _drawerOpen,
          onClose: () => _toggleDrawer(false),
          role: 'traveler',
          selectedItemId: _selectedDrawerItem,
          items: DrawerDefinitions.travelerItems,
          meta: DrawerDefinitions.travelerMeta,
          onItemClick: _onDrawerItemTap,
          onBecomePartner: () {
            _toggleDrawer(false);
            Get.to(() => const PartnerEntryScreen());
          },
          onSwitchToTraveler: () => _toggleDrawer(false),
        ),
      ],
    );
  }

  Widget _getTitle() {
    final theme = Theme.of(context);
    String title;

    switch (_currentIndex) {
      case 0:
        title = 'Trip Avail';
        break;
      case 1:
        title = 'Hotels';
        break;
      case 2:
        title = 'Tours';
        break;
      case 3:
        title = 'Messages';
        break;
      default:
        title = 'Trip Avail';
    }

    return Text(
      title,
      style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
    );
  }
}
