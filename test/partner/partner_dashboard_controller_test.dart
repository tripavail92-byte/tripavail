import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import 'package:tripavail/features/partner/domain/entities/partner_dashboard_summary.dart';
import 'package:tripavail/features/partner/domain/entities/partner_metric.dart';
import 'package:tripavail/features/partner/domain/entities/partner_quick_action.dart';
import 'package:tripavail/features/partner/domain/repositories/partner_dashboard_repository.dart';
import 'package:tripavail/features/partner/domain/usecases/get_partner_dashboard_summary.dart';
import 'package:tripavail/features/partner/presentation/controllers/partner_dashboard_controller.dart';

class _FakeRepoOk implements PartnerDashboardRepository {
  @override
  Future<PartnerDashboardSummary> fetchDashboard() async {
    return PartnerDashboardSummary(
      heroTitle: 'Test HQ',
      heroSubtitle: 'Subtitle',
      heroHighlights: const ['A', 'B'],
      metrics: const [PartnerMetric(id: 'm1', label: 'Metric', value: '100')],
      quickActions: const [
        PartnerQuickAction(
          id: 'qa1',
          title: 'Action',
          subtitle: 'Do something',
          icon: Icons.info,
          background: Color(0xFF9D4EDD),
        ),
      ],
    );
  }
}

class _FakeRepoErr implements PartnerDashboardRepository {
  @override
  Future<PartnerDashboardSummary> fetchDashboard() async {
    throw Exception('boom');
  }
}

void main() {
  setUp(() {
    Get.reset();
  });

  test('PartnerDashboardController loads summary successfully', () async {
    final controller = PartnerDashboardController(
      GetPartnerDashboardSummary(_FakeRepoOk()),
    );

    await controller.load();

    expect(controller.isLoading.value, false);
    expect(controller.summary.value, isNotNull);
    expect(controller.error.value, isNull);
    expect(controller.summary.value!.heroTitle, 'Test HQ');
  });

  test('PartnerDashboardController captures errors', () async {
    final controller = PartnerDashboardController(
      GetPartnerDashboardSummary(_FakeRepoErr()),
    );

    await controller.load();

    expect(controller.isLoading.value, false);
    expect(controller.summary.value, isNull);
    expect(controller.error.value, isNotNull);
  });
}
