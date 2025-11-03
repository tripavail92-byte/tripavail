import 'package:flutter/material.dart';
import 'package:tripavail/features/partner/models/partner_role.dart';
import 'package:tripavail/utils/theme/constants/app_constants.dart';

LinearGradient partnerGradient(PartnerRole role) {
  switch (role) {
    case PartnerRole.hotelManager:
      return AppRoleGradients.hotelManager;
    case PartnerRole.tourOperator:
      return AppRoleGradients.tourOperator;
  }
}

Color partnerAccent(PartnerRole role) => partnerGradient(role).colors.first;

Color partnerAccentSecondary(PartnerRole role) =>
    partnerGradient(role).colors.last;
