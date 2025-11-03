import 'package:get/get.dart';

import 'api_client.dart';
import 'api_client_factory.dart';

class NetworkModule {
  NetworkModule._();

  static void register() {
    Get.lazyPut<ApiClient>(
      () => ApiClient(dio: ApiClientFactory.create()),
      fenix: true,
    );
  }
}
