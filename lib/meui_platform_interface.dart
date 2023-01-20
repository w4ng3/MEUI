import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'meui_method_channel.dart';

abstract class MeuiPlatform extends PlatformInterface {
  /// Constructs a MeuiPlatform.
  MeuiPlatform() : super(token: _token);

  static final Object _token = Object();

  static MeuiPlatform _instance = MethodChannelMeui();

  /// The default instance of [MeuiPlatform] to use.
  ///
  /// Defaults to [MethodChannelMeui].
  static MeuiPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MeuiPlatform] when
  /// they register themselves.
  static set instance(MeuiPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
