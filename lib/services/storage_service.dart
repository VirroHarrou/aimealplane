import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ai_meal_planner/models/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class StorageService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  String? _cachedUserId;
  final Duration _timeout = const Duration(seconds: 10);

  Future<String> get _userId async {
    if (_cachedUserId != null) return _cachedUserId!;

    final prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('user_unique_id');

    if (id == null) {
      id = const Uuid().v4();
      await prefs.setString('user_unique_id', id);
    }

    _cachedUserId = id;
    return id;
  }

  Future<void> saveUser(UserProfile user) async {
    try {
      final uid = await _userId;
      user.userId = uid;

      await _db
          .collection('users')
          .doc(user.userId)
          .set(user.toMap(), SetOptions(merge: true))
          .timeout(_timeout);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UserProfile?> getUser() async {
    try {
      final uid = await _userId;
      final doc = await _db
          .collection('users')
          .doc(uid)
          .get()
          .timeout(_timeout);

      if (doc.exists && doc.data() != null) {
        return UserProfile.fromMap(doc.id, doc.data()!);
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> cachePlan(String key, String json) async {
    try {
      final uid = await _userId;
      final planDocId = "${uid}_$key";

      await _db
          .collection('meal_plans')
          .doc(planDocId)
          .set({
            'userId': uid,
            'rawJson': json,
            'dateKey': key,
            'createdAt': FieldValue.serverTimestamp(),
          })
          .timeout(_timeout);
    } catch (e) {
      throw Exception('Ошибка кэширования плана: $e');
    }
  }

  Future<String?> getCachedPlan(String key) async {
    try {
      final uid = await _userId;
      final planDocId = "${uid}_$key";

      final doc = await _db
          .collection('meal_plans')
          .doc(planDocId)
          .get()
          .timeout(_timeout);
      return doc.exists ? doc.data()!['rawJson'] as String : null;
    } catch (e) {
      return null;
    }
  }
}
