import 'package:ai_meal_planner/services/gemeni_service.dart';
import 'package:ai_meal_planner/services/storage_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storageServiceProvider = Provider((ref) => StorageService());

final geminiServiceProvider = Provider((ref) {
  const envApiKey = String.fromEnvironment('GEMINI_API_KEY');

  final apiKey = envApiKey.isNotEmpty
      ? envApiKey
      : dotenv.env['GEMINI_API_KEY'];

  if (apiKey == null || apiKey.isEmpty) {
    throw Exception('GEMINI_API_KEY не найден ни в окружении, ни в .env');
  }

  return GeminiService(apiKey);
});
