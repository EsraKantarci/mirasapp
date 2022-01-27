import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid)
      return 'ca-app-pub-5820080661555686/4512621779';
    else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid)
      return "ca-app-pub-5820080661555686/4512621779";
    else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-5820080661555686/4512621779";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}
