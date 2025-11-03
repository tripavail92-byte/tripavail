import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/features/profile/widgets/section_card.dart';

class ContactInfoCard extends StatelessWidget {
  final String email;
  final bool emailVerified;
  final String phone;
  final bool phoneVerified;
  final String address;
  final String city;
  final bool locationVerified;
  final DateTime? dateOfBirth;
  final VoidCallback onPickDob;
  final VoidCallback? onVerifyPhone;

  const ContactInfoCard({
    super.key,
    required this.email,
    required this.emailVerified,
    required this.phone,
    required this.phoneVerified,
    required this.address,
    required this.city,
    required this.locationVerified,
    required this.dateOfBirth,
    required this.onPickDob,
    this.onVerifyPhone,
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
              'Contact Info',
              style: AppTextStyle.headlineSmall,
            ),
          ),
          const Divider(height: 1),
          _ContactRow(
            icon: Icons.email_outlined,
            label: 'Email',
            value: email,
            verified: emailVerified,
          ),
          const Divider(height: 1),
          _ContactRow(
            icon: Icons.phone_outlined,
            label: 'Phone',
            value: phone,
            verified: phoneVerified,
            onTap: onVerifyPhone,
          ),
          const Divider(height: 1),
          _ContactRow(
            icon: Icons.home_outlined,
            label: 'Address',
            value: address,
            verified: false,
          ),
          const Divider(height: 1),
          _ContactRow(
            icon: Icons.location_city,
            label: 'City',
            value: city,
            verified: locationVerified,
          ),
          const Divider(height: 1),
          _ContactRow(
            icon: Icons.calendar_today,
            label: 'Date of Birth',
            value: dateOfBirth != null
                ? DateFormat(
                    'MMMM dd, yyyy',
                  ).format(dateOfBirth!)
                : 'Add your birthday',
            verified: true,
            iconBg: const Color(0xFFFFF1F2),
            iconColor: const Color(0xFFE11D48),
            onTap: onPickDob,
          ),
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool verified;
  final Color iconBg;
  final Color iconColor;
  final VoidCallback? onTap;

  const _ContactRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.verified,
    this.iconBg = const Color(0xFFF3F4F6),
    this.iconColor = const Color(0xFF374151),
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
                color: iconBg,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 20, color: iconColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: AppTextStyle.bodySmall.copyWith(
                      color: theme
                          .textTheme
                          .bodySmall
                          ?.color
                          ?.withValues(alpha:0.6),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    value,
                    style: AppTextStyle.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            if (verified)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.check,
                      size: 12,
                      color: Color(0xFF3B82F6),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Verified',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF1E40AF),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            else
              (onTap != null)
                  ? TextButton(
                      onPressed: onTap,
                      child: const Text('Verify'),
                    )
                  : Text(
                      'Not verified',
                      style: AppTextStyle.bodySmall
                          .copyWith(
                            color: theme
                                .textTheme
                                .bodySmall
                                ?.color
                                ?.withValues(alpha:0.5),
                          ),
                    ),
            const SizedBox(width: 12),
            Icon(
              Icons.chevron_right,
              color: theme.iconTheme.color?.withValues(alpha:
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
