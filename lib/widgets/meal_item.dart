import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});

  final Map<String, dynamic> meal;

  @override
  Widget build(BuildContext context) {
    final time = meal['time'] ?? 'Время не указано';
    final dish = meal['dish'] ?? 'Блюдо не указано';
    final recipe = meal['recipe'] ?? 'Рецепт не указан';

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Row(
              children: [
                const Icon(Icons.access_time, size: 18),
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
            Text(
              dish,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Text(recipe, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
