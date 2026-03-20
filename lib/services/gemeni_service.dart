import 'package:ai_meal_planner/models/user_profile.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  final GenerativeModel _model;
  GeminiService(String apiKey)
    : _model = GenerativeModel(model: 'gemini-2.5-flash', apiKey: apiKey);

  Future<String> generate(UserProfile profile) async {
    final prompt =
        '''
    Ты — профессиональный диетолог. Составь план питания на один день для пользователя:
    Пол: ${profile.gender}, Возраст: ${profile.age}, Вес: ${profile.weight}кг, Рост: ${profile.height}см.
    Цель: ${profile.goal}.
    
    Ответь СТРОГО в формате JSON без лишнего текста и markdown разметки.
    Формат:
    {
      "calories": "число",
      "pfc": {"p": "белки", "f": "жиры", "c": "углеводы"},
      "meals": [
        {"time": "Завтрак", "dish": "название", "recipe": "кратко"},
        {"time": "Обед", "dish": "название", "recipe": "кратко"},
        {"time": "Ужин", "dish": "название", "recipe": "кратко"}
      ]
    }
    ''';

    final response = await _model.generateContent([Content.text(prompt)]);
    return response.text!
        .replaceAll('```json', '')
        .replaceAll('```', '')
        .trim();
  }
}
