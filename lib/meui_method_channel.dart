import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'meui_platform_interface.dart';

/// An implementation of [MeuiPlatform] that uses method channels.
class MethodChannelMeui extends MeuiPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('meui');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
