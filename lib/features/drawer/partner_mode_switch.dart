import 'package:flutter/material.dart';

import 'drawer_theme.dart';

class PartnerModeSwitchWidget extends StatelessWidget {
  final bool isPartnerMode;
  final VoidCallback onBecomePartner;
  final VoidCallback onSwitchToTraveler;

  const PartnerModeSwitchWidget({
    super.key,
    required this.isPartnerMode,
    required this.onBecomePartner,
    required this.onSwitchToTraveler,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonStyle = FilledButton.styleFrom(
      minimumSize: const Size.fromHeight(48),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );

    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: theme.dividerColor)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: isPartnerMode
          ? FilledButton.tonal(
              onPressed: onSwitchToTraveler,
              style: buttonStyle.copyWith(
                foregroundColor: WidgetStatePropertyAll(theme.primaryColor),
              ),
              child: const Text('Switch to Traveler Mode'),
            )
          : FilledButton(
              onPressed: onBecomePartner,
              style: buttonStyle.copyWith(
                backgroundColor: const WidgetStatePropertyAll(
                  DrawerThemeConfig.accentColor,
                ),
              ),
              child: const Text('Become a Partner'),
            ),
    );
  }
}
