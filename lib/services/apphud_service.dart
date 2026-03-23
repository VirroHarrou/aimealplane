import 'dart:io';
import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_attribution_data.dart';
import 'package:apphud/models/apphud_models/apphud_attribution_provider.dart';
import 'package:apphud/models/apphud_models/apphud_paywall.dart';
import 'package:apphud/models/apphud_models/apphud_product.dart';
import 'package:flutter/foundation.dart';

class ApphudService {
  static const String mainPaywallId = "main_paywall";
  static const String weeklyProductId = "sonicforge_weekly";
  static const String monthlyProductId = "sonicforge_monthly";

  Future<void> init(String apiKey) async {
    await Apphud.start(apiKey: apiKey);
  }

  Future<bool> isPremium() => Apphud.hasActiveSubscription();

  Future<bool> purchase(ApphudProduct product) async {
    final result = await Apphud.purchase(product: product);
    return result.subscription?.isActive ??
        result.nonRenewingPurchase?.isActive ??
        false;
  }

  Future<void> restore() => Apphud.restorePurchases();

  Future<ApphudPaywall?> getMainPaywall() async {
    final res = await Apphud.rawPaywalls();
    return res?.paywalls.firstWhere(
      (p) => p.identifier == mainPaywallId,
      orElse: () => res.paywalls.first,
    );
  }

  String getPriceLabel(ApphudProduct product) {
    if (Platform.isIOS && product.skProduct != null) {
      final price = product.skProduct!.price;
      final currency = product.skProduct!.priceLocale.currencyCode;
      return "$price $currency";
    }
    return '';
  }

  void handleAttribution({
    Map? afData,
    String? firebaseId,
    Map<String, dynamic>? appleSearchAds,
  }) {
    try {
      if (afData != null) {
        Apphud.setAttribution(
          data: ApphudAttributionData(
            rawData: Map<String, dynamic>.from(afData),
          ),
          provider: ApphudAttributionProvider.appsFlyer,
        );
      }
      if (firebaseId != null) {
        Apphud.setAttribution(
          data: ApphudAttributionData(rawData: {'firebase_id': firebaseId}),
          provider: ApphudAttributionProvider.firebase,
        );
      }
      if (appleSearchAds != null) {
        Apphud.setAttribution(
          data: ApphudAttributionData(rawData: appleSearchAds),
          provider: ApphudAttributionProvider.appleAdsAttribution,
        );
      }
    } catch (e) {
      debugPrint("Apphud Attribution Error: $e");
    }
  }
}
