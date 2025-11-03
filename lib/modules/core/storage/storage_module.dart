import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'storage_service.dart';

class StorageModule {
  StorageModule._();

  static Future<void> register() async {
    final prefs = await SharedPreferences.getInstance();
    Get.put<StorageService>(StorageService(prefs: prefs), permanent: true);
  }
}
