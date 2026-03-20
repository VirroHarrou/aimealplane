import 'package:isar/isar.dart';

part 'user_profile.g.dart';

@collection
class UserProfile {
  Id id = Isar.autoIncrement;

  late String gender;
  late int age;
  late double weight;
  late double height;
  late String goal; // похудение, масса, поддержание
}
