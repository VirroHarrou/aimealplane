import 'package:ai_meal_planner/generated/l10n.dart';
import 'package:ai_meal_planner/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MealPlanView extends StatefulWidget {
  final Map<String, dynamic> plan;

  const MealPlanView({super.key, required this.plan});

  @override
  State<MealPlanView> createState() => _MealPlanViewState();
}

class _MealPlanViewState extends State<MealPlanView> {
  NativeAd? _nativeAd;
  bool _nativeAdIsLoaded = false;

  final String _adUnitId = 'ca-app-pub-3940256099942544/2247696110';

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }

  void _loadAd() {
    _nativeAd = NativeAd(
      adUnitId: _adUnitId,
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _nativeAdIsLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('$NativeAd failed to load: $error');
          ad.dispose();
        },
      ),
      request: const AdRequest(),
      nativeTemplateStyle: NativeTemplateStyle(
        templateType: TemplateType.medium,
        mainBackgroundColor: Colors.white,
        cornerRadius: 10.0,
      ),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    final calories = widget.plan['calories'] ?? 0;
    final p = widget.plan['pfc']['p'].toString();
    final f = widget.plan['pfc']['f'].toString();
    final c = widget.plan['pfc']['c'].toString();
    final meals = widget.plan['meals'] as List<dynamic>? ?? [];

    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).summary(calories),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              S.of(context).summaryAdditional(p, f, c),
              style: const TextStyle(fontSize: 14),
            ),
            const Divider(),
            const SizedBox(height: 16),
            ..._buildListWithAds(meals),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildListWithAds(List<dynamic> meals) {
    List<Widget> items = [];
    for (var i = 0; i < meals.length; i++) {
      items.add(MealItem(meal: meals[i]));

      if (i == 1 && _nativeAdIsLoaded && _nativeAd != null) {
        items.add(
          Container(
            alignment: Alignment.center,
            height: 350,
            margin: EdgeInsets.only(bottom: 12),
            child: AdWidget(ad: _nativeAd!),
          ),
        );
      }
    }
    return items;
  }
}
