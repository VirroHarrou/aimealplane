import 'package:ai_meal_planner/generated/l10n.dart';
import 'package:ai_meal_planner/models/user_profile.dart';
import 'package:ai_meal_planner/providers/service_providers.dart';
import 'package:ai_meal_planner/providers/user_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ProfileSetupScreen extends ConsumerStatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  ConsumerState<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends ConsumerState<ProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();

  BannerAd? _bannerAd;
  bool _isBannerLoaded = false;

  Gender? _gender;
  DietGoal? _goal;
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadBanner();
    final user = ref.read(userProfileProvider);
    if (user != null) {
      _gender = user.gender;
      _ageController.text = user.age.toString();
      _weightController.text = user.weight.toString();
      _heightController.text = user.height.toString();
      _goal = user.goal;
    }
  }

  void _loadBanner() {
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) => setState(() => _isBannerLoaded = true),
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          debugPrint('BannerAd failed to load: $error');
        },
      ),
    )..load();
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

    ref.read(appMetricaProvider).reportEvent("Profile saved");

    final user = UserProfile()
      ..gender = _gender!
      ..age = int.parse(_ageController.text)
      ..weight = double.parse(_weightController.text)
      ..height = double.parse(_heightController.text)
      ..goal = _goal!;

    try {
      await ref.read(userProfileProvider.notifier).saveUser(user);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(S.of(context).saveError)));
      }
    }

    if (mounted && Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).profile)),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                DropdownButtonFormField<Gender>(
                  initialValue: _gender,
                  decoration: InputDecoration(labelText: S.of(context).gender),
                  items: [
                    DropdownMenuItem(
                      value: Gender.male,
                      child: Text(S.of(context).genderMale),
                    ),
                    DropdownMenuItem(
                      value: Gender.female,
                      child: Text(S.of(context).genderFemale),
                    ),
                  ],
                  onChanged: (value) => setState(() => _gender = value),
                  validator: (value) =>
                      value == null ? S.of(context).selectGender : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _ageController,
                  decoration: InputDecoration(labelText: S.of(context).age),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).inputAge;
                    }
                    if (int.tryParse(value) == null) {
                      return S.of(context).validationNumber;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _weightController,
                  decoration: InputDecoration(labelText: S.of(context).weight),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).inputWeight;
                    }
                    if (double.tryParse(value) == null) {
                      return S.of(context).validationNumber;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _heightController,
                  decoration: InputDecoration(labelText: S.of(context).height),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).inputHeight;
                    }
                    if (double.tryParse(value) == null) {
                      return S.of(context).validationNumber;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<DietGoal>(
                  initialValue: _goal,
                  decoration: InputDecoration(labelText: S.of(context).goal),
                  items: [
                    DropdownMenuItem(
                      value: DietGoal.loss,
                      child: Text(S.of(context).goalLoss),
                    ),
                    DropdownMenuItem(
                      value: DietGoal.mass,
                      child: Text(S.of(context).goalMass),
                    ),
                    DropdownMenuItem(
                      value: DietGoal.maintenance,
                      child: Text(S.of(context).goalMaintenance),
                    ),
                  ],
                  onChanged: (value) => setState(() => _goal = value),
                  validator: (value) =>
                      value == null ? S.of(context).selectGoal : null,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _saveProfile,
                  child: Text(S.of(context).save),
                ),
                const SizedBox(height: 24),
                if (_isBannerLoaded)
                  Container(
                    alignment: Alignment.center,
                    width: _bannerAd!.size.width.toDouble(),
                    height: _bannerAd!.size.height.toDouble(),
                    child: AdWidget(ad: _bannerAd!),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
