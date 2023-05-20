package sale.clear.behavior_analytics;

import android.content.Context;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import sale.clear.behavior.android.Behavior;
import sale.clear.behavior.android.exceptions.CaptureWasStartedException;
import sale.clear.behavior.android.exceptions.SessionIDAlreadyUsedException;

public class BehaviorAnalyticsPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {

  private MethodChannel channel;

  private Context context;

  private Behavior behavior;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "behavior_analytics");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    switch (call.method) {
      case "start":
        try {
          behavior = Behavior.getInstance(this.context, (String) call.arguments);
          behavior.start();
        } catch (CaptureWasStartedException e) {
          result.error("CAPTURE_ALREADY_STARTED_ERROR", e.getMessage(), null);
        } catch (Exception e) {
          result.error("START_ERROR", e.getMessage(), null);
        }
        break;
      case "generate_session_id":
        try {
          result.success(behavior.generateSessionID());
        } catch (Exception e) {
          result.error("GENERATE_SESSION_ID_ERROR", e.getMessage(), null);
        }
        break;
      case "collect_device_info":
        try {
          behavior.collectDeviceInformation((String) call.arguments);
          result.success(null);
        } catch (SessionIDAlreadyUsedException e) {
          result.error("SESSION_ID_ALREADY_USED_ERROR", e.getMessage(), null);
        } catch (Exception e) {
          result.error("COLLECT_DEVICE_INFO_ERROR", e.getMessage(), null);
        }
        break;
      case "stop":
        behavior.stop();
        result.success(null);
        break;
      default:
        result.notImplemented();
        break;
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
    this.context = binding.getActivity();
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    this.context = null;
  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
    this.context = binding.getActivity();
  }

  @Override
  public void onDetachedFromActivity() {
    this.context = null;
  }
}

