import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/features/drawer/drawer_definitions.dart';
import 'package:tripavail/features/drawer/drawer_item.dart';
import 'package:tripavail/features/drawer/drawer_manager.dart';
import 'package:tripavail/features/partner/domain/entities/partner_dashboard_summary.dart';
import 'package:tripavail/features/partner/domain/entities/partner_metric.dart';
import 'package:tripavail/features/partner/domain/entities/partner_quick_action.dart';
import 'package:tripavail/features/partner/models/partner_role.dart';
import 'package:tripavail/features/partner/presentation/controllers/partner_dashboard_controller.dart';
import 'package:tripavail/features/partner/utils/partner_branding.dart';
import 'package:tripavail/modules/traveler/traveler_routes.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/theme/constants/app_spacing.dart';

class PartnerWorkspaceScreen extends StatefulWidget {
  final PartnerRole initialRole;

  const PartnerWorkspaceScreen({super.key, required this.initialRole});

  @override
  State<PartnerWorkspaceScreen> createState() => _PartnerWorkspaceScreenState();
}

class _PartnerWorkspaceScreenState extends State<PartnerWorkspaceScreen> {
  late PartnerRole _activeRole;
  bool _drawerOpen = false;
  String _selectedItemId = DrawerDefinitions.hotelManagerItems.first.id;

  @override
  void initState() {
    super.initState();
    _activeRole = widget.initialRole;
    _selectedItemId = _activeRole == PartnerRole.hotelManager
        ? DrawerDefinitions.hotelManagerItems.first.id
        : DrawerDefinitions.tourOperatorItems.first.id;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => _drawerOpen = true);
    });
  }

  void _switchToTraveler() {
    setState(() => _drawerOpen = false);
    Get.offAllNamed(TravelerRoutes.main);
  }

  void _toggleDrawer(bool open) {
    setState(() => _drawerOpen = open);
  }

  List<DrawerItem> get _currentDrawerItems =>
      _activeRole == PartnerRole.hotelManager
      ? DrawerDefinitions.hotelManagerItems
      : DrawerDefinitions.tourOperatorItems;

  DrawerMeta get _currentMeta => _activeRole == PartnerRole.hotelManager
      ? DrawerDefinitions.hotelManagerMeta
      : DrawerDefinitions.tourOperatorMeta;

  PartnerDashboardController _controllerForRole(PartnerRole role) {
    return Get.find<PartnerDashboardController>(tag: role.name);
  }

  void _handleDrawerItem(String id, String screen) {
    setState(() {
      _selectedItemId = id;
      _drawerOpen = false;
    });
    if (screen.isNotEmpty) {
      Get.toNamed(screen);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = partnerAccent(_activeRole);

    return Stack(
      children: [
        Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () => _toggleDrawer(true),
                      ),
                      Text(
                        'Partner Workspace',
                        style: AppTextStyle.titleLarge.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: accent.withValues(alpha:0.12),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              _activeRole == PartnerRole.hotelManager
                                  ? Icons.apartment_outlined
                                  : Icons.route_outlined,
                              color: accent,
                              size: 18,
                            ),
                            const SizedBox(width: 6),
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
                const SizedBox(height: 16),
                Expanded(
                  child: GetX<PartnerDashboardController>(
                    tag: _activeRole.name,
                    init: _controllerForRole(_activeRole),
                    builder: (controller) {
                      if (controller.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final summary = controller.summary.value;
                      if (summary == null) {
                        return Center(
                          child: Text(
                            controller.error.value ?? 'Unable to load data',
                            style: AppTextStyle.bodyMedium,
                          ),
                        );
                      }

                      return SingleChildScrollView(
                        padding: AppSpacing.horizontalPadding(
                          context,
                        ).copyWith(bottom: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _HeroCard(role: _activeRole, summary: summary),
                            AppSpacing.v24(),
                            _MetricsRow(
                              metrics: summary.metrics,
                              accent: accent,
                            ),
                            AppSpacing.v24(),
                            Text(
                              'Quick links',
                              style: AppTextStyle.headlineSmall.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            AppSpacing.v16(),
                            _QuickActionsGrid(actions: summary.quickActions),
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
        DrawerManager(
          isOpen: _drawerOpen,
          onClose: () => _toggleDrawer(false),
          role: _activeRole == PartnerRole.hotelManager
              ? 'hotel_manager'
              : 'tour_operator',
          selectedItemId: _selectedItemId,
          items: _currentDrawerItems,
          meta: _currentMeta,
          onItemClick: _handleDrawerItem,
          onBecomePartner: () {},
          onSwitchToTraveler: _switchToTraveler,
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

// Role toggle removed by design: workspaces are strictly single‑role.

class _HeroCard extends StatelessWidget {
  final PartnerRole role;
  final PartnerDashboardSummary summary;

  const _HeroCard({required this.role, required this.summary});

  @override
  Widget build(BuildContext context) {
    final gradient = partnerGradient(role);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: gradient.colors.last.withValues(alpha:0.25),
            blurRadius: 30,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            summary.heroTitle,
            style: AppTextStyle.headlineMedium.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            summary.heroSubtitle,
            style: AppTextStyle.bodyLarge.copyWith(
              color: Colors.white.withValues(alpha:0.85),
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: summary.heroHighlights
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
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha:0.16),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha:0.25)),
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

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: metrics.map((metric) {
        return Container(
          width: 180,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: accent.withValues(alpha:0.15)),
            boxShadow: [
              BoxShadow(
                color: accent.withValues(alpha:0.08),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                metric.label,
                style: AppTextStyle.bodySmall.copyWith(
                  color: theme.textTheme.bodySmall?.color?.withValues(alpha:0.7),
                ),
              ),
              AppSpacing.v8(),
              Text(
                metric.value,
                style: AppTextStyle.headlineSmall.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (metric.trendLabel != null) ...[
                AppSpacing.v8(),
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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.2,
      ),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        final action = actions[index];
        final accent = action.background;

        return InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${action.title} coming soon')),
            );
          },
          borderRadius: BorderRadius.circular(20),
          child: Ink(
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: accent.withValues(alpha:0.18)),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: accent.withValues(alpha:0.16),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(action.icon, color: accent),
                ),
                const SizedBox(height: 16),
                Text(
                  action.title,
                  style: AppTextStyle.bodyLarge.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  action.subtitle,
                  style: AppTextStyle.bodySmall.copyWith(
                    color: theme.textTheme.bodySmall?.color?.withValues(alpha:0.7),
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
