import 'dart:convert';
import 'package:ai_meal_planner/generated/l10n.dart';
import 'package:ai_meal_planner/pages/profile_setup_screen.dart';
import 'package:ai_meal_planner/providers/meal_plan_provider.dart';
import 'package:ai_meal_planner/widgets/meal_plan_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPlanScreen extends ConsumerWidget {
  const MainPlanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final planAsync = ref.watch(mealPlanProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfileSetupScreen()),
              );
            },
            tooltip: S.of(context).editProfile,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => ref.read(mealPlanProvider.notifier).fetchPlan(),
              child: Text(S.of(context).generatePlan),
            ),
            const Divider(),
            Expanded(
              child: planAsync.when(
                data: (data) => data == null
                    ? Center(child: Text(S.of(context).pressButtonToGenerate))
                    : _buildPlanView(data, context),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) =>
                    Center(child: Text(S.of(context).error(e.toString()))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanView(String jsonString, BuildContext context) {
    try {
      final decoded = jsonDecode(jsonString) as Map<String, dynamic>;
      return SingleChildScrollView(child: MealPlanView(plan: decoded));
    } catch (e) {
      return Center(
        child: Column(
          children: [
            Text(S.of(context).formatError),
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
