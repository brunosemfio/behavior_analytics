import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'behavior_analytics_method_channel.dart';

abstract class BehaviorAnalyticsPlatform extends PlatformInterface {
  BehaviorAnalyticsPlatform() : super(token: _token);

  static final Object _token = Object();

  static BehaviorAnalyticsPlatform _instance = MethodChannelBehaviorAnalytics();

  static BehaviorAnalyticsPlatform get instance => _instance;

  static set instance(BehaviorAnalyticsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> start(String appKey) {
    throw UnimplementedError('start() has not been implemented.');
  }

  Future<String> generateSessionId() {
    throw UnimplementedError('generateSessionId() has not been implemented.');
  }

  Future<void> collectDeviceInfo(String sessionId) {
    throw UnimplementedError('collectDeviceInfo() has not been implemented.');
  }

  Future<void> stop() {
    throw UnimplementedError('stop() has not been implemented.');
  }
}
