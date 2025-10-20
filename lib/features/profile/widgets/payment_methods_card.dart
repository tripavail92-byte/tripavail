import 'package:flutter/material.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/theme/constants/app_spacing.dart';
import 'package:tripavail/features/profile/widgets/section_card.dart';

class PaymentMethodsCard extends StatelessWidget {
  final VoidCallback onWalletsTap;
  final VoidCallback onCardsTap;

  const PaymentMethodsCard({
    super.key,
    required this.onWalletsTap,
    required this.onCardsTap,
  });

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              16,
              16,
              16,
              8,
            ),
            child: Text(
              'Payment Methods',
              style: AppTextStyle.headlineSmall,
            ),
          ),
          const Divider(height: 1),
          _NavRow(
            icon: Icons.account_balance_wallet_outlined,
            title: 'Mobile Wallets',
            subtitle: 'EasyPaisa, JazzCash & more',
            onTap: onWalletsTap,
          ),
          const Divider(height: 1),
          _NavRow(
            icon: Icons.credit_card,
            title: 'Cards',
            subtitle: 'Debit & Credit Cards',
            onTap: onCardsTap,
          ),
        ],
      ),
    );
  }
}

class _NavRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const _NavRow({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: theme.brightness == Brightness.dark
                    ? const Color(0xFF1F2937)
                    : const Color(0xFFF3F4F6),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 20,
                color: theme.iconTheme.color,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppSpacing.v8(),
                  Text(
                    subtitle,
                    style: AppTextStyle.bodySmall.copyWith(
                      color: theme
                          .textTheme
                          .bodySmall
                          ?.color
                          ?.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: theme.iconTheme.color?.withOpacity(
                0.5,
              ),
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
