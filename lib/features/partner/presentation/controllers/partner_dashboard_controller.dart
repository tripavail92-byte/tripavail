import 'package:get/get.dart';

import '../../domain/entities/partner_dashboard_summary.dart';
import '../../domain/usecases/get_partner_dashboard_summary.dart';

class PartnerDashboardController extends GetxController {
  final GetPartnerDashboardSummary _getSummary;

  PartnerDashboardController(this._getSummary);

  final RxBool isLoading = true.obs;
  final Rxn<PartnerDashboardSummary> summary = Rxn();
  final RxnString error = RxnString();

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    try {
      isLoading.value = true;
      error.value = null;
      final result = await _getSummary();
      summary.value = result;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
