import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'behavior_analytics_platform_interface.dart';

class MethodChannelBehaviorAnalytics extends BehaviorAnalyticsPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('behavior_analytics');

  @override
  Future<void> start(String appKey) async {
    try {
      await methodChannel.invokeMethod('start', appKey);
    } on PlatformException {
      throw Exception();
    }
  }

  @override
  Future<String> generateSessionId() async {
    try {
      return await methodChannel.invokeMethod('generate_session_id');
    } on PlatformException {
      throw Exception();
    }
  }

  @override
  Future<void> collectDeviceInfo(String sessionId) async {
    try {
      await methodChannel.invokeMethod('collect_device_info', sessionId);
    } on PlatformException {
      throw Exception();
    }
  }

  @override
  Future<void> stop() async {
    try {
      await methodChannel.invokeMethod('stop');
    } on PlatformException {
      throw Exception();
    }
  }
}
