import Flutter
import UIKit
import CSBehavior

public class BehaviorAnalyticsPlugin: NSObject, FlutterPlugin {
    
    lazy var behavior: CSBehavior? = nil
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "behavior_analytics", binaryMessenger: registrar.messenger())
        let instance = BehaviorAnalyticsPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        
        let arg = call.arguments as? String
        
        switch call.method {
        case "start" :
            behavior = CSBehavior.getInstance(arg)
            result(nil)
        case "generate_session_id":
            result(behavior?.generateSessionId())
        case "collect_device_info":
            behavior?.collectDeviceInformation(arg)
            result(nil)
        case "stop":
            result(nil)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
