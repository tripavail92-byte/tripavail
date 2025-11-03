import 'package:flutter/material.dart';
import 'package:tripavail/widgets/primary_appbar.dart';

class TourCalendarScreen extends StatelessWidget {
  const TourCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    return Scaffold(
      appBar: const PrimaryAppBar(
        title: 'Calendar & Availability',
        showBackArrowIcon: true,
      ),
      body: SafeArea(
        child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (width * 0.08).clamp(16.0, 28.0),
        ),
        child: const Center(child: Text('Calendar coming soon')),
        ),
      ),
    );
  }
}
