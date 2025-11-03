import 'app_module.dart';

class ModuleRegistry {
  ModuleRegistry._();

  static final List<AppModule> _modules = [];

  static void register(AppModule module) {
    _modules.add(module);
    module.registerDependencies();
  }

  static void registerDefaults(List<AppModule> modules) {
    _modules.clear();
    for (final module in modules) {
      register(module);
    }
  }
}
