import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/features/drawer/app_drawer.dart';
import 'package:tripavail/features/home/bottom_nav_bar.dart';
import 'package:tripavail/features/hotel_manager/presentation/screens/hotel_list_screen.dart';
import 'package:tripavail/features/hotel_manager/presentation/screens/hotel_packages_screen.dart';
import 'package:tripavail/features/hotel_manager/presentation/screens/hotel_verification_screen.dart';
import 'package:tripavail/features/partner/models/partner_dashboard_data.dart';
import 'package:tripavail/features/partner/models/partner_role.dart';
import 'package:tripavail/features/partner/presentation/controllers/partner_dashboard_controller.dart';
import 'package:tripavail/features/partner/utils/partner_branding.dart';
import 'package:tripavail/features/tour_operator/tour_bookings_screen.dart';
import 'package:tripavail/features/tour_operator/tour_calendar_screen.dart';
import 'package:tripavail/features/tour_operator/tour_create_screen.dart';
import 'package:tripavail/features/tour_operator/tour_packages_screen.dart';
import 'package:tripavail/features/tour_operator/tour_verification_screen.dart';
import 'package:tripavail/utils/app_text_styles.dart';

// Constants
class _PartnerWorkspaceConstants {
  static const double contentHorizontalPadding = 0.08; // 8% of screen width
  static const double contentBottomPadding = 32.0;
  static const double sectionSpacing = 0.03; // 3% of screen height
  static const double quickLinksSpacing = 0.02; // 2% of screen height
  static const double metricSpacing = 0.01; // 1% of screen height

  static const String workspaceTitle = 'Partner Workspace';
  static const String quickLinksTitle = 'Quick links';
  static const String loadingError = 'Unable to load data';
  static const String comingSoonMessage = 'coming soon';

  static const double roleBadgeHorizontalPadding = 14.0;
  static const double roleBadgeVerticalPadding = 8.0;
  static const double roleBadgeBorderRadius = 20.0;
  static const double roleIconSize = 18.0;
  static const double roleBadgeSpacing = 6.0;

  static const double heroCardPadding = 28.0;
  static const double heroCardBorderRadius = 28.0;
  static const double heroTitleSpacing = 12.0;
  static const double heroSubtitleSpacing = 24.0;
  static const double heroBadgeSpacing = 12.0;
  static const double heroShadowBlur = 30.0;
  static const double heroShadowOffset = 18.0;
  static const double heroBadgeHorizontalPadding = 14.0;
  static const double heroBadgeVerticalPadding = 8.0;
  static const double heroBadgeBorderRadius = 999.0;

  static const double metricCardWidth = 180.0;
  static const double metricCardPadding = 16.0;
  static const double metricCardBorderRadius = 18.0;
  static const double metricCardShadowBlur = 12.0;
  static const double metricCardShadowOffset = 6.0;
  static const double metricCardSpacing = 16.0;

  static const int gridCrossAxisCount = 2;
  static const double gridSpacing = 16.0;
  static const double gridChildAspectRatio =
      1.1; // Decreased from 1.2 to give more vertical space
  static const double actionCardPadding = 16.0; // Reduced from 20.0
  static const double actionCardBorderRadius = 20.0;
  static const double actionIconContainerPadding = 12.0;
  static const double actionIconContainerBorderRadius = 16.0;
  static const double actionTitleSpacing = 12.0; // Reduced from 16.0
  static const double actionSubtitleSpacing = 6.0; // Reduced from 8.0
}

class PartnerWorkspaceScreen extends StatefulWidget {
  final PartnerRole initialRole;

  const PartnerWorkspaceScreen({super.key, required this.initialRole});

  @override
  State<PartnerWorkspaceScreen> createState() => _PartnerWorkspaceScreenState();
}

class _PartnerWorkspaceScreenState extends State<PartnerWorkspaceScreen> {
  late PartnerRole _activeRole;
  bool _drawerOpen = false;

