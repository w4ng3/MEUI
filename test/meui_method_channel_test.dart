import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meui/meui_method_channel.dart';

void main() {
  MethodChannelMeui platform = MethodChannelMeui();
  const MethodChannel channel = MethodChannel('meui');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
