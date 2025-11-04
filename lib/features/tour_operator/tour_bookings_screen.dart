import 'package:flutter/material.dart';
import 'package:tripavail/widgets/primary_appbar.dart';
import 'package:tripavail/utils/app_text_styles.dart';

class TourBookingsScreen extends StatelessWidget {
  const TourBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double width = size.width;
    return Scaffold(
      appBar: const PrimaryAppBar(
        title: 'Bookings (Trips)',
        showBackArrowIcon: true,
      ),
      body: SafeArea(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08),
        child: ListView.separated(
          itemCount: 8,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) => ListTile(
            title: Text(
              'Booking #${1200 + index}',
              style: AppTextStyle.bodyLarge,
            ),
            subtitle: const Text('Traveler: Jane Doe • 2 guests'),
            trailing: const Icon(Icons.chevron_right),
          ),
        ),
        ),
      ),
    );
  }
}
