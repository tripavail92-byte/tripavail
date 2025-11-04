import 'package:get/get.dart';
import '../../models/partner_dashboard_data.dart';
import '../../models/partner_role.dart';

class PartnerDashboardController extends GetxController {
  final PartnerRole role;

  PartnerDashboardController(this.role);

  final RxBool isLoading = false.obs;
  final Rxn<PartnerDashboardData> data = Rxn();

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    // Simulate loading delay
    await Future.delayed(const Duration(milliseconds: 500));
    data.value = PartnerDashboardData.mockData(role);
    isLoading.value = false;
  }
}
