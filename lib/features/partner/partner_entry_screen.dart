import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/features/partner/models/partner_role.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/theme/constants/app_constants.dart';
import 'package:tripavail/utils/theme/constants/app_spacing.dart';
import 'package:tripavail/widgets/app_scaffold.dart';
import 'package:tripavail/widgets/primary_button.dart';

import 'package:tripavail/modules/partner/partner_routes.dart';

class PartnerEntryScreen extends StatelessWidget {
  const PartnerEntryScreen({super.key});

  void _openWorkspace(PartnerRole role) {
    final route = role == PartnerRole.hotelManager
        ? PartnerRoutes.hotelWorkspace
        : PartnerRoutes.tourWorkspace;
    Get.toNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppScaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      child: SingleChildScrollView(
        padding:
            AppSpacing.horizontalPadding(context) +
            const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Partner Conversion',
              style: AppTextStyle.headlineSmall.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            AppSpacing.v8(),
            Text(
              'Choose the workspace tailored to how you collaborate with TripAvail.',
              style: AppTextStyle.bodyMedium.copyWith(
                color: theme.textTheme.bodyMedium?.color?.withValues(alpha:0.75),
              ),
            ),
            AppSpacing.v24(),
            _PartnerRoleCard(
              title: 'Hotel Manager',
              subtitle:
                  'Manage rates, availability, and guest experiences with precision.',
              gradient: AppRoleGradients.hotelManager,
              icon: Icons.apartment_rounded,
              onTap: () => _openWorkspace(PartnerRole.hotelManager),
              actionLabel: 'Enter Hotel Manager Suite',
            ),
            AppSpacing.v24(),
            _PartnerRoleCard(
              title: 'Tour Operator',
              subtitle:
                  'Design unforgettable journeys, automate itineraries, and stay in sync with travelers.',
              gradient: AppRoleGradients.tourOperator,
              icon: Icons.route_outlined,
              onTap: () => _openWorkspace(PartnerRole.tourOperator),
              actionLabel: 'Enter Tour Operator Suite',
            ),
            AppSpacing.v40(),
          ],
        ),
      ),
    );
  }
}

class _PartnerRoleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final LinearGradient gradient;
  final IconData icon;
  final VoidCallback onTap;
  final String actionLabel;

  const _PartnerRoleCard({
    required this.title,
    required this.subtitle,
    required this.gradient,
    required this.icon,
    required this.onTap,
    required this.actionLabel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(28),
      child: Ink(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: gradient.colors.last.withValues(alpha:0.25),
              blurRadius: 24,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha:0.18),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(icon, color: Colors.white, size: 28),
              ),
              const SizedBox(height: 24),
              Text(
                title,
                style: AppTextStyle.headlineMedium.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                subtitle,
                style: AppTextStyle.bodyLarge.copyWith(
                  color: Colors.white.withValues(alpha:0.85),
                ),
              ),
              const SizedBox(height: 28),
              PrimaryButton(
                onPressed: onTap,
                title: actionLabel,
                height: 52,
                width: double.infinity,
                backgroundColor: Colors.white,
                titleColor: gradient.colors.first,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
