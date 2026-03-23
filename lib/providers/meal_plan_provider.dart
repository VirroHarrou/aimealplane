import 'package:ai_meal_planner/providers/service_providers.dart';
import 'package:ai_meal_planner/providers/user_profile_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealPlanProvider =
    StateNotifierProvider<MealPlanNotifier, AsyncValue<String?>>((ref) {
      return MealPlanNotifier(ref);
    });

class MealPlanNotifier extends StateNotifier<AsyncValue<String?>> {
  final Ref _ref;
  MealPlanNotifier(this._ref) : super(const AsyncValue.data(null));

  Future<void> fetchPlan() async {
    final user = _ref.read(userProfileProvider);
    if (user == null) return;

    final key =
        "${DateTime.now().toIso8601String().substring(0, 10)}_${user.goal}";
    final storage = _ref.read(storageServiceProvider);

    state = const AsyncValue.loading();
    try {
      final cached = await storage.getCachedPlan(key);
      if (cached != null) {
        state = AsyncValue.data(cached);
        return;
      }
      final result = await _ref.read(geminiServiceProvider).generate(user);
      await storage.cachePlan(key, result);
      state = AsyncValue.data(result);
      onMealPlanGenerated(user.goal.name);
    } catch (e, st) {
      state = AsyncValue.error("Ошибка сети или API", st);
    }
  }

  void onMealPlanGenerated(String dietType) {
    _ref.read(appsflyerProvider).logEvent("af_meal_plan_generated", {
      "diet_type": dietType,
      "timestamp": DateTime.now().toIso8601String(),
    });
  }
}
