import 'package:ai_meal_planner/generated/l10n.dart';
import 'package:ai_meal_planner/pages/main_plan_screen.dart';
import 'package:ai_meal_planner/pages/profile_setup_screen.dart';
import 'package:ai_meal_planner/providers/service_providers.dart';
import 'package:ai_meal_planner/providers/user_profile_provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppRoot extends ConsumerWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initializer = ref.watch(appInitializerProvider);
    final userProfile = ref.watch(userProfileProvider);

    return MaterialApp(
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
      ],
      onGenerateTitle: (context) => S.of(context).appTitle,
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: initializer.when(
        data: (_) {
          if (userProfile == null) {
            return const ProfileSetupScreen();
          }
          return const MainPlanScreen();
        },
        loading: () =>
            const Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (error, stackTrace) =>
            Scaffold(body: Center(child: Text(error.toString()))),
      ),
    );
  }
}
