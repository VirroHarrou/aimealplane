import 'package:ai_meal_planner/generated/l10n.dart';
import 'package:ai_meal_planner/models/user_profile.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  final GenerativeModel _model;
  GeminiService(String apiKey)
    : _model = GenerativeModel(model: 'gemini-2.5-flash', apiKey: apiKey);

  Future<String> generate(UserProfile profile) async {
    final genderText = profile.gender == Gender.male
        ? S.current.genderMale
        : S.current.genderFemale;
    final goalText = {
      DietGoal.loss: S.current.goalLoss,
      DietGoal.mass: S.current.goalMass,
      DietGoal.maintenance: S.current.goalMaintenance,
    }[profile.goal];

    final response = await _model.generateContent([
      Content.text(
        S.current.geminiPrompt(
          genderText,
          profile.age,
          profile.weight,
          profile.height,
          goalText ?? '',
          S.current.jsonStructure,
        ),
      ),
    ]);
    return response.text!
        .replaceAll('```json', '')
        .replaceAll('```', '')
        .trim();
  }
}
