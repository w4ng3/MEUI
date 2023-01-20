// Autogenerated from Pigeon (v7.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

class AlertDialogConfig {
  AlertDialogConfig({
    this.title,
    this.content,
    this.confirmText,
    this.cancelText,
  });

  /// 对话框标题
  String? title;

  /// 对话框内容
  String? content;

  /// 确认按钮文案
  String? confirmText;

  /// 取消按钮文案
  String? cancelText;

  Object encode() {
    return <Object?>[
      title,
      content,
      confirmText,
      cancelText,
    ];
  }

  static AlertDialogConfig decode(Object result) {
    result as List<Object?>;
    return AlertDialogConfig(
      title: result[0] as String?,
      content: result[1] as String?,
      confirmText: result[2] as String?,
      cancelText: result[3] as String?,
    );
  }
}

class AlertDialogHostAPI {
  /// Constructor for [AlertDialogHostAPI].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  AlertDialogHostAPI({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = StandardMessageCodec();

  /// 点击确定
  Future<void> onClickConfirm() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.AlertDialogHostAPI.onClickConfirm', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  /// 点击取消
  Future<void> onClickCancel() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.AlertDialogHostAPI.onClickCancel', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }
}
class _AlertDialogFlutterAPICodec extends StandardMessageCodec {
  const _AlertDialogFlutterAPICodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is AlertDialogConfig) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:       
        return AlertDialogConfig.decode(readValue(buffer)!);
      
      default:

        return super.readValueOfType(type, buffer);
      
    }
  }
}

abstract class AlertDialogFlutterAPI {
  static const MessageCodec<Object?> codec = _AlertDialogFlutterAPICodec();

  /// 初始化配置
  void config(AlertDialogConfig config);

  static void setup(AlertDialogFlutterAPI? api, {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.AlertDialogFlutterAPI.config', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.AlertDialogFlutterAPI.config was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final AlertDialogConfig? arg_config = (args[0] as AlertDialogConfig?);
          assert(arg_config != null, 'Argument for dev.flutter.pigeon.AlertDialogFlutterAPI.config was null, expected non-null AlertDialogConfig.');
          api.config(arg_config!);
          return;
        });
      }
    }
  }
}