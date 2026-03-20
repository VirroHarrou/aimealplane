import 'package:flutter/material.dart';

class MealPlanView extends StatelessWidget {
  final Map<String, dynamic> plan;

  const MealPlanView({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    final calories = plan['calories']?.toString() ?? 'не указано';
    final meals = plan['meals'] as List<dynamic>? ?? [];

    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Общая калорийность: $calories ккал',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            const SizedBox(height: 16),
            ...meals.map((meal) => _buildMealItem(meal)),
          ],
        ),
      ),
    );
  }

  Widget _buildMealItem(Map<String, dynamic> meal) {
    final time = meal['time'] ?? 'Время не указано';
    final dish = meal['dish'] ?? 'Блюдо не указано';
    final recipe = meal['recipe'] ?? 'Рецепт не указан';

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.access_time),
                const SizedBox(width: 8),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              dish,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Text(recipe, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
