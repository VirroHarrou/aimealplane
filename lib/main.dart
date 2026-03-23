import 'package:ai_meal_planner/app_root.dart';
import 'package:ai_meal_planner/firebase_options.dart';
import 'package:ai_meal_planner/providers/service_providers.dart';
import 'package:ai_meal_planner/services/storage_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
    MobileAds.instance.initialize();
  } catch (e) {
    debugPrint(e.toString());
  }

  final storageService = StorageService();

  runApp(
    ProviderScope(
      overrides: [storageServiceProvider.overrideWithValue(storageService)],
      child: const AppRoot(),
    ),
  );
}
