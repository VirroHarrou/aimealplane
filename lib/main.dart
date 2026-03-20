import 'package:ai_meal_planner/pages/main_plan_screen.dart';
import 'package:ai_meal_planner/pages/profile_setup_screen.dart';
import 'package:ai_meal_planner/providers/service_providers.dart';
import 'package:ai_meal_planner/providers/user_profile_provider.dart';
import 'package:ai_meal_planner/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  final storageService = StorageService();
  await storageService.init();

  runApp(
    ProviderScope(
      overrides: [storageServiceProvider.overrideWithValue(storageService)],
      child: const AppRoot(),
    ),
  );
}

class AppRoot extends ConsumerWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProfileProvider);

    return MaterialApp(
      title: 'AI Meal Planner',
      home: user == null ? const ProfileSetupScreen() : const MainPlanScreen(),
    );
  }
}
