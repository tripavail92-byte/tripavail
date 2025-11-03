import 'package:get/get.dart';

import 'package:tripavail/modules/core/logger/app_logger.dart';
import 'package:tripavail/modules/core/network/network_module.dart';
import 'package:tripavail/modules/core/storage/storage_module.dart';

import '../app_module.dart';

class CoreModule extends AppModule {
  @override
  String get name => 'core';

  @override
  List<GetPage<dynamic>> get pages => const [];

  @override
  void registerDependencies() {
    NetworkModule.register();
    StorageModule.register();
    Get.put<AppLogger>(AppLogger(), permanent: true);
  }
}
