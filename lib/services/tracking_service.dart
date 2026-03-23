import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class TrackingService {
  Future<void> requestATT() async {
    if (!Platform.isIOS) return;

    try {
      var status = await AppTrackingTransparency.trackingAuthorizationStatus;

      if (status == TrackingStatus.notDetermined) {
        await Future.delayed(const Duration(milliseconds: 200));
        status = await AppTrackingTransparency.requestTrackingAuthorization();
      }
      _handleStatus(status);
    } catch (e) {
      debugPrint("ATT Error: $e");
    }
  }

  static void _handleStatus(TrackingStatus status) {
    switch (status) {
      case TrackingStatus.authorized:
        debugPrint("ATT: Access is allowed. The IDFA is available.");
        break;
      case TrackingStatus.denied:
        debugPrint("ATT: The user denied access.");
        break;
      case TrackingStatus.restricted:
        debugPrint("ATT: Access is limited.");
        break;
      case TrackingStatus.notSupported:
        debugPrint("ATT: Not supported on this OS version.");
        break;
      default:
        break;
    }
  }
}
