import 'package:appmetrica_plugin/appmetrica_plugin.dart';

class AppMetricaService {
  Future<void> init(String apiKey) async {
    await AppMetrica.activate(AppMetricaConfig(apiKey));
  }

  void reportEvent(String name) {
    AppMetrica.reportEvent(name);
  }
}
