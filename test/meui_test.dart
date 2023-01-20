import 'package:flutter_test/flutter_test.dart';
import 'package:meui/meui.dart';
import 'package:meui/meui_platform_interface.dart';
import 'package:meui/meui_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMeuiPlatform
    with MockPlatformInterfaceMixin
    implements MeuiPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MeuiPlatform initialPlatform = MeuiPlatform.instance;

  test('$MethodChannelMeui is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMeui>());
  });

  test('getPlatformVersion', () async {
    Meui meuiPlugin = Meui();
    MockMeuiPlatform fakePlatform = MockMeuiPlatform();
    MeuiPlatform.instance = fakePlatform;

    expect(await meuiPlugin.getPlatformVersion(), '42');
  });
}
