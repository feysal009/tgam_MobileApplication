import 'package:my_plugin/my_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class MyPluginPlatform extends PlatformInterface {
  MyPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static MyPluginPlatform _instance = MethodChannelMyPlugin();

  static MyPluginPlatform get instance => _instance;

  static set instance(MyPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('getPlatformVersion() has not been implemented.');
  }
}
