import 'package:ai_meal_planner/models/meal_plan.dart';
import 'package:ai_meal_planner/models/user_profile.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class StorageService {
  late Isar isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([
      UserProfileSchema,
      MealPlanSchema,
    ], directory: dir.path);
  }

  Future<void> saveUser(UserProfile user) async {
    await isar.writeTxn(() => isar.userProfiles.clear());
    await isar.writeTxn(() => isar.userProfiles.put(user));
  }

  Future<UserProfile?> getUser() async {
    return await isar.userProfiles.where().findFirst();
  }

  Future<void> cachePlan(String key, String json) async {
    final plan = MealPlan()
      ..dateKey = key
      ..rawJson = json;
    await isar.writeTxn(() => isar.mealPlans.put(plan));
  }

  Future<String?> getCachedPlan(String key) async {
    final plan = await isar.mealPlans.filter().dateKeyEqualTo(key).findFirst();
    return plan?.rawJson;
  }
}
