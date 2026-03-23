enum Gender { male, female }

enum DietGoal { loss, mass, maintenance }

class UserProfile {
  late String userId;
  late Gender gender;
  late int age;
  late double weight;
  late double height;
  late DietGoal goal;

  Map<String, dynamic> toMap() {
    return {
      'gender': gender.name,
      'age': age,
      'weight': weight,
      'height': height,
      'goal': goal.name,
    };
  }

  static UserProfile fromMap(String id, Map<String, dynamic> map) {
    return UserProfile()
      ..userId = id
      ..gender = Gender.values.byName(map['gender'])
      ..age = map['age']
      ..weight = (map['weight'] as num).toDouble()
      ..height = (map['height'] as num).toDouble()
      ..goal = DietGoal.values.byName(map['goal']);
  }
}
