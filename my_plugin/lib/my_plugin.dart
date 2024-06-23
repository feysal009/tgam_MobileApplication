import 'package:flutter/services.dart';

class MyPlugin {
  static const MethodChannel _channel = MethodChannel('my_plugin');

  Future<String?> getPlatformVersion() async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> connectToHeadset() async {
    await _channel.invokeMethod('connectToHeadset');
  }
}
