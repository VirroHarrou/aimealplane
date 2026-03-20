import 'package:ai_meal_planner/models/user_profile.dart';
import 'package:ai_meal_planner/providers/service_providers.dart';
import 'package:ai_meal_planner/services/storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProfileProvider =
    StateNotifierProvider<UserProfileNotifier, UserProfile?>((ref) {
      return UserProfileNotifier(ref.read(storageServiceProvider));
    });

class UserProfileNotifier extends StateNotifier<UserProfile?> {
  final StorageService _storage;

  UserProfileNotifier(this._storage) : super(null) {
    loadUser();
  }

  Future<void> loadUser() async {
    final user = await _storage.getUser();
    state = user;
  }

  Future<void> updateUser(UserProfile user) async {
    await _storage.saveUser(user);
    state = user;
  }
}
