import 'package:get/get.dart';

abstract class AppModule {
  String get name;

  List<GetPage<dynamic>> get pages => const [];

  void registerDependencies() {}
}
