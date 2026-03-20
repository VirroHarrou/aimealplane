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
    try {
      state = await _storage.getUser();
    } catch (e) {
      state = null;
    }
  }

  Future<void> saveUser(UserProfile user) async {
    try {
      await _storage.saveUser(user);
      state = user;
    } catch (e) {
      rethrow;
    }
  }
}
