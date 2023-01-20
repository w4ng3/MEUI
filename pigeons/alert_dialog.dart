import 'package:pigeon/pigeon.dart';

class AlertDialogConfig {
  /// 对话框标题
  String? title;

  /// 对话框内容
  String? content;

  /// 确认按钮文案
  String? confirmText;

  /// 取消按钮文案
  String? cancelText;
}

@HostApi()
abstract class AlertDialogHostAPI {
  /// 点击确定
  void onClickConfirm();

  /// 点击取消
  void onClickCancel();
}

@FlutterApi()
abstract class AlertDialogFlutterAPI {
  /// 初始化配置
  void config(AlertDialogConfig config);
}
