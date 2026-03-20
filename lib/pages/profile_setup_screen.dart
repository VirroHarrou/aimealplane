import 'package:ai_meal_planner/models/user_profile.dart';
import 'package:ai_meal_planner/providers/user_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileSetupScreen extends ConsumerStatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  ConsumerState<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends ConsumerState<ProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _gender;
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  String? _goal;

  final List<String> _genders = ['Мужской', 'Женский'];
  final List<String> _goals = ['похудение', 'масса', 'поддержание'];

  @override
  void initState() {
    super.initState();
    final user = ref.read(userProfileProvider);
    if (user != null) {
      _gender = user.gender;
      _ageController.text = user.age.toString();
      _weightController.text = user.weight.toString();
      _heightController.text = user.height.toString();
      _goal = user.goal;
    }
  }

  @override
  void dispose() {
    _ageController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    final user = UserProfile()
      ..gender = _gender!
      ..age = int.parse(_ageController.text)
      ..weight = double.parse(_weightController.text)
      ..height = double.parse(_heightController.text)
      ..goal = _goal!;

    await ref.read(userProfileProvider.notifier).updateUser(user);

    if (mounted && Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ваш профиль')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<String>(
                initialValue: _gender,
                decoration: const InputDecoration(labelText: 'Пол'),
                items: _genders
                    .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                    .toList(),
                onChanged: (value) => setState(() => _gender = value),
                validator: (value) => value == null ? 'Выберите пол' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'Возраст (лет)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Введите возраст';
                  if (int.tryParse(value) == null) return 'Введите число';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _weightController,
                decoration: const InputDecoration(labelText: 'Вес (кг)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Введите вес';
                  if (double.tryParse(value) == null) return 'Введите число';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _heightController,
                decoration: const InputDecoration(labelText: 'Рост (см)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Введите рост';
                  if (double.tryParse(value) == null) return 'Введите число';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: _goal,
                decoration: const InputDecoration(labelText: 'Цель'),
                items: _goals
                    .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                    .toList(),
                onChanged: (value) => setState(() => _goal = value),
                validator: (value) => value == null ? 'Выберите цель' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _saveProfile,
                child: const Text('Сохранить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