  @override
  void initState() {
    super.initState();
    _activeRole = widget.initialRole;

    // Initialize controller with role
    if (!Get.isRegistered<PartnerDashboardController>(tag: _activeRole.name)) {
      Get.put(PartnerDashboardController(_activeRole), tag: _activeRole.name);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => _drawerOpen = true);
    });
  }

  void _switchToTraveler() {
    setState(() => _drawerOpen = false);
    Get.offAll(() => const BottomNavBar());
  }

  void _toggleDrawer(bool open) {
    setState(() => _drawerOpen = open);
  }

  List<DrawerItem> get _currentDrawerItems =>
      _activeRole == PartnerRole.hotelManager
      ? DrawerData.hotelManagerItems
      : DrawerData.tourOperatorItems;

  DrawerMeta get _currentMeta => _activeRole == PartnerRole.hotelManager
      ? DrawerData.hotelManagerMeta
      : DrawerData.tourOperatorMeta;

  void _handleDrawerItem(String id, String screen) {
    setState(() {
      _drawerOpen = false;
    });

    if (_activeRole == PartnerRole.hotelManager) {
      _handleHotelManagerNavigation(id);
    } else if (_activeRole == PartnerRole.tourOperator) {
      _handleTourOperatorNavigation(id);
    }
  }

  void _handleHotelManagerNavigation(String id) {
    switch (id) {
      case 'list_hotel':
        Get.to(() => const HotelListScreen());
        break;
      case 'packages':
        Get.to(() => const HotelPackagesScreen());
        break;
      case 'verification':
        Get.to(() => const HotelVerificationScreen());
        break;
      case 'dashboard':
      case 'hm_settings':
      case 'hm_support':
      case 'hm_legal':
        _showComingSoonMessage(id);
        break;
    }
  }

  void _handleTourOperatorNavigation(String id) {
    switch (id) {
      case 'create_tour':
        Get.to(() => const TourCreateScreen());
        break;
      case 'post_packages':
        Get.to(() => const TourPackagesScreen());
        break;
      case 'calendar':
        Get.to(() => const TourCalendarScreen());
        break;
      case 'bookings':
        Get.to(() => const TourBookingsScreen());
        break;
      case 'setup':
      case 'tour_verification':
        Get.to(() => const TourVerificationScreen());
        break;
      case 'tour_dashboard':
      case 'to_settings':
      case 'to_support':
      case 'to_legal':
        _showComingSoonMessage(id);
        break;
    }
  }

  void _showComingSoonMessage(String id) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$id ${_PartnerWorkspaceConstants.comingSoonMessage}'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = partnerAccent(_activeRole);
    final size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () => _toggleDrawer(true),
                      ),
                      Expanded(
                        child: Text(
                          _PartnerWorkspaceConstants.workspaceTitle,
                          style: AppTextStyle.titleLarge.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: _PartnerWorkspaceConstants
                              .roleBadgeHorizontalPadding,
                          vertical: _PartnerWorkspaceConstants
                              .roleBadgeVerticalPadding,
                        ),
                        decoration: BoxDecoration(
                          color: accent.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(
                            _PartnerWorkspaceConstants.roleBadgeBorderRadius,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              _activeRole == PartnerRole.hotelManager
                                  ? Icons.apartment_outlined
                                  : Icons.route_outlined,
                              color: accent,
                              size: _PartnerWorkspaceConstants.roleIconSize,
                            ),
                            const SizedBox(
                              width:
                                  _PartnerWorkspaceConstants.roleBadgeSpacing,
                            ),
                            Text(
                              _roleLabel(_activeRole),
                              style: AppTextStyle.bodySmall.copyWith(
                                color: accent,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Expanded(
                  child: GetX<PartnerDashboardController>(
                    tag: _activeRole.name,
                    builder: (controller) {
                      if (controller.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final data = controller.data.value;
                      if (data == null) {
                        return const Center(
                          child: Text(_PartnerWorkspaceConstants.loadingError),
                        );
                      }

                      final size = MediaQuery.of(context).size;
                      return SingleChildScrollView(
                        padding:
                            EdgeInsets.symmetric(
                              horizontal:
                                  size.width *
                                  _PartnerWorkspaceConstants
                                      .contentHorizontalPadding,
                            ).copyWith(
                              bottom: _PartnerWorkspaceConstants
                                  .contentBottomPadding,
                            ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _HeroCard(role: _activeRole, data: data),
                            SizedBox(
                              height:
                                  size.height *
                                  _PartnerWorkspaceConstants.sectionSpacing,
                            ),
                            _MetricsRow(metrics: data.metrics, accent: accent),
                            SizedBox(
                              height:
                                  size.height *
                                  _PartnerWorkspaceConstants.sectionSpacing,
                            ),
                            Text(
                              _PartnerWorkspaceConstants.quickLinksTitle,
                              style: AppTextStyle.headlineSmall.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height:
                                  size.height *
                                  _PartnerWorkspaceConstants.quickLinksSpacing,
                            ),
                            _QuickActionsGrid(actions: data.quickActions),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        AppDrawer(
          isOpen: _drawerOpen,
          onClose: () => _toggleDrawer(false),
          meta: _currentMeta,
          items: _currentDrawerItems,
          onItemTap: _handleDrawerItem,
          onSwitchToTraveler: _switchToTraveler,
          showPartnerButton: false,
        ),
      ],
    );
  }

  String _roleLabel(PartnerRole role) {
    switch (role) {
      case PartnerRole.hotelManager:
        return 'Hotel Manager';
      case PartnerRole.tourOperator:
        return 'Tour Operator';
    }
  }
}

class _HeroCard extends StatelessWidget {
  final PartnerRole role;
  final PartnerDashboardData data;

  const _HeroCard({required this.role, required this.data});

  @override
  Widget build(BuildContext context) {
    final gradient = partnerGradient(role);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(_PartnerWorkspaceConstants.heroCardPadding),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(
          _PartnerWorkspaceConstants.heroCardBorderRadius,
        ),
        boxShadow: [
          BoxShadow(
            color: gradient.colors.last.withValues(alpha: 0.25),
            blurRadius: _PartnerWorkspaceConstants.heroShadowBlur,
            offset: const Offset(
              0,
              _PartnerWorkspaceConstants.heroShadowOffset,
            ),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.heroTitle,
            style: AppTextStyle.headlineMedium.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: _PartnerWorkspaceConstants.heroTitleSpacing),
          Text(
            data.heroSubtitle,
            style: AppTextStyle.bodyLarge.copyWith(
              color: Colors.white.withValues(alpha: 0.85),
            ),
          ),
          const SizedBox(
            height: _PartnerWorkspaceConstants.heroSubtitleSpacing,
          ),
          Wrap(
            spacing: _PartnerWorkspaceConstants.heroBadgeSpacing,
            runSpacing: _PartnerWorkspaceConstants.heroBadgeSpacing,
            children: data.heroHighlights
                .map((text) => _HeroBadge(text: text))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _HeroBadge extends StatelessWidget {
  final String text;

  const _HeroBadge({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: _PartnerWorkspaceConstants.heroBadgeHorizontalPadding,
        vertical: _PartnerWorkspaceConstants.heroBadgeVerticalPadding,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(
          _PartnerWorkspaceConstants.heroBadgeBorderRadius,
        ),
        border: Border.all(color: Colors.white.withValues(alpha: 0.25)),
      ),
      child: Text(
        text,
        style: AppTextStyle.bodySmall.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _MetricsRow extends StatelessWidget {
  final List<PartnerMetric> metrics;
  final Color accent;

  const _MetricsRow({required this.metrics, required this.accent});

  @override
  Widget build(BuildContext context) {
    if (metrics.isEmpty) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final metricVerticalSpacing =
        screenHeight * _PartnerWorkspaceConstants.metricSpacing;

    return Wrap(
      spacing: _PartnerWorkspaceConstants.metricCardSpacing,
      runSpacing: _PartnerWorkspaceConstants.metricCardSpacing,
      children: metrics.map((metric) {
        return Container(
          width: _PartnerWorkspaceConstants.metricCardWidth,
          padding: const EdgeInsets.all(
            _PartnerWorkspaceConstants.metricCardPadding,
          ),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(
              _PartnerWorkspaceConstants.metricCardBorderRadius,
            ),
            border: Border.all(color: accent.withValues(alpha: 0.15)),
            boxShadow: [
              BoxShadow(
                color: accent.withValues(alpha: 0.08),
                blurRadius: _PartnerWorkspaceConstants.metricCardShadowBlur,
                offset: const Offset(
                  0,
                  _PartnerWorkspaceConstants.metricCardShadowOffset,
                ),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                metric.label,
                style: AppTextStyle.bodySmall.copyWith(
                  color: theme.textTheme.bodySmall?.color?.withValues(
                    alpha: 0.7,
                  ),
                ),
              ),
              SizedBox(height: metricVerticalSpacing),
              Text(
                metric.value,
                style: AppTextStyle.headlineSmall.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (metric.trendLabel != null) ...[
                SizedBox(height: metricVerticalSpacing),
                Text(
                  metric.trendLabel!,
                  style: AppTextStyle.bodySmall.copyWith(
                    color: accent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _QuickActionsGrid extends StatelessWidget {
  final List<PartnerQuickAction> actions;

  const _QuickActionsGrid({required this.actions});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _PartnerWorkspaceConstants.gridCrossAxisCount,
        crossAxisSpacing: _PartnerWorkspaceConstants.gridSpacing,
        mainAxisSpacing: _PartnerWorkspaceConstants.gridSpacing,
        childAspectRatio: _PartnerWorkspaceConstants.gridChildAspectRatio,
      ),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        final action = actions[index];
        final accent = action.background;

        return InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  '${action.title} ${_PartnerWorkspaceConstants.comingSoonMessage}',
                ),
              ),
            );
          },
          borderRadius: BorderRadius.circular(
            _PartnerWorkspaceConstants.actionCardBorderRadius,
          ),
          child: Ink(
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(
                _PartnerWorkspaceConstants.actionCardBorderRadius,
              ),
              border: Border.all(color: accent.withValues(alpha: 0.18)),
            ),
            padding: const EdgeInsets.all(
              _PartnerWorkspaceConstants.actionCardPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: const EdgeInsets.all(
                    _PartnerWorkspaceConstants.actionIconContainerPadding,
                  ),
                  decoration: BoxDecoration(
                    color: accent.withValues(alpha: 0.16),
                    borderRadius: BorderRadius.circular(
                      _PartnerWorkspaceConstants
                          .actionIconContainerBorderRadius,
                    ),
                  ),
                  child: Icon(action.icon, color: accent),
                ),
                const SizedBox(
                  height: _PartnerWorkspaceConstants.actionTitleSpacing,
                ),
                Text(
                  action.title,
                  style: AppTextStyle.bodyLarge.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: _PartnerWorkspaceConstants.actionSubtitleSpacing,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      action.subtitle,
                      style: AppTextStyle.bodySmall.copyWith(
                        color: theme.textTheme.bodySmall?.color?.withValues(
                          alpha: 0.7,
                        ),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
