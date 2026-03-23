import 'package:ai_meal_planner/services/app_metrica_service.dart';
import 'package:ai_meal_planner/services/apphud_service.dart';
import 'package:ai_meal_planner/services/appsflyer_service.dart';
import 'package:ai_meal_planner/services/gemeni_service.dart';
import 'package:ai_meal_planner/services/storage_service.dart';
import 'package:ai_meal_planner/services/tracking_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storageServiceProvider = Provider((ref) => StorageService());

final appMetricaProvider = Provider((ref) => AppMetricaService());

final geminiServiceProvider = Provider((ref) {
  const envApiKey = String.fromEnvironment('GEMINI_API_KEY');

  final apiKey = envApiKey.isNotEmpty ? envApiKey : '';

  if (apiKey.isEmpty) {
    throw Exception('GEMINI_API_KEY not found');
  }

  return GeminiService(apiKey);
});

final trackingServiceProvider = Provider((ref) => TrackingService());

final apphudProvider = Provider((ref) => ApphudService());

final appsflyerProvider = Provider((ref) {
  final afService = AFService(
    devKey: const String.fromEnvironment('AF_DEV_KEY'),
    appId: const String.fromEnvironment('AF_APP_ID'),
  );
  afService.init(
    (data) => ref.read(apphudProvider).handleAttribution(afData: data),
  );
  return afService;
});

final appInitializerProvider = FutureProvider<void>((ref) async {
  await ref
      .read(appMetricaProvider)
      .init(const String.fromEnvironment('APPMETRICA_KEY'));

  await ref
      .read(apphudProvider)
      .init(const String.fromEnvironment('APPHUD_KEY'));

  await ref.read(trackingServiceProvider).requestATT();

  ref.read(appsflyerProvider);

  final fId = await FirebaseAnalytics.instance.appInstanceId;
  ref.read(apphudProvider).handleAttribution(firebaseId: fId);
});
