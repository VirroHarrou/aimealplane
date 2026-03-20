import 'package:ai_meal_planner/services/gemeni_service.dart';
import 'package:ai_meal_planner/services/storage_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storageServiceProvider = Provider((ref) => StorageService());

final geminiServiceProvider = Provider((ref) {
  final apiKey = dotenv.env['GEMINI_API_KEY'];
  if (apiKey == null) throw Exception('GEMINI_API_KEY not found in .env');
  return GeminiService(apiKey);
});
