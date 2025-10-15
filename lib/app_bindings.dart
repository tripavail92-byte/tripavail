import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tripavail/utils/theme/theme_controller.dart';
import 'package:tripavail/widgets/internet_check_connectivity.dart';

import 'common/controllers/preference_controller.dart';

BindingsBuilder createBindings(BuildContext context) {
  return BindingsBuilder(() {
    Get.put(ThemeController(), permanent: true);
    Get.put(InternetConnectionController(), permanent: true);
    Get.put(AppPreferencesController(), permanent: true);
  });
}
