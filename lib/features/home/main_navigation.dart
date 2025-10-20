import 'package:flutter/material.dart';

import 'screens/home_tab.dart';
import 'screens/hotels_tab.dart';
import 'screens/tours_tab.dart';
import 'screens/messages_tab.dart';
import 'widgets/app_drawer.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() =>
      _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeTab(),
    const HotelsTab(),
    const ToursTab(),
    const MessagesTab(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: theme.iconTheme.color,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: _getTitle(),
        centerTitle: false,
      ),
      drawer: const AppDrawer(),
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
      style: theme.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
