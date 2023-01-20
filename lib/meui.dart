
import 'meui_platform_interface.dart';

class Meui {
  Future<String?> getPlatformVersion() {
    return MeuiPlatform.instance.getPlatformVersion();
  }
}
