import 'package:behavior_analytics/src/behavior_analytics_platform_interface.dart';

class BehaviorAnalytics {
  static Future<void> start(String appKey) async {
    return BehaviorAnalyticsPlatform.instance.start(appKey);
  }

  static Future<String> generateSessionId() async {
    return BehaviorAnalyticsPlatform.instance.generateSessionId();
  }

  static Future<void> collectDeviceInfo(String sessionId) async {
    return BehaviorAnalyticsPlatform.instance.collectDeviceInfo(sessionId);
  }

  static Future<void> stop() async {
    return BehaviorAnalyticsPlatform.instance.stop();
  }
}
