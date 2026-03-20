import 'package:isar/isar.dart';

part 'meal_plan.g.dart';

@collection
class MealPlan {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String dateKey; // формат: "2026-03-20_масса"
  late String rawJson;
}
