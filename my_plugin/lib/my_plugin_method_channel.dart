import 'package:flutter/services.dart';
import 'my_plugin_platform_interface.dart';

class MethodChannelMyPlugin extends MyPluginPlatform {
  final MethodChannel _channel = const MethodChannel('my_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await _channel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
