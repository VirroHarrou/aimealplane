import 'dart:convert';
import 'package:ai_meal_planner/providers/meal_plan_provider.dart';
import 'package:ai_meal_planner/widgets/meal_plan_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'profile_setup_screen.dart';

class MainPlanScreen extends ConsumerWidget {
  const MainPlanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final planAsync = ref.watch(mealPlanProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("AI План Питания"),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfileSetupScreen()),
              );
            },
            tooltip: 'Редактировать профиль',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => ref.read(mealPlanProvider.notifier).fetchPlan(),
              child: const Text("Сгенерировать план на сегодня"),
            ),
            const Divider(),
            Expanded(
              child: planAsync.when(
                data: (data) => data == null
                    ? const Center(child: Text("Нажмите кнопку для генерации"))
                    : _buildPlanView(data),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text("Ошибка: $e")),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanView(String jsonString) {
    try {
      final decoded = jsonDecode(jsonString) as Map<String, dynamic>;
      return SingleChildScrollView(child: MealPlanView(plan: decoded));
    } catch (e) {
      return Center(
        child: Column(
          children: [
            const Text('Ошибка формата данных:'),
            const SizedBox(height: 8),
            Text(e.toString()),
            const SizedBox(height: 8),
            Text(jsonString, style: const TextStyle(fontSize: 12)),
          ],
        ),
      );
    }
  }
}
