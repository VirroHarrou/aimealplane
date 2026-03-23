import 'package:appsflyer_sdk/appsflyer_sdk.dart';

class AFService {
  final String devKey;
  final String appId;
  late AppsflyerSdk _appsflyerSdk;

  AFService({required this.devKey, required this.appId});

  Future<void> init(Function(Map) onConversionData) async {
    final AppsFlyerOptions options = AppsFlyerOptions(
      afDevKey: devKey,
      appId: appId,
      showDebug: true,
      timeToWaitForATTUserAuthorization: 60,
    );

    _appsflyerSdk = AppsflyerSdk(options);

    _appsflyerSdk.onInstallConversionData((data) => onConversionData(data));

    _appsflyerSdk.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
      registerOnDeepLinkingCallback: true,
    );

    _appsflyerSdk.startSDK(
      onSuccess: () {
        print("AppsFlyer SDK initialized successfully.");
      },
      onError: (int errorCode, String errorMessage) {
        print(
          "Error initializing AppsFlyer SDK: Code $errorCode - $errorMessage",
        );
      },
    );
  }

  Future<bool?> logEvent(String name, {Map<dynamic, dynamic>? params}) {
    return _appsflyerSdk.logEvent(name, params);
  }

  Future<String?> getAppsFlyerUID() async {
    return await _appsflyerSdk.getAppsFlyerUID();
  }
}
